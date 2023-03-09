/*
	-- [Delete empty row]
	DELETE FROM games
	WHERE title IS NULL
	AND platform IS NULL
	AND publisher IS NULL
	AND developer IS NULL
	AND release_date IS NULL
	AND last_update IS NULL
	AND total_shipped IS NULL
	AND pos IS NULL
	AND total_sales IS NULL
	AND japan_sales IS NULL
	AND na_sales IS NULL
	AND other_sales IS NULL
	AND pal_sales IS NULL
	AND user_score IS NULL
	AND vgchartz_score IS NULL
	AND critic_score IS NULL;

	--[add primary key to games table]
	ALTER TABLE games ADD COLUMN game_id SERIAL PRIMARY KEY;
	
-- [Replace all N/A fields with NULL]

	UPDATE games SET title = NULL WHERE title= 'N/A';
	UPDATE games SET platform = NULL WHERE platform= 'N/A';
	UPDATE games SET publisher = NULL WHERE publisher= 'N/A';
	UPDATE games SET developer = NULL WHERE developer= 'N/A';
	UPDATE games SET release_date = NULL WHERE release_date= 'N/A';
	UPDATE games SET last_update = NULL WHERE last_update= 'N/A';
	UPDATE games SET total_shipped = NULL WHERE total_shipped= 'N/A';
	UPDATE games SET pos = NULL WHERE pos= 'N/A';
	UPDATE games SET total_sales = NULL WHERE total_sales= 'N/A';
	UPDATE games SET japan_sales = NULL WHERE japan_sales= 'N/A';
	UPDATE games SET na_sales = NULL WHERE na_sales= 'N/A';
	UPDATE games SET other_sales = NULL WHERE other_sales= 'N/A';
	UPDATE games SET pal_sales = NULL WHERE pal_sales= 'N/A';
	UPDATE games SET user_score = NULL WHERE user_score = 'N/A';
	UPDATE games SET vgchartz_score = NULL WHERE vgchartz_score= 'N/A';
	UPDATE games SET critic_score = NULL WHERE critic_score= 'N/A';


-- [Remove the last letter 'm' in "xxx_sales" & "total_shipped"]

	UPDATE games SET total_sales = LEFT(total_sales, LENGTH(total_sales)-1);
	UPDATE games SET total_shipped = LEFT(total_shipped, LENGTH(total_shipped)-1);
	UPDATE games SET japan_sales = LEFT(japan_sales, LENGTH(japan_sales)-1);
	UPDATE games SET na_sales = LEFT(na_sales, LENGTH(na_sales)-1);
	UPDATE games SET other_sales = LEFT(other_sales, LENGTH(other_sales)-1);
	UPDATE games SET pal_sales = LEFT(pal_sales, LENGTH(pal_sales)-1);


-- [Multiply 1,000,000 in "xxx_sales" & "total_shipped" columns, to reflect the 'm' as in millions]

	UPDATE games SET total_sales = (total_sales::numeric *1000000) WHERE total_sales IS NOT NULL;
	UPDATE games SET total_shipped = (total_shipped::numeric *1000000) WHERE total_shipped IS NOT NULL;
	UPDATE games SET japan_sales = (japan_sales::numeric *1000000) WHERE japan_sales IS NOT NULL;
	UPDATE games SET na_sales = (na_sales::numeric *1000000) WHERE na_sales IS NOT NULL;
	UPDATE games SET other_sales = (other_sales::numeric *1000000) WHERE other_sales IS NOT NULL;
	UPDATE games SET pal_sales = (pal_sales::numeric *1000000) WHERE pal_sales IS NOT NULL;


-- [Change columns "xxx_sales" & "total_shipped" col, DATA_TYPE from TEXT to NUMERIC, 15 digits, 0 decimal place]

	ALTER TABLE games ALTER COLUMN total_sales TYPE NUMERIC(15,1) USING total_sales::NUMERIC;
	ALTER TABLE games ALTER COLUMN total_shipped TYPE NUMERIC(15,1) USING total_shipped::NUMERIC;
	ALTER TABLE games ALTER COLUMN japan_sales TYPE NUMERIC(15,1) USING japan_sales::NUMERIC;
	ALTER TABLE games ALTER COLUMN na_sales TYPE NUMERIC(15,1) USING na_sales::NUMERIC;
	ALTER TABLE games ALTER COLUMN other_sales TYPE NUMERIC(15,1) USING other_sales::NUMERIC;
	ALTER TABLE games ALTER COLUMN pal_sales TYPE NUMERIC(15,1) USING pal_sales::NUMERIC;
	
	ALTER TABLE games ALTER COLUMN user_score TYPE NUMERIC(4,2) USING user_score::NUMERIC;
	ALTER TABLE games ALTER COLUMN vgchartz_score TYPE NUMERIC(4,2) USING vgchartz_score::NUMERIC;
	ALTER TABLE games ALTER COLUMN critic_score TYPE NUMERIC(4,2) USING critic_score::NUMERIC;

	
-- [Remove the char at Pos3 & Pos4 in columns "release_date" & "last_update"]

	UPDATE games SET release_date = substring("release_date",1,2) || ' ' || substring("release_date",6,6);
	UPDATE games SET last_update = substring("last_update",1,2) || ' ' || substring("last_update",6,6);

	
-- [Change the text format to DD Mon YY into yyyy-mm-dd, in columns "release_date" & "last_update"]

	UPDATE games SET release_date = to_date("release_date", 'DD Mon YY') WHERE "release_date" is not null;
	UPDATE games SET last_update = to_date("last_update", 'DD Mon YY') WHERE "last_update" is not null;

	
----[Change the text format to DD Mon YY into in columns "release_date" & "last_update"]

	ALTER TABLE games ALTER COLUMN release_date SET DATA TYPE DATE USING release_date::DATE;
	ALTER TABLE games ALTER COLUMN last_update SET DATA TYPE DATE USING last_update::DATE;

*/
	----[DELETE unwanted columns: "pos" and "last_update" column]
	--ALTER TABLE games DROP COLUMN pos, DROP COLUMN last_update; 
	

	


