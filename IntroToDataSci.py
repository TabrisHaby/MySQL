# add_numbers is a function that takes two numbers and adds them together.

def add_numbers(x, y):
    return x + y

add_numbers(20, 2)

# `add_numbers` updated to take an optional 3rd parameter.
# Using `print` allows printing of multiple expressions within a single cell.

def add_numbers(x,y,z = None) :
    if z == None :
        return x+y
    else :
        return x + y + z
print(add_numbers(1,2,3))
print(add_numbers(1,2))

# add_numbers updated to take an optional flag parameter.
def add_numbers(x,y,z = None,flag = False) :
    if flag :
        print('Flag is True')
    if z == None :
        return x + y
    else :
        return x + y + z
print(add_numbers(1,2,flag = True))
print(add_numbers(1,2,z = None))

# Assign function add_numbers to variable a.
def add_numbers(x,y) :
    return x + y
a = add_numbers
a(2,2)


# reading file (csv)
import csv
# In python the with keyword is used when working with
# unmanaged resources (like file streams).
# The with statement is a control-flow structure whose basic structure is:
# ------------------------------------------ #
##      with expression [as variable]:
##          with-block
# ------------------------------------------ #
# The classic example is opening a file, manipulating the file, then closing it:
with open('mpg.csv') as csvfile :
    # class csv.DictReader(csvfile, fieldnames=None, restkey=None,
    # restval=None, dialect='excel', *args, **kwds)

    # Create an object which operates like a regular reader but maps the
    # information read into a dict whose keys are given by the optional
    # fieldnames parameter.
    mpg = list(csv.DictReader(csvfile))
mpg[:3] # first 3 doctionaries in list



# The Python Programming Language: Objects and map()
class person :
    department = 'School of information'

    def set_name(self,new_name) :
        self.new_name = new_name
    def set_location(self,new_location) :
        self.new_location = new_location
# name the object
person = person()
# name the set_name method
person.set_name('Chri Brooks')
# name the set_location method
person.set_location('Ann Arbor,MI,USA')
# recall the object and methods
print('{} live in {} and works in the department {}'.format(person.set_name,
                                person.set_location,person.department))
