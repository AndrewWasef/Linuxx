## task2 check if the year is leap or not

def leap_year(year):

    if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
        return True
    else:
        return False
 
year = int(input("PLease Enter The Year you want to check if it's a leap : \n"))

print(leap_year(year))
