# Notes on string sorting order
- https://makandracards.com/makandra/40984-postgresql-and-its-way-of-sorting-strings
- http://www.sqlines.com/informix-to-postgresql/string_sorting_order
- https://www.postgresqltutorial.com/postgresql-order-by/

So, basically:
- All the letters are compared, ignoring spaces and punctuation
- Spaces and punctuation are compared to break ties
- Sorting upper and lower case letters together. So the order will be something like a A b B c C

or you can cast the column to behave in a different way just like this one:  
https://stackoverflow.com/questions/7018628/postgresql-sorting-mixed-alphanumeric-data  
Every method has its own benefit and lacks, it's up to you to decide how to deal with collates and sorting order (or avoid _ORDER BY_ altogether on strings and use something else)
