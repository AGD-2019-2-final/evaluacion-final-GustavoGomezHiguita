import sys
import operator
from operator import itemgetter

#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    #sort = sorted(sys.stdin, key=itemgetter(3))
       
    #for line in sort:
    #for line in sys.stdin:
    #    letter, date, value = line.split(",")
    #    value = int(value)
        
    #    sys.stdout.write("{},{},{}\n".format(letter,date,value))
    
    #sys.stdout = sorted(sys.stdout, key=itemgetter(1,3))
    #sys.stdout.write("{},{},{}\n".format(letter,date,value))
    
    for line in sys.stdin:
        code,letter, date, value = line.split(",")
        value = int(value)
        sys.stdout.write("{}\t{}\t{}\n".format(letter,date,value))