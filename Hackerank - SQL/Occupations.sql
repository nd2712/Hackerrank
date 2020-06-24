/* Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

Input Format

The OCCUPATIONS table is described as follows:

NAME       | STRING
OCCUPATION | STRING

Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Sample Input

An OCCUPATIONS table that contains the following records:

NAME      | OCCUPATION
SAMANTHA  | DOCTOR
JULIA     | ACTOR
MARIA     | ACTOR
MEERA     | SINGER
ASHLEY    | PROFESSOR
KETTY     | PROFESSOR
CHRISTEEN | PROFESSOR
JANE      | ACTOR
JENNY     | DOCTOR
PRIYA     | SINGER

Sample Output

Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
Explanation

The first column is an alphabetically ordered list of Doctor names.
The second column is an alphabetically ordered list of Professor names.
The third column is an alphabetically ordered list of Singer names.
The fourth column is an alphabetically ordered list of Actor names.
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with NULL values.
*/


SET @d=0,@a=0,@p=0,@s=0; 
SELECT MIN(Doctor),MIN(Professor),MIN(SINGER),MIN(Actor) 
FROM(
  SELECT IF(OCCUPATION='Actor',NAME,NULL) AS Actor, 
        IF(OCCUPATION='Doctor',NAME,NULL) AS Doctor,
        IF(OCCUPATION='Professor',NAME,NULL) AS Professor, 
        IF(OCCUPATION='Singer',NAME,NULL) AS SINGER, 
   case OCCUPATION 
        when 'ACTOR' THEN @a:=@a+1 
        when 'Doctor' THEN @d:=@d+1 
        when 'Professor' THEN @p:=@p+1 
        when 'Singer' THEN @s:=@s+1 
   end as t
FROM OCCUPATIONS ORDER BY NAME ) AS pivot GROUP BY pivot.t ;