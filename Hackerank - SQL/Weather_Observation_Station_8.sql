/* Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
Input Format

The STATION table is described as follows:


ID     | NUMBER
CITY   | VARCHAR(21)
STATE  | VARCHAR(2)
LAT_N  | NUMBER
LONG_W | NUMBER

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/


SELECT DISTINCT 
CITY 
FROM STATION 
WHERE LEFT(CITY,1) in ('a','e','i','o','u')  AND RIGHT(CITY,1) in ('a','e','i','o','u') ;
