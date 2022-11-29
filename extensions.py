"""
In a file called extensions.py, implement a program that prompts the user for the name of a file and then outputs that file’s media 
type if the file’s name ends, case-insensitively, in any of these suffixes:
.gif
.jpg
.jpeg
.png
.pdf
.txt
.zip
If the file’s name ends with some other suffix or has no suffix at all, output application/octet-stream instead, which is a common default.
"""

m = input('File name: ')
m = m.lower().strip()
if m.endswith('.gif'):
    print('image/gif')
elif m.endswith('.jpg') or m.endswith('.jpeg'):
    print('image/jpeg')
elif m.endswith('.png'):
    print('image/png')
elif m.endswith('.pdf'):
    print('application/pdf')
elif m.endswith('.txt'):
    print('text/plain')
elif m.endswith('.zip'):
    print('application/zip')
else:
    print('application/octet-stream')
