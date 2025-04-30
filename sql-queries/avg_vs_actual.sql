6. For the top ten performing films compare the budget, revenue, runtime with the averageg budget, revenue, and runtime.
````sql
WITH average as (
SELECT
ROUND(AVG(runtime)) as avg_runtime,
ROUND(AVG(budget)) as avg_budget,
ROUND(AVG (revenue)) as avg_revenue 
FROM movie m FULL JOIN finance f on m.finance_id = f.finance_id)

SELECT m.title, f.budget, m.genre, f.revenue, m.runtime, 
a.avg_runtime, a.avg_budget, a.avg_revenue
FROM movie m 
JOIN finance f ON m.finance_id = f.finance_id 
CROSS JOIN average a 
ORDER BY revenue DESC
LIMIT 10;
````
### Steps: 
- Create a **CTE** (**WITH** average **AS**) to calculate overall averages:
- Use **AVG()** to calculate average runtime, budget, and revenue
- Wrap each in **ROUND()** for easier readability
- Use **AS** to create readable alias names: avg_runtime, avg_budget, and avg_revenue
- **JOIN** movie and finance tables on shared keys
- **SELECT** title, budget, genre, revenue, and runtime from the movie and finance tables
- Include the three average values from the **CTE** (avg_runtime, avg_budget, avg_revenue)
- Use **JOIN** to combine movie and finance on `finance_id
- Use a **CROSS JOIN** to attach the one-row `average` CTE to every result row
- Use **ORDER** BY f.revenue DESC` to show the top-grossing films first
- Use **LIMIT 10** to display only the top 10 movies
  
### Answer:
| title | budget | genre | revenue | runtime | avg_runtime | avg_budget | avg_revenue |
|-------|--------|-------|---------|---------|-------------|------------|-------------|
| Avatar | 237000000 | Action | 2787965087 | 162 | 111| 41317104 | 123414291 |
| Titanic | 200000000 | Drama | 1845034188 | 194 | 111 | 41317104 | 123414291 |
| Avengers | 220000000 | Science Fiction | 1519557910 | 143 | 111 | 41317104 | 123414291 |
| Jurassic World | 150000000 | Action | 1513528810 | 143 | 111 | 41317104 | 123414291 |
| Furious 7 | 190000000 | Action | 1506249360 | 137 | 111 | 41317104 | 123414291 |
| Avengers: Age of Ultron | 280000000 | Action | 1405403694 | 141 | 111 | 41317104 | 123414291 |
| Frozen | 150000000 | Animation | 1274219009 | 102 | 111 | 41317104 | 123414291 |
| Iron Man 3 | 200000000 | Action | 1215439994 | 130 | 111 | 41317104 | 123414291 |
| Minions | 74000000 | Family | 1156730962 | 91 | 111 | 41317104 | 123414291 |
| Captain America: Civil War | 250000000 | Adventure | 1153304495 | 111 | 41317104 | 123414291 |

***
