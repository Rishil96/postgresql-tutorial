# Structured Query Language

| Sr. No. | Topic |
|:---:|:---:|
| 1 | [SQL Basics](#1) |
| 2 | [Filtering](#2) |
| 3 | [Grouping](#3) |
| 4 | [Functions](#4) |
| 5 | [Conditional Expressions](#5) |
| 6 | [Joins](#6) |
| 7 | [Union & Subqueries](#7) |
| 8 | [Managing Tables and Databases](#8) |
| 9 | [Views and Data Manipulation](#9) |
| 10 | [Window Functions](#10) |
| 11 | [Grouping Sets, Rollups, Self-Joins](#11) |


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

- combine information from multiple tables in one query.
- needs a reference column which is a common column on which we will join tables.

- **INNER JOIN**: only rows that appear in both tables will be part of inner join result.
- Syntax: 
```
SELECT * FROM tableA
INNER JOIN tableB
ON tableA.id = tableB.id
```
- **FULL OUTER JOIN**: we get all of the rows from both tables.

- **LEFT OUTER JOIN**: we get all of the rows from left 
table.

- **RIGHT OUTER JOIN**: we get all of the rows from right table.

- Syntax to join on multiple conditions:-
```
SELECT * FROM tableA
INNER JOIN tableB
ON tableA.first_name = tableB.first_name AND tableA.last_name = tableB.last_name
```


<a id="7"></a>

## UNION and Subqueries

- union is combining the output of 2 select statements.
- Syntax: 
```
SELECT first_name, sales FROM delhi
UNION
SELECT first_name, sales FROM vancouver
```
- 3 things to remember are:-
    - 2 table's output is appended below the first table's output. (important to have all the columns in same order)
    - datatypes must match and no. of columns must also match.
    - duplicates are decoupled so no duplicates will be present in output. (Use UNION ALL to allow duplicates)

- **Subquery**: is a query within a query. Imagine if we want to get the results from a table such that we only want the rows with column A having values higher than average.
Here 2 queries are needed, first to calculate average and second to filter using WHERE and use that average.
To achieve this, we use subqueries.

- Syntax is to simply place the subquery in brackets and in the place where we want the value to appear.
- Use comparison operators when subquery returns a single value and use IN operator when subquery returns a list of values.

- Subquery in WHERE clause : creates a filter based on subquery
```
SELECT * FROM table
WHERE (subquery)
```

- Subquery in FROM clause : creates a table based on subquery from which we query further
```
SELECT * FROM (subquery)
AS subquery_name
```

- Subquery in SELECT clause : creates a column based on subquery
```
SELECT *, (subquery)
FROM table
```

- **Correlated Subquery**: are subqueries with additional conditions that have dependency on the main query. Meaning the subquery cannot be executed by itself, it is in some form using a value from the main query. These can be used in WHERE and SELECT clause.
```
WHERE CLAUSE CORRELATED SUBQUERY

SELECT 
*
FROM payment p1
WHERE amount = 
    (
        SELECT 
        MAX(amount) 
        FROM payment p2
        WHERE p1.customer_id = p2.customer_id
    )
ORDER BY customer_id;
```
- In above query snippet, we filter the payment table by the transactions in which a customer paid their highest amount.
- So main query is simple, we simply use select and form the where condition in which we compare amount with the max amount for that customer.
- Now the role of the subquery is to bring the max amount of that customer on the row the query is running on. So suppose on the current row we have customer id 123 in main query, we will use that to filter out our table in subquery to find the max amount paid and use it to compare again with the main query.


<a id="8"></a>

## Managing Tables and Databases

- **Data Definition**: only deals with data/table structures and properties. Includes create, alter, drop tables, databases, schema.

- **Data Manipulation**: making changes to the data itself.
Includes insert, update, delete

- To create a database use `CREATE DATABASE <database-name>`

```
CREATE DATABASE company_x
WITH encoding = 'UTF-8';

COMMENT ON DATABASE company_x IS 'That is our database'
```

- we can optionally provide a type of encoding we want for our database and also add a comment to our database as shown above.

- Datatypes are:- Numeric, Strings, Datetime, Other.
- **Numeric**: INT, BIGINT, SMALLINT, NUMERIC(decimal numbers), SERIAL(auto-incrementing integer)
- **Strings**: Character varying, varchar, character, char, text (unlimited length). Phone numbers and ZIP codes should be stored as strings.
- **DateTime**: date, time, timestamp, intervals
- **Others**: boolean, enum (only specific values allowed like movie rating), array (stores a list of values depending on type)

- **Constraint**: used to define rules for the data in our table. Can be on a column or table level.
- Constraints are **NOT NULL**, **UNIQUE**, **DEFAULT**, **PRIMARY KEY**, **REFERENCES** (ensures referential integrity), **CHECK**

- **PRIMARY KEY**: one or multiple columns that uniquely identify each row in a table.

- **FOREIGN KEY**: one or multiple columns that refers to a primary key in another table.

- Primary and Foreign Keys are usually the columns used to join tables.

- Create Table
```
CREATE TABLE <table-name> (
    column_name1 TYPE [CONSTRAINT],
    column_name2 TYPE [CONSTRAINT],
    [...]
)
```

- Insert into table
```
INSERT INTO <table-name> (col1, col2, coln)
VALUES (val1, val2, valn)
```
- can be done without mentioning columns but we have to enter all values for each column.
- to enter multiple rows just add , after values and keep adding each row in ()

- Alter table
```
ALTER TABLE <table-name>
ALTER ACTION
```

- Drop table, schema
```
DROP TABLE <table-name>
DROP SCHEMA <schema-name>
```

- TRUNCATE table : empties the entire table
```
TRUNCATE TABLE <table-name>
```

<a id="9"></a>

## Views and Data Manipulation

- Update table
```
UPDATE <table-name>
SET <column> = value
WHERE (condition)
```
- Use set keyword to set a value to the column, always use where command or else all the rows will be affected.

- Delete table
```
DELETE FROM <table-name>
WHERE (condition)
RETURNING *
```
- Use returning * to get the rows in output console that were deleted.

- To create a table using a query use AS
```
CREATE TABLE <table-name>
AS (query)
```

- **View**: are statements that doesn't create the table physically so no extra storage is used. Also since it is a statement, any changes in the underlying table will also reflect in the view.
```
CREATE VIEW <view-name>
AS query
```
- Selecting from a view basically means running the underlying query, so if a query is complex and time consuming, selecting from that view will also be time consuming.

- **Materialized View**: data is stored physically in this. And we can use refresh to update the view with latest changes.
```
CREATE MATERIALIZED VIEW <view-name>
AS query

REFRESH MATERIALIZED VIEW <view-name>
```
- good practice is to prefix a view name with v_ and materialized view with mv_

- It is also possible to alter and drop views and materialized views.

```
CREATE OR REPLACE VIEW <view-name>
AS query
```
- use above query to replace an existing view or create a new view using a query.

- It is also possible to import external data to an existing table and export data from table to a csv.
- To import a csv to our database a table needs to be created first.
- Right click on the table and select the Import/Export option to get it done.


<a id="10"></a>

## Window Functions

- when we have a table and we want to add an aggregation column like avg, sum, etc but we don't want to impact the number of rows in the table, we can do this using window functions.

```
SELECT
col1, col2, AGGREGATE(coln) OVER(PARTITION BY colm)
FROM table
```

- We can get aggregated values using the aggregate function and use over clause and mention the column besides partition by on which we want the values to be added to.

- We can also use ORDER BY with OVER clause that gives us the running aggregation of a column as per a given column. E.g. we can get a total based on each date when we sort by the date.

- **RANK** function creates a ranking using OVER function based on a particular column.

- **DENSE_RANK** also a function to add ranking, but here if multiple rows have 1st rank then the next will become 2nd rank whereas in RANK function if 5 rows had first ranks, they all will be 1st but the next ranking will be 6th and not 2nd.

- It is also possible to create a partition for ranks.
- WHERE clause doesn't work on window functions as WHERE clause runs before the window functions, so to do it we have to use subqueries.

- **FIRST_VALUE**: gives the first value as per a given window calculation.

- **LEAD**: gives the next value as per given window function calculation.
- **LAG**: gives the previous value as per given window function calculation.

---

- **Key Points**:
- **OVER**: Defines a window to operate on for the window function.
- **PARTITION BY**: Divides the result set into partitions based on the specified column(s), allowing for aggregations or operations within each partition.
- **ORDER BY**: Sorts the rows within each partition based on the specified column(s).
- **RANK**: Assigns ranks to rows based on the partition and order by conditions within the window. If there are ties, the same rank is assigned, and the next rank is skipped.
- **DENSE_RANK**: Assigns ranks similarly to RANK, but does not skip any ranks when there are ties.
- **FIRST_VALUE**: Returns the first row's value (the row with rank 1) for each partition within the window.
- **LEAD**: Retrieves the value from the next row within the current partition. Returns NULL if the next row is outside the partition.
- **LAG**: Retrieves the value from the previous row within the current partition. Returns NULL if the previous row is outside the partition.


<a id="11"></a>

## Grouping Sets, Rollups, Self-Joins

- **Grouping Set** is a method in which we can perform multiple group by operations in a single query.

```
SELECT
col1, col2, AGGREGATION(coln)
FROM table
GROUP BY
    GROUPING SETS (
        (group-by-columns-1),
        (group-by-columns-2),
        (group-by-columns-n)
    )
```

- **ROLLUP** is like a helper function to create grouping sets based on hierarchy.
```
GROUP BY
ROLLUP (column1, column2, column3)

is equivalent to

GROUP BY
GROUPING SETS (
    (column1, column2, column3),    => agg of 3 highest col
    (column1, column2),             => agg of 2 highest col
    (column1),                      => agg of highest col
    ()                              => overall aggregation
)

```

- **CUBE** gives us the grouping of all possible combinations of the columns we mention.
```
GROUP BY
CUBE (column1, column2, column3)
```