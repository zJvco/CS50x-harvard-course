from cs50 import get_float

while True:
    cash = get_float("Change owed: ") * 100
    if cash >= 0:
        break
    
coins = 0
while (cash > 0):
    if cash < 5:
        cash -= 1
    elif cash < 10:
        cash -= 5
    elif cash < 25:
        cash -= 10
    elif cash >= 25:
        cash -= 25
    coins += 1

print(coins)