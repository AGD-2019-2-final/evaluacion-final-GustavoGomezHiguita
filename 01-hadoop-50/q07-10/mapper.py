import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        letter = line.split('   ')[0]
        date = line.split('   ')[1]
        value = line.split('   ')[2]
        value = int(value)
        sys.stdout.write("{},{},{},{}\n".format(letter+str(value/100),letter,date,value))
