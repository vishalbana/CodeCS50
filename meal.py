'''

In meal.py, implement a program that prompts the user for a time and outputs whether it’s breakfast time, lunch time, or dinner time.
If it’s not time for a meal, don’t output anything at all. 
Assume that the user’s input will be formatted in 24-hour time as #:## or ##:##. 
And assume that each meal’s time range is inclusive. 
For instance, whether it’s 7:00, 7:01, 7:59, or 8:00, or anytime in between, it’s time for breakfast.

Structure your program per the below, 
wherein convert is a function (that can be called by main) that converts time, a str in 24-hour format,
to the corresponding number of hours as a float. For instance, given a time like "7:30" (i.e., 7 hours and 30 minutes), 
convert should return 7.5 (i.e., 7.5 hours).
'''



def main():
    time = input('What time is it? ')
    new_time = convert(time)
    if(float(new_time) >= 7 and float(new_time) <= 8):
        print('breakfast time')
    elif(float(new_time) >= 12 and float(new_time) <= 13):
        print('lunch time')
    elif(float(new_time) >= 18 and float(new_time) <= 19):
        print('dinner time')
    else:
        return

def  convert(time):
     hours, minutes = time.split(':')
     time = (float(hours)) + (float(minutes) / 60)
     return time

if __name__ == '__main__':
main()




# is se pehle mene aise kia tha successfull bi tha and desired result print hore the but cs50! k hisab se ni tha toh changed.




def main():
    time = input('What time is it? ')
    new_time = convert(time)
    if(float(new_time) >= 700 and float(new_time) <= 800):
        print('breakfast time')
    elif(float(new_time) >= 1200 and float(new_time) <= 1300):
        print('lunch time')
    elif(float(new_time) >= 1800 and float(new_time) <= 1900):
        print('dinner time')
    else:
        return

def  convert(time):
     hours, minutes = time.split(':')
     time = (float(hours * 100)) + (float(minutes) * 5 / 3)
     return time

if __name__ == '__main__':
    main()

