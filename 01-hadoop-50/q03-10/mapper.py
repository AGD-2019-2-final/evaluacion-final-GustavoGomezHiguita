import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        letter = line.split(',')[0]
        number = line.split(',')[1]
        number = int(number)
        sys.stdout.write("{},{}\n".format(letter,number))
