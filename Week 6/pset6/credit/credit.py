from cs50 import get_string

number = get_string("Number: ")

struct = {
    "AmericanExpress": [34, 37],
    "MasterCard": [51, 52, 53, 54, 55],
    "Visa": [4]
}

numbers = [int(n) for n in number]

for i in range(len(numbers))[-2::-2]:
    numbers[i] = numbers[i] * 2
    if numbers[i] > 9:
        nc = str(numbers[i])
        sum = 0
        for j in nc:
            sum += int(j)
        numbers[i] = sum

total = 0
for i in numbers:
    total += i

if total % 10 == 0:
    n = ""
    for i in number:
        n += i
        if int(n) in struct["AmericanExpress"]:
            print("AMEX")
            break
        elif int(n) in struct["MasterCard"]:
            print("MASTERCARD")
            break
        elif int(n) in struct["Visa"]:
            print("VISA")
            break
else:
    print("INVALID")
