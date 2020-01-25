import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    maximum = None
    
    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)

        if key == curkey:
            maximum=max(val,maximum)

        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\n".format(curkey, maximum))

            curkey = key
            maximum = val

    sys.stdout.write("{}\t{}\n".format(curkey, maximum))

