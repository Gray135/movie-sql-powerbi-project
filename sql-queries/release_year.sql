- [Question and Solution](#question-and-solution)
  
-- What is the runtime, release year, and genre of the top 10 highest-grossing films? Make sure to include the production company and country. 
  
SELECT 
    m.title, 
    m.release_year, 
    f.revenue, 
    m.genre, 
    p.production_company, 
    p.production_country
FROM movie m
JOIN finance f ON m.finance_id = f.finance_id
JOIN production p ON p.movie_id = m.movie_id
ORDER BY f.revenue DESC
LIMIT 10;

-- Title                          | Release Year | Revenue      | Genre           | Production Company        | Country
-- ----------------------------- | -------------| -------------| ----------------| --------------------------| -------------------------
-- Avatar                         | 2009         | 2787965087   | Action          | Ingenious Film Partners   | United States of America
-- Titanic                        | 1997         | 1845034188   | Drama           | Paramount Pictures        | United States of America
-- The Avengers                   | 2012         | 1519557910   | Science Fiction | Paramount Pictures        | United States of America
-- Jurassic World                 | 2015         | 1519557910   | Action          | Universal Studios         | United States of America
-- Furious 7                      | 2015         | 1506249360   | Action          | Universal Studios         | Japan
-- Avengers: Age of Ultron        | 2015         | 1405403694   | Action          | Marvel Studios            | United States of America
-- Frozen                         | 2013         | 1274219009   | Animation       | Walt Disney Pictures      | United States of America
-- Iron Man 3                     | 2013         | 1215439994   | Action          | Marvel Studios            | China
-- Minions                        | 2015         | 1156730962   | Family          | Universal Pictures        | United States of America
-- Captain America: Civil War     | 2016         | 115330495    | Adventure       | Marvel Studios            | United States of America

-- Insights:
-- - 2015 was a dominant year with 4 of the top 10 films
-- - Marvel Studios appears 3 times, all after 2012
-- - Most top-grossing films were produced in the United States
