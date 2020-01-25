import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    maximum = None
    minimum = None
    
    for line in sys.stdin:

        key, val = line.split("\t")
        
        if key == curkey:
            maximum = max(maximum, val)
            minimum = min(minimum, val)
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey,maximum,minimum))
                
            curkey = key
            maximum = val
            minimum = val
            
    sys.stdout.write("{}\t{}\t{}\n".format(curkey,maximum,minimum))