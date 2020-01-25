import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    
    curkey = None
    minimum = None
    counter = 0
    
    for line in sys.stdin:
        if counter<=5: 
            aux,key,date,val = line.split("\t")
            val = int(val)
            sys.stdout.write("{}\t{}\t{}\n".format(key,date,val))
            counter += 1