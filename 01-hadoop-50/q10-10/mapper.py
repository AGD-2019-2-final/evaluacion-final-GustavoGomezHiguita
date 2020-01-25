import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    
    for line in sys.stdin:
        line = line.strip()
        number = line.split("\t")[0]
        number = int(number)
        letters = line.split("\t")[1]
        letters = letters.split(",")
                
        for letter in letters:
            letter = str(letter)
            sys.stdout.write("{}\t{}\t{}\n".format(letter + str(number/100),letter,number))
