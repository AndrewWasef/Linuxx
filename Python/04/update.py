from datetime import date
import csv

def update():
    rows=[]
    Name = input("Enter the username to change: ")
    old_record = input("record to change (Name , Email , Phone_Numbers , Address):")
    new_record = input("Enter the new record:")
    filename = str("contactbook_" + str((date.today()).strftime("%d-%m-%Y")) + ".csv")
    with open(filename, 'r') as file:
        csv_reader = csv.reader(file)
        for line in csv_reader:
            if line[0] == Name:
                if old_record == "Name":
                    line[0] = new_record
                elif old_record == "Email":
                    line[1] = new_record
                elif old_record == "Phone_Numbers":
                    line[2] = new_record
                elif old_record == "Address":
                    line[3] = new_record
            rows.append(line)

    with open(filename, 'w', newline='') as update:
        csv_writer = csv.writer(update)
        csv_writer.writerows(rows)