import numpy as np
from sympy import Matrix

def get_list_couples(mess, n):
	'''
	Divide the message into groups of size n.

	Input parameters:
	- mess: message ot encrypt
	- n: letter group size
	'''
	list_couples = list()
	# Add 'A's to the message so that (mess % n == 0) is fulfilled
	mess = mess + 'A' * (len(message) % n) if (len(mess) % n != 0) else mess
	for i in range(0, len(mess), n):
		#characters are represented by numbers from 0 to 25
		list_couples.append(np.array([ ord(c) - 65 for c in mess[i:i+n]]))
	return list_couples

def hill(list_couples, key):
	'''
	Function that executes the dot product of each group of letters
	with the matrix key
	- list_couples: list of groups of n letters, the letters are
	represented by numbers from 0 to 25
	- key: matrix nxn
	'''
	result = list()
	for couple in list_couples:
		# dot product
		for c in np.dot(couple, key):
		# the message is passed to letters
		result.append(chr((c % 26) + 65))
	return ''.join(result)

def main():
	'''
	Function that receives a message, [encrypts/decrypts]
	it using hill's algorithm and prints the result.
	'''
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