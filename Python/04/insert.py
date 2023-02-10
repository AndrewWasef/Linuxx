from datetime import date
import csv

def insert():
    Name = str(input("please enter your Name: "))
    Email = str(input("please enter your email address: "))
    Phone_Numbers= []
    number= input("Enter your phone number: ")
    while (number.upper() != "NO" or number.lower() != "no"):
        Phone_Numbers.append(number)
        number= input("Add another Number (Enter (no/NO) to exit):")
    Address = str(input("Enter your address: "))
    Insertion_Date = (date.today()).strftime("%d/%m/%Y")
    filename = str("contactbook_" + str((date.today()).strftime("%d-%m-%Y")) + ".csv")
    with open(filename, 'a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([Name , Email , Phone_Numbers , Address , Insertion_Date])