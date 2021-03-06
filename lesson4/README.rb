# vim: set spell:

# = Objects and Methods - Ruby as language designed around OO paradigm
# 
#    1. Object Oriented approach to programming 
#    2. Ruby consists of objects and dots (the most-used syntactic structure) 
#    3. Introspection - in a console, pull up an object and show that everything can be examined.
#    4. "Everything is an expression" (vs statement), meaning everything returns 
#       something (there are no "void" methods).  For example,
#       returns the value of the expression.
#    5. Method chaining...  (come up with an example here - TODO)
#    6. All values are objects and are accessed by reference


# == Object Oriented approach to programming
#
# === Procedural approach
#
#   using procedures (aka functions or methods)
#   it is similar in following instructions to assemble furniture from a store
#
#
# === Object Oriented approach
#
#   Objects have data and behavior. Object as a result have responsibility. Objects interact with each other 
#   using messages. Objects have inheritance and polymorphism. For example imagine a lecturer tells his students
#   to go to their next lecture:
# 
#                              +-Person---------------+
#                              |                      |
#                              | def next_lecture()   |
#                              |   nil                |
#                              | end                  |
#                              |                      |
#                              +-----------+----------+
#                                          |
#                                          | 
#          +--------------------------+-----------+-----------+-------------------+
#          |                          |                       |                   |
#          |                          |                       |                   |
# +-Medical Student------+ +-Biology Student------+ +--Math Student------+ +-Janitor------+
# |                      | |                      | |                    | |              |
# | def next_lecture()   | | def next_lecture()   | | def next_lecture() | |              |
# |   next_medical_class | |   next_biology_class | |   next_math_class  | |              |
# | end                  | | end                  | | end                | |              |
# |                      | |                      | |                    | |              |
# +----------------------+ +----------------------+ +--------------------+ +--------------+
#
#   == Everything is an object in Ruby
#     Objects, dots, and methods are the most ubiquitous elements of any ruby program
#     even most operators (for example -, +, *) are actually methods of their objects
#
#   C language data types are not objects
#     int x;
#   Java has object types and non-object types 
#     int x;
#     Integer y = new Integer(1);
#  
#   Most programming languages have data types which are mixture of objects and non-objects, or non-objects
#   Ruby is different -- all data types in ruby are objects and it is super cool! It is cool because everything
#   in ruby behaves predictably. Ruby objects interact with each other by sending messages. Messages are methods
#   exposed for external use.


"Hi".downcase # Most of ruby expressions work with objects and their methods.

#  
#   == Introspection
#
#   one great advantage of such design -- you can inspect everything the same way
#   
1.public_methods.sort
1.public_methods(false).sort # not inherited methods only
1.class # => Fixnum
1.class.superclass # => Integer
'eol'.is_a? String
'eol'.respond_to? :slice
local_variables


#   more about introspection:
require 'introspection'


#   == Object, dot, method

'boston'.capitalize
1.+(2)
'Cape'.+(' Cod')
'#'.*(72)

#it is not convenient to write 1.+(2) so there is a syntactic sugar added to operator constructs
1 + 2
'Cape' + 'Cod'
'#' * 72

# = Everything is expression
#
# Statements return no value, expressions do. Everything in ruby is expression and returns a value.

if 1 == 1 then x = 4 end # => 4

2 # => 2

x = 5 # => 5

# Interesting consequence of that -- it is possible to chain expressions together letting them feed on each other similar to unix pipes

['encyclopedia', 'Life'].join(' of ').capitalize.reverse[0..3].upcase

if Time.now.hour.between?(12, 13)
  'Lunch'
else
  'Something else'
end + ' time'

# Simple expressions return themselves, for example expression 4 returns 4
# Everything can be chain to everything, but if a method is missing chain would break


# = All values are accessed by reference

# So every time something is sent out to a method, it is sent by reference, not by value!
# 
# It does not really matter only for immutable objects, such as numbers and symbols