/*
----- [ CREATE "publisher" TABLE and id, connect back to main TABLE]
CREATE TABLE publisher(
						pub_id SERIAL NOT NULL PRIMARY KEY,
						pub_name TEXT NOT NULL
						);

INSERT INTO publisher ("pub_name")
    		SELECT DISTINCT (publisher)
			FROM games;

ALTER TABLE games ADD COLUMN pub_id INT;
ALTER TABLE games ADD FOREIGN KEY (pub_id) REFERENCES publisher(pub_id);

UPDATE games SET pub_id = publisher.pub_id
FROM publisher
WHERE games.publisher=publisher.pub_name
; 
	--SELECT * FROM games where pub_id IS NULL;
	--SELECT * FROM publisher
	--ALTER TABLE games DROP COLUMN publisher;
*/


/*
----- [ CREATE "developer" TABLE and id, connect back to main TABLE]
CREATE TABLE developer(
						dev_id SERIAL NOT NULL PRIMARY KEY,
						dev_name TEXT
						);

INSERT INTO developer ("dev_name")
    		SELECT DISTINCT (developer)
			FROM games;

ALTER TABLE games ADD COLUMN dev_id INT;
ALTER TABLE games ADD FOREIGN KEY (dev_id) REFERENCES developer(dev_id);

UPDATE games SET dev_id = developer.dev_id
FROM developer
WHERE games.developer=developer.dev_name
;

----(change the 1) UPDATE games SET dev_id = ? where developer IS NULL;
	--SELECT * FROM games where dev_id IS NULL;
	--SELECT * FROM developer;
	--ALTER TABLE games DROP COLUMN developer;
*/




/*
----- [ CREATE "platform" TABLE and id, connect back to main TABLE]
CREATE TABLE platform(
						plat_id SERIAL NOT NULL PRIMARY KEY,
						plat_name TEXT NOT NULL
						);

INSERT INTO platform ("plat_name")
    		SELECT DISTINCT (platform)
			FROM games;

ALTER TABLE games ADD COLUMN plat_id INT;
ALTER TABLE games ADD FOREIGN KEY (plat_id) REFERENCES platform(plat_id);

UPDATE games SET plat_id = platform.plat_id
FROM platform
WHERE games.platform=platform.plat_name
;

----(change the 1) UPDATE games SET plat_id = ? where platform IS NULL;
	--SELECT * FROM games where plat_id IS NULL;
	--SELECT * FROM platform;
	--ALTER TABLE games DROP COLUMN platform;
*/






-----[ Begin "sales" table ]-----
/*
		CREATE TABLE sales
							(
								sales_id SERIAL NOT NULL PRIMARY KEY,
								total_sales NUMERIC(15,1),
								japan_sales NUMERIC(15,1),
								na_sales NUMERIC(15,1),
								other_sales NUMERIC(15,1),
								pal_sales NUMERIC(15,1)
							);
							
		UPDATE games SET total_sales = 0.1 WHERE total_sales IS NULL;
		UPDATE games SET japan_sales = 0.1 WHERE japan_sales IS NULL;
		UPDATE games SET na_sales = 0.1 WHERE na_sales IS NULL;
		UPDATE games SET other_sales = 0.1 WHERE other_sales IS NULL;
		UPDATE games SET pal_sales = 0.1 WHERE pal_sales IS NULL;

		INSERT INTO sales ("total_sales", "japan_sales", "na_sales", "other_sales", "pal_sales")
    						SELECT DISTINCT total_sales, japan_sales, na_sales, other_sales, pal_sales
							FROM games;

		--ALTER TABLE games ADD COLUMN sales_id INT;
		--ALTER TABLE games ADD FOREIGN KEY (sales_id) REFERENCES sales(sales_id);
*/
/*	
		UPDATE games SET sales_id = sales.sales_id
 					FROM sales
					WHERE 	games.total_sales	=sales.total_sales
					AND 	games.japan_sales	=sales.japan_sales
					AND 	games.na_sales		=sales.na_sales
					AND 	games.other_sales	=sales.other_sales
					AND 	games.pal_sales		=sales.pal_sales
					; 
*/

