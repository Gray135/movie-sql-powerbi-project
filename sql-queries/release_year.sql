7. What is the runtime, release year, and runtime of the top ten grossing films?
````sql
SELECT m.title, m.release_year, f.revenue, m.genre, p.production_company, p.production_country
FROM movie m
JOIN finance f
ON m.finance_id = f.finance_id
JOIN production p
ON p.movie_id = m.movie_id
ORDER BY f.revenue DESC
LIMIT 10;
````
### Steps: 
-**SELECT** columns from the finance, movie, and production tables.
-**JOIN** the movie and finance tables on shared keys. 
-**JOIN** the production and movie tables on shared keys.
-**ORDER** BY revenue DESC 
-**LIMIT** 10 

### Answer:
| title | release_year | revenue | genre | production_company | production_country |
|-------|--------------|---------|-------|--------------------|--------------------|
| Avatar | 2009 | 2787965087 | Action | Ingenious Film Partners | United States of America |
| Titanic | 1997 | 1845034188 | Drama | Paramount Pictures | United States of America |
| The Avengers | 2012 | 1519557910 | Science Fiction | Paramount Pictures | United States of America |
| Jurassic World | 2015 | 1519557910 | Action | Universal Studios | United States of America |
| Furious 7 | 2015 | 1506249360 | Action | Universal Studios | Japan |
| Avengers: Age of Ultron | 2015 | 1405403694 |Action | Marvel Studios | United States of America |
| Frozen | 2013 | 1274219009 | Animation | Walt Disney Pictures | United States of America | 
| Iron Man 3 | 2013 | 1215439994 | Action | Marvel Studios | China |
| Minions | 2015 | 1156730962 | Family | Universal Pictures | United States of America |
| Captain America: Civil War | 2016 | 115330495 | Adventure | Marvel Studios | United States of America |
