- [Question and Solution](#question-and-solution)
3. Let's look at movie genres/ What is the average budget and revenue for each genre? Also what is the overall budget and revenue for each genre?
   
````sql
SELECT m.genre, COUNT(m.genre) AS genre_count, SUM(f.revenue) AS total_revenue, SUM(f.budget) as total_budget, ROUND(SUM(f.revenue)/COUNT(m.genre)) AS avg_genre_revenue, ROUND(SUM(f.budget)?COUNT(m.genre)) AS avg_genre_budget
FROM movie m FULL JOIN finance f ON m.finance_id = f. finance_id
GROUP BY m.genre
ORDER BY total_revenue DESC
LIMIT 10;
````
### Steps: 
- Use **COUNT** function to count genre in the movie table
- Use **SUM** function to find the sum of budget in the financial table.
- Use **SUM** function to find the sum of the revenue in the financial table.
- Divide the **SUM** of revenue by the **COUNT** of genre. Wrap this in a **ROUND** function.
- Divide the **SUM** of budget by the **COUNT** of genre. Wrap this in a **ROUND** function.
- **FULL JOIN** the finance and movie tables ON m.finance_id = f.finance_id
- Use **GROUP BY** to group results my genre and ORDER BY total_revenue DESC
- Use **LIMIT** 10 to limit to ten rows.

### Answer:
| genre | genre _count | total_revenue | total_budget | avg_genre_revenue | avg_genre_budget |
|-------|--------------|---------------|--------------|-------------------|------------------|
| Action | 582 | 91410093341| 34182772285 | 157062016 | 58733286|
| Adventure | 285 | 70825965880 | 21670338087 | 248512161 | 76036274 |
| Drama | 727 | 54071812901 | 19654899101 | 74376634 | 27035625 |
| Comedy | 620 | 52949486321 | 17295174517 | 85402397 | 27895443 |
| Animation | 98 | 29592651289| 8166432353 | 301965829 | 83330942 |
| Fantasy | 91 | 17057191752 | 5905438823 | 187441668 | 64894932 |
| Science Fiction | 79 | 16176309703 | 4631307003 | 204763414 | 58624139| 
| Horror | 196 | 13242095127 | 3216536235 | 67561710 | 16410899 |
| Thriller | 116 | 11687045798 | 4504020000 | 100750395 | 388277759 |
| Crime | 141 | 9408596694 | 3886096953 | 66727636 | 27560971 |

***

