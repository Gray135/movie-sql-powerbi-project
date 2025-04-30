- [Question and Solution](#question-and-solution)
4. Calculate the average genre revenue and budget to compare to the movie buget in the genre. We've limited it to the first 10 entries in our table. 
   
````sql
WITH avg_genre AS (
    SELECT 
        m.genre, 
        ROUND(SUM(f.revenue) / COUNT(m.genre)) AS avg_genre_revenue,
        ROUND(SUM(f.budget) / COUNT(m.genre)) AS avg_genre_budget
    FROM movie m 
    FULL JOIN finance f ON m.finance_id = f.finance_id
    GROUP BY m.genre
)

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
````
### Steps: 
- Create a **CTE*** named avg_genre that uses aggregate functions **SUM**(), **COUNT**(), and **ROUND**().
- Calculate avg_genre_revenue by taking **SUM**(f.revenue) and dividing it by **COUNT**(m.genre).
- Wrap it in **ROUND**() to make it easier to read.
- Calculate avg_genre_budget by taking **SUM**(f.budget) divided by **COUNT**(m.genre), also wrapped in **ROUND**().
- Use a **FULL JOIN** to connect the movie and finance tables using m.finance_id = f.finance_id.
- Group the results by m.genre to ensure averages are calculated per genre.
- Write the main **SELECT** statement to pull relevant columns:
- From the movie table: movie_id, title, genre
- From the finance table: budget, revenue
- From the **CTE**: ag.avg_genre_revenue, ag.avg_genre_budget
- **JOIN** the **CTE** avg_genre with the movie table on genre.
- **JOIN** the finance table using m.finance_id = f.finance_id.
- **LIMIT** the output using LIMIT 10 to preview the results.

### Answer:
| movie_id | title | genre | budget | revenue | avg_genre_revene | avg_budget_revenue |
|----------|-------|-------|--------|---------|------------------|--------------------|
| 1 | Avatar | Action| 237000000 | 2787965087 | 157062016 | 58733286 |
| 2 | Pirates of the Caribbean: At World's End | Adventure | 3000000000 | 961000000 | 248512161 | 76036274 |
| 3 | Spectre | Action | 245000000 | 880674609 | 157062016 | 58733286 |
| 4 | The Dark Knight Rises | Action | 2500000000 | 1084939099 | 157062016 | 58733286 |
| 5 | John Carter | Action | 260000000 | 284139100 | 157062016 | 58733286 |
| 6 | Spider-Man 3 | Fantasy | 258000000 | 890871626 | 187441668 | 64894932 |
| 7 | Tangled | Animation | 260000000 | 591794936 | 301965829 | 83330943 |
| 8 | Avengers: Age of Ultron | Action | 280000000 | 1405403694 | 157062016 | 58733286 |
| 9 | Harry Potter and the Half-Blood Prince | Adventure | 250000000 | 933959197 | 248512161 | 76036274 |
| 10 | Batman v Superman: Dawn of Justice | Action | 250000000 | 873260194 | 157062016 | 58733286 |

***