/*
		--[Inside "sales" table, 0.1 back to NULL, and NUMERIC(15) ]
		UPDATE sales SET total_sales = NULL WHERE total_sales = 0.1;
		ALTER TABLE sales ALTER COLUMN total_sales SET DATA TYPE NUMERIC (15,0);
		UPDATE sales SET japan_sales = NULL WHERE japan_sales = 0.1;
		ALTER TABLE sales ALTER COLUMN japan_sales SET DATA TYPE NUMERIC (15,0);
		UPDATE sales SET na_sales = NULL WHERE na_sales = 0.1;
		ALTER TABLE sales ALTER COLUMN na_sales SET DATA TYPE NUMERIC (15,0);			
		UPDATE sales SET other_sales = NULL WHERE other_sales = 0.1;
		ALTER TABLE sales ALTER COLUMN other_sales SET DATA TYPE NUMERIC (15,0);								
		UPDATE sales SET pal_sales = NULL WHERE pal_sales = 0.1;
		ALTER TABLE sales ALTER COLUMN pal_sales SET DATA TYPE NUMERIC (15,0);	
*/					
/*		
		ALTER TABLE games DROP COLUMN total_sales, DROP COLUMN japan_sales, 
					DROP COLUMN na_sales, DROP COLUMN other_sales, DROP COLUMN pal_sales;
*/		
		
	
/* [Checking script]
SELECT game_id, title, total_sales, japan_sales, na_sales, other_sales, pal_sales, sales_id
FROM games
WHERE sales_id IS NULL;
SELECT * FROM games;
*/



/*

*/


---- [ Begin "score" table ]
/*
		CREATE TABLE score
							(
								score_id SERIAL NOT NULL PRIMARY KEY,
								user_score NUMERIC(4,2),
								vgchartz_score NUMERIC(4,2),
								critic_score NUMERIC(4,2)
							);

		-----[ SCORE, NULL BECOME 0.01]
		UPDATE games SET user_score = 0.01 WHERE user_score IS NULL;
		UPDATE games SET vgchartz_score = 0.01 WHERE vgchartz_score IS NULL;
		UPDATE games SET critic_score = 0.01 WHERE critic_score IS NULL;

		INSERT INTO score ("user_score", "vgchartz_score", "critic_score")
    						SELECT DISTINCT user_score, vgchartz_score, critic_score
							FROM games;
*/
		--ALTER TABLE games ADD COLUMN score_id INT;
		--ALTER TABLE games ADD FOREIGN KEY (score_id) REFERENCES score(score_id);

/*		
		UPDATE games SET score_id = score.score_id
 					FROM score
					WHERE 	games.user_score	=score.user_score
					AND 	games.vgchartz_score=score.vgchartz_score
					AND 	games.critic_score	=score.critic_score
					; 
*/

/*
		--[Inside "score" table, 0.01 back to NULL, and NUMERIC(4,1) ]
		UPDATE score SET user_score 	= NULL WHERE user_score = 0.01;
		UPDATE score SET vgchartz_score = NULL WHERE vgchartz_score = 0.01;
		UPDATE score SET critic_score 	= NULL WHERE critic_score = 0.01;
		
		ALTER TABLE score ALTER COLUMN user_score SET DATA TYPE NUMERIC (4,1);
		ALTER TABLE score ALTER COLUMN vgchartz_score SET DATA TYPE NUMERIC (4,1);
		ALTER TABLE score ALTER COLUMN critic_score SET DATA TYPE NUMERIC (4,1);
*/

------[Drop columns from MAIN TABLE]
-- ALTER TABLE games DROP COLUMN user_score, DROP COLUMN vgchartz_score, DROP COLUMN critic_score;

-------[Checking scripts]
-- select * from games where score_id IS NULL ;






------ (End of script)

--SELECT * FROM games where total_shipped IS NOT NULL AND release_date IS NOT NULL;
--SELECT * FROM publisher;
--SELECT * FROM developer where dev_name IS NOT NULL;
--SELECT * FROM platform;
--SELECT * FROM sales;
--SELECT * FROM score;


