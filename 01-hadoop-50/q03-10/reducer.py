import sys
import operator
from operator import itemgetter

#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    sort = sorted(sys.stdin, key=itemgetter(2))
       
    for line in sort:
        key, val = line.split(",")
        val = int(val)
        
        sys.stdout.write("{},{}\n".format(key, val))