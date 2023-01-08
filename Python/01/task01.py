def cha_char(string, index, new_char):
    if index < 0 or index >= len(string):
        return "Index out of range"
    
    new_string = string[:index] + new_char + string[index+1:]
    print("New String Is:")
    return new_string

string = input('PLease Enter your string:\n')
index_num = input('Please Enter character Number you want to change:\n')
new_char = input('Please Enter Your new character:\n')
print(cha_char(string, int(index_num)-1, new_char))