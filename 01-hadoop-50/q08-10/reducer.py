import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    suma = None
    total = None
    
    for line in sys.stdin:
        key, val, contador = line.split("\t")
        val = float(val)
        contador = int(contador)
        
        if key == curkey:
            suma += val
            total += contador
        else:
            if curkey is not None:
                sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,str(suma/total)))

            curkey = key
            suma = val
            total = contador

    sys.stdout.write("{}\t{}\t{}\n".format(curkey,suma,str(suma/total)))
