import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        letter = line.split('   ')[0]
        value = line.split('   ')[2]
        value = float(value)
        sys.stdout.write("{}\t{}\n".format(letter,value))