- [Questions and Solutions](#questions-and-solutions)
  
Compare the top ten performing films budget, revenue, runtime with the average budget, revenue, and runtime
  
-- Step 1: Create a Common Table Expression (CTE) to calculate averages
-- - ROUND() is used to make values more readable
-- - AVG() calculates overall averages for runtime, budget, and revenue

WITH average AS (
    SELECT
        ROUND(AVG(runtime)) AS avg_runtime,
        ROUND(AVG(budget)) AS avg_budget,
        ROUND(AVG(revenue)) AS avg_revenue 
    FROM movie m
    FULL JOIN finance f ON m.finance_id = f.finance_id
)

-- Step 2: Select the top 10 grossing movies and compare to averages
-- - CROSS JOIN attaches the single-row CTE values to each result
-- - JOIN movie and finance on shared finance_id
-- - ORDER BY revenue DESC to show top-performing films
-- - LIMIT 10 to return only to the top 10

SELECT 
    m.title, 
    f.budget, 
    m.genre, 
    f.revenue, 
    m.runtime, 
    a.avg_runtime, 
    a.avg_budget, 
    a.avg_revenue
FROM movie m 
JOIN finance f ON m.finance_id = f.finance_id 
CROSS JOIN average a 
ORDER BY revenue DESC
LIMIT 10;

-- Title                         | Budget     | Genre          | Revenue      | Runtime | Avg_Runtime | Avg_Budget | Avg_Revenue
-- -----------------------------|------------|----------------|--------------|---------|-------------|------------|-------------
-- Avatar                       | 237000000  | Action         | 2787965087   | 162     | 111         | 41317104   | 123414291
-- Titanic                      | 200000000  | Drama          | 1845034188   | 194     | 111         | 41317104   | 123414291
-- Avengers                     | 220000000  | Sci-Fi         | 1519557910   | 143     | 111         | 41317104   | 123414291
-- Jurassic World               | 150000000  | Action         | 1513528810   | 143     | 111         | 41317104   | 123414291
-- Furious 7                    | 190000000  | Action         | 1506249360   | 137     | 111         | 41317104   | 123414291
-- Avengers: Age of Ultron      | 280000000  | Action         | 1405403694   | 141     | 111         | 41317104   | 123414291
-- Frozen                       | 150000000  | Animation      | 1274219009   | 102     | 111         | 41317104   | 123414291
-- Iron Man 3                   | 200000000  | Action         | 1215439994   | 130     | 111         | 41317104   | 123414291
-- Minions                      | 74000000   | Family         | 1156730962   | 91      | 111         | 41317104   | 123414291
-- Captain America: Civil War   | 250000000  | Adventure      | 1153304495   | 111     | 111         | 41317104   | 123414291

-- Insights:
-- - All top films have higher-than-average budgets and revenues
-- - Most exceed average runtime
-- - "Avatar" and "Titanic" significantly outperform dataset averages

