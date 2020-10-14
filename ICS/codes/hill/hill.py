import numpy as np
from sympy import Matrix

def get_list_couples(message, n):
	list_couples = list()
	message = message + 'A' if (len(message) %2 != 0) else message
	for i in range(0, len(message), n):
		list_couples.append(np.array([ ord(c) - 65 for c in message[i:i+n]]))
	return list_couples

def hill(list_couples, key):
  result = list()
  for couple in list_couples:
    for c in np.dot(couple, key):
      result.append(chr((c % 26) + 65))
  return ''.join(result)

def main():
    n, m = 2, 2
    option = int(input("1. Cifrar\n2. Descifrar\t"))
    message = input("Ingrese el mensaje:\t").replace(' ', '').upper()
    print("Ingrese la clave:\n")
    key = np.array([input().strip().split()[:m] for _ in range(n)], int)
    if option == 2:
        key = np.array(Matrix(key).inv_mod(26))
    list_couples = get_list_couples(message, n)
    result = hill(list_couples, key)
    print('\nResultado:\t',result, '\n')

if __name__ == "__main__":
    main()