# My second capstone

### Gaming Development Startup Analysis

An analysis using the VGChartz.com dataset (source from Kaggle) to gain valuable insights on gaming trends, popular platforms, and top publishers over the past five years, from 2018 to 2022. This information can inform strategic decisions on game development, marketing, and business partnerships, ultimately helping startup developers to succeed in the competitive gaming industry. The analysis will focus on sales figures, platforms, and publishers. Analysis was done in the pgAdmin platform (PostgreSQL) and results were exported into Microsoft Excel to create a Dashboard for visualisation.


### Data Collection, Transformation, Cleaning
- Raw data in .csv format, download from Kaggle
- Using SQLite, convert .csv into .sql and import into pgAdmin platform for Data Cleaning.
- Using SQL to perform data cleaning: remove empty rows, unwanted columns (example: column “pos”), replacing all N/A with NULL, change Data Type, etc
- After Data Cleaning process: 6 tables, 39206 game titles, 3366 Publishers, 8752 Developers and 80 Platforms.


### Entity Relationship Diagram 
![image](https://i.imgur.com/82XdEML.jpg)


### Relational Schema
![image](https://i.imgur.com/748FXI2.jpg)
 
 
### What have I learned from this analysis?
![image](https://i.imgur.com/haBL7c4.jpg)
- Game titles with the highest sales: **Red Dead Redemption 2**, **Call of Duty: Black Ops IIII**, **FIFA 19**
- Publisher with highest game title release: **Nintendo**, **Square Enix**, **Sega**
- Platform with highest game titles release: **NS**, **PC**, **PS4**, **XOne**
- Platform with highest sales: **PS4** *56%*, **XOne** *25%*, **NS**, *14%*
- Popular platform sales record in 4 regions: **PS4**

Recommendations for the upcoming development are as follows
- The ‘actions’ styles of games are more popular.
- Seek cooperation with Nintendo as the game’s main publisher.
- Focus on running the new game on PS (PlayStation) as the main platform.
- Primary target markets are North America and the PAL region.

### Further Improvement (ver. 2.0)
- To analyse popular game titles using scores data.
- To include games genre

Click *[here](https://www.linkedin.com/in/chee-keong-ng-5a5920117/)* for my Linkedin page 
