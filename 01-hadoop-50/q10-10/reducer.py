import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    for line in sys.stdin:
        aux,key,val = line.split("\t")
        val = str(int(val))
        
        if curkey == key:
            numbers.append(val)
        else:
            if curkey is not None:
                    list_numbers = ",".join(numbers)
                    sys.stdout.write("{}\t{}\n".format(curkey, list_numbers))
            curkey = key
            numbers = []
            numbers.append(val)
    list_numbers = ",".join(numbers)
    sys.stdout.write("{}\t{}\n".format(curkey, list_numbers))
