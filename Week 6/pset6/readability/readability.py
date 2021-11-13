from cs50 import get_string
import re

def letters_counter(t, a):
    c = 0
    for i in t:
        if i in a or i in [j.upper() for j in a]:
            c += 1
    return c

def words_counter(t):
    match = re.split(" ", t)
    return len(match)

def sentences_counter(t):
    match = re.split("[.!?]", t)
    return len(match) - 1

def calculate(lc, wc, sc):
    l = (lc / wc) * 100
    s = (sc / wc) * 100
    index = 0.0588 * l - 0.296 * s - 15.8
    return round(index)

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

text = get_string("Text: ")

letter_count = letters_counter(text, alphabet)
word_count = words_counter(text)
sentece_count = sentences_counter(text)

calc = calculate(letter_count, word_count, sentece_count)

if calc < 1:
    print("Before Grade 1")
elif calc >= 16:
    print("Grade 16+")
else:
    print(f"Grade {calc}")