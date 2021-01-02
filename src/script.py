
def map_number(number):    
    mapped_str = ""
    for i in number:
        mapped_str += chr(int(i) + 65)
    return mapped_str

def convert_to_prolog_list(number):
    mapped_str = map_number(number)
    result = "["
    for i in mapped_str:
        result += i + ","
    return result[:-1] + "]"

def get_prolog_variables(operand1,operand2,result):
    variables = ""
    for i in operand1:
        if (i not in variables):
            variables += i
    for i in operand2:
        if (i not in variables):
            variables += i
    for i in result:
        if (i not in variables):
            variables += i
    return convert_to_prolog_list(variables)

def build_prolog_input_list(l1,l2,l3,variables):
    return "[" + l1 + "," + l2 + "," + l3 + "," + variables + "]."


def main():
    first_operand = str(input("Enter the first operand: "))
    second_operand = str(input("Enter the second operand: "))
    result = str(int(first_operand) * int(second_operand))
    l1 = convert_to_prolog_list(first_operand)
    l2 = convert_to_prolog_list(second_operand)
    l3 = convert_to_prolog_list(result)
    variables = get_prolog_variables(first_operand,second_operand,result)
    puzzle = build_prolog_input_list(l1,l2,l3,variables)
    print(puzzle)

if __name__ == "__main__":
    main()
