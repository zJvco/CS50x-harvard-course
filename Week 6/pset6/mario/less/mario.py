from cs50 import get_int

while True:
    height = get_int("Height: ")
    if 0 < height <= 8:
        break

for i in range(height):
    for j in range(height - (i + 1), 0, -1):
        print(" ", end="")
    for k in range(i + 1):
        print("#", end="")
    print()