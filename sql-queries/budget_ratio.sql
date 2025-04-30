- [Questions and Solutions](#questions-and-solutions)
  
What is the ratio of revenue to budget (ROI) for each of the top 10 movies. Who was the director and lead actor?
  
-- Note: We use DISTINCT to ensure duplicate rows (if any) are removed.

SELECT DISTINCT 
    p.director, 
    p.actor, 
    m.title, 
    f.budget, 
    f.revenue, 
    f.revenue / f.budget AS Ratio
FROM finance f
JOIN movie m ON m.finance_id = f.finance_id
JOIN person p ON p.person_id = m.person_id
ORDER BY Ratio DESC
LIMIT 10;

--Top 10 ROI Movies
-- Director         | Lead Actor        | Title                    | Budget | Revenue     | Ratio
-- ---------------- | ----------------- | ------------------------ | -------|-------------|-------
-- Oren Peli        | Katie Featherston | Paranormal Activity      | 15000  | 193355800   | 12890
-- Daniel Myrick    | Michael C.        | The Blair Witch Project  | 60000  | 248000000   | 4133
-- David Lynch      | Jack Nance        | Eraserhead               | 10000  | 7000000     | 700
-- John Waters      | Divine David      | Pink Flamingos           | 12000  | 6000000     | 500
-- Morgan Spurlock  | Morgan Spurlock   | Super Size Me            | 65000  | 28575078    | 439
-- Travis Cliff     | Cassidy Gifford   | The Gallows              | 100000 | 42664410    | 426
-- Chris Kentis     | Blanchard Ryan    | Open Water               | 130000 | 546667954   | 420
-- Tobe Hooper      | Marilyn Burns     | Texas Chainsaw Massacre  | 85000  | 30859000    | 363
-- David Hand       | Donnie Dunagan    | Bambi                    | 858000 | 267447150   | 311
-- George A. Romero | Duane Jones       | Night of the Living Dead | 114000 | 30000000    | 263

-- Insights:
-- - Paranormal Activity had an ROI over 12,000x its budget
-- - Most top ROI films were low-budget horror or documentary
-- - Bambi is the only animated classic on this high-ROI list
