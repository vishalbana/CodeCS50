"""
In a file called bank.py, implement a program that prompts the user for a greeting. 
If the greeting starts with “hello”, output $0. 
If the greeting starts with an “h” (but not “hello”), output $20. Otherwise, output $100. 
Ignore any leading whitespace in the user’s greeting, and treat the user’s greeting case-insensitively.

"""

bank = (input('Greeting: '))
if   bank.strip().lower().startswith('hello'):
     print('$0')
elif bank.strip().lower().startswith('h'):
     print('$20')
else:
     print('$100')
