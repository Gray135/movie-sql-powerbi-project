5. For the top 10 performing films what production companies finances the films? Is there a production company who financed multiple films in the top 10?
````sql
SELECT production_id, production_company, production_country, title, genre, budget, revenue
FROM proudction
JOIN movie ON production.movie_id = movie.movie_id
JOIN finance ON finance.finance_id = movie.finance_id
ORDER BY revenue DESC
LIMIT 10;
````
### Steps: 
- Start with the **SELECT** Statement and decide what columns to return.
- Undwe **FROM** **JOIN** related tables based on shared keys.
- Add an **ORDER BY** and sort the results so the most successful movies appear first:
  First by revenue **DESC** (highest grossing)
  Then by budget **ASC** (lowest cost to break ties)
-**LIMT** the output. 

### Answer: 
| production_id | production_company | production_country | title | genre | budget | revenue |
|---------------|--------------------|--------------------|-------|-------|--------|---------|
| 1 | 9511 | Ingenious Film Partners | United Statets of America | Avatar | Action | 237000000 | 2787965087 |
| 2 | 9536 | Paramount Pictures | United States of America | Titanic | Drama | 200000000 | 1845034188 |
| 3 | 9527 | Paramount Pictures | United States of America | The Avengers | Science Fiction | 220000000 | 1519557910 |
| 4 | 9539 | Universal Studios | United States of America | Jurassic World | Action | 150000000 | 1513528810 |
| 5 | 9555 | Universal Studios | Japan | Furious 7 | Action | 190000000 | 1506249360 |
| 6 | 9518 | Marvel Studios | United States of America | Avengers: Age of Ultron | Action | 280000000 | 1405403694 |
| 7 | 9634 | Walt Disney Studios | United States of America | Frozen | Animation | 150000000 | 1274219009 |
| 8 | 9542 | Marvel Studios | China | Iron Man 3 | Action | 200000000 | 1215439994 |
| 9 | 10036 | Universal Pictures | United States of America | Minions | Family | 740000000 | 1156730962 |
| 10 | 9537 | Marvel Studios | United States of America | Captain America: Civil War | Adventure | 250000000 | 1153304495 |

***

