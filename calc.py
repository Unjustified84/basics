def add(num1, num2):
	return num1 + num2

def sub(num1, num2):
	return num1 - num2

def mul(num1, num2):
	return num1 * num2

def div(num1, num2):
	return num1 / num2

def main():
	print("Welcome to the Basic Calculator".center(80,' '))
	print(" ")
	print("Pick a sign, or 'q' to exit".center(80,' '))
	while True:
		operation = input("What to do? (+,-,/,*): ")
		if (operation == '+' or operation == '-' or operation == '/' or operation == '*'):
			num1 = int(input("num1: "))
			num2 = int(input("num2: "))
			if(operation == '+'):
				print(str(num1) + "+" + str(num2) + "=" + str(add(num1, num2)))
				print(" ")
			elif(operation == '-'):
				print(str(num1) + "-" + str(num2) + "=" + str(sub(num1, num2)))
				print(" ")
			elif(operation == '*'):
				print(str(num1) + "*" + str(num2) + "=" + str(mul(num1, num2)))
				print(" ")
			else:
				print(str(num1) + "/" + str(num2) + "=" + str(div(num1, num2)))
				print(" ")
		elif(operation == "q"):
			print("Goodbye")
			break
		else:
			print("Invalid option, please try again!")
			print(" ")
main()
