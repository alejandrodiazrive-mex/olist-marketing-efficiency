/* BUSINESS CASE: Deal Efficiency Matrix (Post-Sales Analysis)
GOAL: Analyze closed deals to see which types deliver the best Return on Time Invested.
NOTE: We focus on Won Deals only, as 'lead_type' is undefined for lost leads.
*/

WITH deal_analysis AS (
    SELECT 
        m.origin,
        c.lead_type,
        COUNT(c.mql_id) as won_deals,
        -- Sales Velocity (Speed)
        ROUND(AVG(c.won_date::date - m.first_contact_date::date), 1) as avg_days_to_close,
        -- Lead Quality Score (Value Proxy)
        CASE 
            WHEN c.lead_type IN ('online_top', 'online_big', 'industry') THEN 90 -- High Revenue Potential
            WHEN c.lead_type IN ('online_medium', 'offline') THEN 70 -- Mid Revenue Potential
            WHEN c.lead_type IN ('online_small', 'online_beginner') THEN 40 -- Low Revenue Potential
            ELSE 40
        END as quality_score
    FROM olist_mql m
    INNER JOIN olist_closed c ON m.mql_id = c.mql_id -- Only analyze closed deals
    GROUP BY 1, 2, c.lead_type
),
efficiency_scoring AS (
    SELECT 
        origin,
        lead_type,
        won_deals,
        avg_days_to_close,
        quality_score,
        -- EFFICIENCY INDEX = Value / Time
        -- Measures "Points of Value per Day of Sales Effort"
        ROUND(quality_score / NULLIF(avg_days_to_close, 0) * 100, 1) as efficiency_index
    FROM deal_analysis
    WHERE won_deals > 5 -- Statistical significance
)
SELECT 
    origin,
    lead_type,
    avg_days_to_close || ' days' as sales_cycle,
    efficiency_index,
    -- STRATEGIC QUADRANTS (Adjusted for Reality)
    CASE 
        -- Quadrant 1: High Value & Fast (The Dream)
        WHEN quality_score >= 70 AND avg_days_to_close < 45 THEN '⭐️ HIGH VALUE: Protect & Scale'
        
        -- Quadrant 2: High Value but Slow (Needs Optimization)
        WHEN quality_score >= 70 AND avg_days_to_close >= 45 THEN '⚠️ QUALITY BUT SLOW: Process Opt.'
        
        -- Quadrant 3: Low Value but Fast (Quick Wins)
        WHEN quality_score < 70 AND avg_days_to_close < 40 THEN '🤖 TRANSACTIONAL: Automate'
        
        -- Quadrant 4: Low Value & Slow (The Trap)
        ELSE '⛔️ LOW RETURN: Review for Elimination'
    END as strategic_action
FROM efficiency_scoring
ORDER BY efficiency_index DESC;