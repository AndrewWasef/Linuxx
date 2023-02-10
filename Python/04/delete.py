from datetime import date
import csv

def delete():
    rows=[]
    Name = input("Enter the user name: ")
    filename = str("contactbook_" + str((date.today()).strftime("%d-%m-%Y")) + ".csv")
    with open(filename, 'r') as file:
        csv_reader = csv.reader(file)
        for line in csv_reader:
            if line[0] == Name:
                continue
            else:
                rows.append(line)
    with open(filename, 'w', newline='') as update:
        csv_writer = csv.writer(update)
        csv_writer.writerows(rows)