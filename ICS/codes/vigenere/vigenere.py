def vigenere(message, keyword, t, decrypt=0):
	lis = list()
	for i in range(len(message)):
		character_k = keyword[i % len(keyword)]
		x = ord(character_k)
		y = ord((message[i]))
		if decrypt == 0:
			aux = x + y
		else:
			aux = 26 - x + y
		c = (aux % 26) + 65
		lis.append(chr(c))
	test = [('').join(lis[x:x+t]) for x in range(0,len(lis), t)]
	return (' ').join(test)

def main():
	t = int(input("\tIngrese t:\t"))
	message = input("\tIngrese el mensaje:\t").replace(' ', '').upper()
	keyword = input("\tIngrese la clave:\t").replace(' ', '').upper()
	option = int(input("\t1. Cifrar\n\t2. Descifrar\t"))
	result = vigenere(message, keyword, t, option - 1)
	print('\n\t\t',result, '\n')

if __name__ == "__main__":
    main()