import sys
import csv

def get_max_str(STR, DNA):
    i = 0
    j = len(STR)
    c = 0
    for l in range(len(DNA)):
        if DNA[i:j] == STR:
            temp = 0;
            while DNA[i:j] == STR:
                temp += 1
                i+= len(STR)
                j+= len(STR)
                if(temp > c):
                    c = temp
        else:
            i += 1
            j += 1
    return c
    
def main():
    if len(sys.argv) != 3:
        print("Usage: python dna.py data.csv sequence.txt")
        return

    people = None
    with open(sys.argv[1], "r") as file:
        reader = csv.DictReader(file)
        people = [x for x in reader]

    str_list = list(people[0].keys())[1::]
    str_struct = dict()
    for i in str_list:
        str_struct[i] = 0

    dna = None
    with open(sys.argv[2], "r") as file:
        dna = file.read()

    for STR in str_list:
        str_struct[STR] = get_max_str(STR, dna)
        
    for p in people:
        match = 0
        for STR in str_list:
            if int(p[STR]) == str_struct[STR]:
                match += 1
        if match == len(str_list):
            print(p["name"])
            return
        
    print("No Match")

if __name__ == "__main__":
    main()