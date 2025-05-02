- [Question and Solution](#question-and-solution)
  
-- Which production companies financed the top 10 highest-grossing movies? 

SELECT 
    production_id, 
    production_company, 
    production_country, 
    title, 
    genre, 
    budget, 
    revenue
FROM production
JOIN movie ON production.movie_id = movie.movie_id
JOIN finance ON finance.finance_id = movie.finance_id
ORDER BY revenue DESC
LIMIT 10;

-- Production_ID | Production Company      | Country                | Title                          | Genre         | Budget     | Revenue
-- ------------- | ------------------------| ------------------------| ------------------------------ | ------------- | ---------- | ------------
-- 1             | Ingenious Film Partners | United States of America| Avatar                         | Action        | 237000000  | 2787965087
-- 2             | Paramount Pictures      | United States of America| Titanic                        | Drama         | 200000000  | 1845034188
-- 3             | Paramount Pictures      | United States of America| The Avengers                   | Science Fiction| 220000000  | 1519557910
-- 4             | Universal Studios       | United States of America| Jurassic World                 | Action        | 150000000  | 1513528810
-- 5             | Universal Studios       | Japan                   | Furious 7                      | Action        | 190000000  | 1506249360
-- 6             | Marvel Studios          | United States of America| Avengers: Age of Ultron        | Action        | 280000000  | 1405403694
-- 7             | Walt Disney Studios     | United States of America| Frozen                         | Animation     | 150000000  | 1274219009
-- 8             | Marvel Studios          | China                   | Iron Man 3                     | Action        | 200000000  | 1215439994
-- 9             | Universal Pictures      | United States of America| Minions                        | Family        | 74000000   | 1156730962
-- 10            | Marvel Studios          | United States of America| Captain America: Civil War     | Adventure     | 250000000  | 1153304495

-- Insights:
-- - Marvel Studios financed 3 of the top 10 highest grossing films
-- - Universal Studios is the only other studio to appear more than once in the top 10
-- - Only three studios (Marvel, Universal, and Paramount) financed more than one film in the top 10

