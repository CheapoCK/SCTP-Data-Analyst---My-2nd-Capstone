
-------------------------------------------------------------------------
-- [Q1]: Games titles with the highest total sales, from Year 2018 to 2022.
-------------------------------------------------------------------------
/*
SELECT 	title 				AS game_title, 
		SUM(total_sales) 	AS total_sales
FROM games
INNER JOIN sales
	ON sales.sales_id = games.sales_id
WHERE release_date IS NOT NULL
	AND total_sales IS NOT NULL
	AND release_date >= '2018-01-01' 
	AND release_date <= '2022-12-31' 
GROUP BY title
ORDER BY 2 DESC
LIMIT 10;


-------------------------------------------------------------------------------
-- [Q2]: Publishers with the highest game titles released, from Year 2018 to 2022.
-------------------------------------------------------------------------------

/*
SELECT pub_name AS publisher, 
		count (distinct(title)) AS No_of_game_titles_released
FROM games
INNER JOIN publisher
	ON games.pub_id = publisher.pub_id
WHERE pub_name != 'Unknown'
	AND release_date >= '2018-01-01' 
	AND release_date <= '2022-12-31' 
GROUP BY pub_name
ORDER BY 2 DESC
LIMIT 10;
*/

---------------------------------------------------------------------------------------
-- [Q3]: Top 5 Platforms with the highest game titles released , from Year 2018 to 2022.
---------------------------------------------------------------------------------------
/*
SELECT plat_name AS platform, 
		count (distinct(title)) AS No_of_game_titles_released
FROM games
INNER JOIN platform
	ON games.plat_id = platform.plat_id
WHERE release_date >= '2018-01-01' 
AND release_date <= '2022-12-31' 

GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
*/

-----------------------------------------------------------------------
-- Q4: Platforms with the highest Total Sales, from Year 2018 to 2022.
-----------------------------------------------------------------------
/*
SELECT plat_name 		AS platform, 
	sum(total_sales) 	AS total_sales
FROM games
INNER JOIN sales
	ON sales.sales_id = games.sales_id
INNER JOIN platform
	ON games.plat_id = platform.plat_id
WHERE total_sales IS NOT NULL
AND release_date >= '2018-01-01' 
AND release_date <= '2022-12-31' 
GROUP BY plat_name
ORDER BY 2 DESC
LIMIT 10;
*/

------------------------------------------------------------------------------
-- Q5: Popular platforms with total sales in 4 regions, from Year 2018 to 2022.
-----------------------------------------------------------------------------
/*
SELECT plat_name 		AS platform, 
	sum(japan_sales) 	AS japan_sales,
	sum(na_sales) 		AS na_sales,
	sum(pal_sales) 		AS pal_sales,
	sum(other_sales) 	AS other_sales
FROM games
INNER JOIN sales
	ON sales.sales_id = games.sales_id
INNER JOIN platform
	ON games.plat_id = platform.plat_id
WHERE release_date >= '2018-01-01' 
AND release_date <= '2022-12-31'
AND plat_name = 'NS'
OR plat_name = 'XOne'
OR plat_name = 'PS4'
GROUP BY plat_name
ORDER by 2 DESC;
*/

------------------------------------------------------------------------------
-- Q6: TESTING, from Year 2018 to 2022.
-----------------------------------------------------------------------------


/*

WITH top_title AS(
SELECT 		title,
			games.game_id,
			SUM(total_sales)
FROM games
INNER JOIN sales
	ON sales.sales_id = games.sales_id
WHERE release_date IS NOT NULL
	AND total_sales IS NOT NULL
	AND release_date >= '2018-01-01' 
	AND release_date <= '2022-12-31' 
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 1 OFFSET 1)

SELECT user_score, vgchartz_score, critic_score 
FROM games
join score
	on games.score_id = score.score_id
	where game_id =  (select game_id from top_title)
	*/
	




