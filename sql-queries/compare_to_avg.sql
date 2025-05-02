- [Question and Solution](#question-and-solution)
   
How do the top 10 movies' revenue and budget compare to the average revenue and budget per genre?
   
-- Step 1: Create a CTE to calculate average genre revenue and budget
-- Use a Common Table Expression (CTE) to find the average revenue and budget for each movie genre.
-- Join the CTE data back to the movie and finance tables to compare individual movie performance to genre benchmarks.
   
WITH avg_genre AS (
    SELECT 
        m.genre, 
        ROUND(SUM(f.revenue) / COUNT(m.genre)) AS avg_genre_revenue,
        ROUND(SUM(f.budget) / COUNT(m.genre)) AS avg_genre_budget
    FROM movie m 
    FULL JOIN finance f ON m.finance_id = f.finance_id
    GROUP BY m.genre
)

-- Step 2: Join the CTE with movie and finance data
-- - This allows us to show each movie's revenue and budget alongside the average for its genre
-- - LIMIT 10 used to preview a sample of results

SELECT 
    m.movie_id, 
    m.title, 
    m.genre, 
    f.budget, 
    f.revenue, 
    ag.avg_genre_revenue, 
    ag.avg_genre_budget
FROM avg_genre ag
JOIN movie m ON ag.genre = m.genre
JOIN finance f ON f.finance_id = m.finance_id
LIMIT 10;

-- Movie_ID | Title                              | Genre       | Budget     | Revenue      | Avg_Genre_Revenue | Avg_Genre_Budget
-- -------- | ---------------------------------- | ----------- | ---------- | ------------ | ------------------| ------------------
-- 1        | Avatar                             | Action      | 237000000  | 2787965087   | 157062016         | 58733286
-- 2        | Pirates of the Caribbean: At World's End | Adventure | 3000000000 | 961000000    | 248512161         | 76036274
-- 3        | Spectre                            | Action      | 245000000  | 880674609    | 157062016         | 58733286
-- 4        | The Dark Knight Rises              | Action      | 2500000000 | 1084939099   | 157062016         | 58733286
-- 5        | John Carter                        | Action      | 260000000  | 284139100    | 157062016         | 58733286
-- 6        | Spider-Man 3                       | Fantasy     | 258000000  | 890871626    | 187441668         | 64894932
-- 7        | Tangled                            | Animation   | 260000000  | 591794936    | 301965829         | 83330943
-- 8        | Avengers: Age of Ultron            | Action      | 280000000  | 1405403694   | 157062016         | 58733286
-- 9        | Harry Potter and the Half-Blood... | Adventure   | 250000000  | 933959197    | 248512161         | 76036274
-- 10       | Batman v Superman: Dawn of Justice | Action      | 250000000  | 873260194    | 157062016         | 58733286

-- Insights:
-- - Most top-performing movies have budgets far above their genre's average
-- - Action and Adventure dominate among high-spend, high-return films
-- - Comparing individual films to genre averages helps find outliers
