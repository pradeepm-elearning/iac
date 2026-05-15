

Variable block accepts 3 parameters in Terraform.
1. default - this is where we specify default value for a Variable.
2. type - it enforces the type of variable being used.
3. description - argument to describe what the variable is used for.


Various types of "type" variable.
1. string - accept a single value which can be alpha numeric. i.e., consisting of Alphabet and numbers.
2. number - accepts a single value of a number which can be positive or negative.
3. bool - accepts a variable of True or False.
4. any - if type parameter is not specified in the variable block, then type any is considered by default.
5. list - is a numbered collection of values.
6. set - is similar to a list. main difference between set and list is that a set cannot have a duplicate elements.
7. tuple - is similar to a list. consists of sequence of elements. list uses elements of the same variable type such as string or number. tuple uses elements of different variable types.  
8. map - is data represented in the format of key value pairs.
9. object - with objects we can create complex data structure by combining all the variable types.

