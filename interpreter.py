'''
In a file called interpreter.py,
implement a program that prompts the user for an arithmetic expression
and then calculates and outputs the result as a floating-point value formatted to one decimal place.
Assume that the user’s input will be formatted as x y z, with one space between x and y and one space between y and z,
wherein:
x is an integer
y is +, -, *, or /
z is an integer
'''


# in sb me complexity ki lagi padi hai ki nahi ye kese pta lge?
# run kr re hain and test case bhi saare pass. but complexity ka kya ho?




expression = input('Expression: ')
x, y, z = (expression.split(' '))
if   y == '+':
    print(float(int(x) + int(z)))
elif y == '-':
    print(float(int(x) - int(z)))
elif y == '/':
    print(float(int(x) / int(z)))
elif y == '*':
    print(float(int(x) * int(z)))
