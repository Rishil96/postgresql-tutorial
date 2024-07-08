# Structured Query Language

| Sr. No. | Topic |
|:---:|:---:|
| 1 | [SQL Basics](#1) |
| 2 | [Filtering](#2) |
| 3 | [Grouping](#3) |
| 4 | [Functions](#4) |
| 5 | [Conditional Expressions](#5) |
| 6 | [Joins](#6) |


<a id="1"></a>

## SQL Basics

- **SQL** is a language to interact with databases.
- **Database** is a collection of data.
- **Schema** is an additional layer that provides structure to the data/tables.
- **DBMS** is a software that helps us manage databases. acts like an interface between user and database.
- All DBMS have different dialects (meaning slight changes in the way we write queries).
- PostgreSQL is the closest to standard SQL and most flexible.

- **Select** : used to select and return data.

- **Order by** : used to order the data alphabetically, numerically, chronologically, etc.

- **Select Distinct** : used to select and display unique values of a single or multiple columns.

- **Limit** : used to limit the output rows to a number that we specify. Syntax is easy as it always comes at the end of query.

- **Count** : used to count the number of rows in a column, table. Does not count NULL values.


<a id="2"></a>

## Filtering

- **WHERE Clause** is used the filter data in the output. comes immediately after FROM statement.

- **BETWEEN Clause** is used to specify a range of values between which if exists we want to get it.

- **IN Clause** is used to give a list of values to search for in a column.

- **LIKE Clause** is used to match a pattern in a given column. Use ILIKE for case insensitive results.
    - **_** : used to match any single character.
    - **%** : any sequence of characters.


<a id="3"></a>

## Grouping

- **Aggregate Functions** are used to aggregate data from multiple rows into a single row. e.g. Sum, Average, Count, etc.

- Most common aggregate functions: SUM, MIN, MAX, AVG, COUNT.

- **Group By** used to group the aggregated results by a specific column or columns. Every column used while writing a group by query must be either present in GROUP BY clause or in the aggregate function or else it won't work. Also GROUP BY usually comes right after FROM table but we can also use it after WHERE clause.

- **Having** is used in group by statements to filter by aggregations. So WHERE clause filters by normal rows and HAVING clause filters by aggregated rows. Having can only be used with Group by and right after Group by statement.


<a id="4"></a>

## Functions

- **LOWER**: convert text to lower case
- **UPPER**: convert text to upper case
- **LENGTH**: length of text
- **LEFT**: extract characters from left side of text by n characters.
- **RIGHT**: extract characters from right side of text by n characters.
- Use **||** symbol to concatenate 2 or more string/text.
- **POSITION**: POSITION('char' IN 'column_name') will return the character index that we are trying to search for. We can also search for a text in another text, e.g. last name from email, and it will return the starting point of last_name in the email string.
- **SUBSTRING**: extracts part of the string by taking 3 arguments, 1. column_name/string, 2. starting position and 3. how many characters do we want in substring (optional, if we don't provide we get result till the end of og string).
- Syntax for SUBSTRING IS **SUBSTRING(column_name FROM start_position FOR length/no. of characters)** 

- **EXTRACT**: used to extract parts of a timestamp/date.
- Syntax for EXTRACT is **EXTRACT(field FROM date/time/interval column)

- **TO_CHAR**: used to get custom formats from timestamp, dates, numbers, etc.
- Syntax: TO_CHAR(date/timestamp/interval, format)

- **CURRENT_DATE**: get current date
- **CURRENT_TIMESTAMP**: get current timestamp


<a id="5"></a>

## Conditional Expressions

- common mathematical operations are +, -, *, /, %, ^
- some functions are abs, round, ceiling, floor.

- **CASE WHEN** : works like IF THEN.
- Syntax: 
```
    CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
    END
```
- gives back the result of the first true condition from all WHEN cases.

- **COALESCE** : takes 2 or more values as input parameters and returns the first non-null value.

- **CAST** : used to change the datatype of a value.

- **REPLACE** : replace text from a string in a column with another string. Syntax: `REPLACE(column, old_text, new_text)`


<a id="6"></a>

## Joins