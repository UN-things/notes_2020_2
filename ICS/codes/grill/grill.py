import numpy as np

def err(str):
	print("Error:\n"+str)
    return -1
def inputs():
	'''
	Return dictionary with:
	- sz: size matrix
	- dr: direction
		- 0: Rotation clockwise
		- 1: Rotate counterclockwise
	- md: mode
		- 0: encryption
		- 1: decryption
	- hl: binary matrix
		- True: there is a hole in that position
		- False: other case
	- ms: unencrypted message.Only used when md = 0.
	- mx: matrix of the encrypted message. Only used when md = 1.
	'''
	holes_positions = list()
	inp = dict()

	temp = int(input("Ingrese el tamaño de la retícula:\t"))
	if temp < 2: return err("Tamaño inválido")
	inp["sz"] = temp
	temp = int(input("\nRotación:\n0. Horaria\n1. Antihoraria\t"))
	if temp < 0 | temp > 1: return err("Valor inválido")
	inp["dr"] = temp
	temp =  int(input("\nModo:\n0. Encriptar\n1. Desencriptar\t"))
	if temp < 0 | temp > 1: return err("Valor inválido")
	inp["md"] = temp
	temp = int(input("\nIngrese la cantidad de hoyos:\t"))
	if temp > inp["sz"]**2: return err("Más hoyos que celdas en retícula")
	for i in range(temp):
		hole = np.array(input().strip().split()[:2], int)
		for j in hole:
			if j < 0 | j >= inp["sz"]: return err("Posición inválida")
		holes_positions.append(hole)
	holes = np.zeros((inp["sz"], inp["sz"]), dtype=bool)
	for temp in holes_positions:
		holes[temp[0], temp[1]] = True
	inp["hl"] = holes
	temp = input("\nIngrese el mensaje:\t").replace(' ', '').upper()
	if len(temp) > inp["sz"]**2: return err("El mensaje no cabe en la rendija")
	if inp["md"] != 0:
		temp = temp + "-" * (inp["sz"] - len(temp))
		inp["mx"] = np.array(list(temp)).reshape((inp["sz"], inp["sz"]))
	else:
		inp["ms"] = temp
	return inp

def grill(inp):
	md = inp["md"]
	inp["mx"] = np.full((inp["sz"], inp["sz"]), '-') if md == 0 else inp["mx"]
	result = ""
	k = 0
	dr = inp["dr"]
	while k < 4:
		temp = np.rot90(inp["hl"], k, axes=((dr+1) % 2, (dr+0) % 2))
		for i in range(inp["sz"]):
			for j in range(inp["sz"]):
				if temp[i, j]:
					if (md == 0) & (inp["mx"][i, j] == "-"):
						inp["mx"][i, j] = inp["ms"][0]
						inp["ms"] = inp["ms"][1:]
					elif (md != 0) & (inp["mx"][i,j] != "-"):
						result = result + inp["mx"][i,j]
						inp["mx"][i,j] = "-"
		k = k + 1
	return ''.join([''.join(i)for i in inp["mx"]]) if md == 0 else result

def main():
	inp = inputs()
	res = grill(inp)
	print("\nEl mensaje obtenido fue:\t", res)

if __name__ == "__main__":
	main()