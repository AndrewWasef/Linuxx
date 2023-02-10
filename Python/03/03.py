def BalancedBrackets(Str):
    stack = []
    for char in Str:
        if char == '{' or char == '(' or char == '[':
            stack.append(char) 
        elif char == '}' or char == ')' or char == ']':
            if len(stack) == 0:
                return False
            top_element = stack.pop()  
            if not Compare(top_element, char):
                return False
    if len(stack) != 0:
        return False

    return True

def Compare(opening, closing):
    if opening == '(' and closing == ')':
        return True
    if opening == '[' and closing == ']':
        return True
    if opening == '{' and closing == '}':
        return True
    return False

print(BalancedBrackets("{[(])} "))