matrix = 	[['L', 'E', 'A', 'R', 'N'],
			['B', 'C', 'D', 'F', 'G'],
			['H', ['I', 'J'], 'K', 'M', 'O'],
			['P', 'Q', 'S', 'T', 'U'],
			['V', 'W', 'X', 'Y', 'Z']]

def get_list_couples(message):
  list_couples = list()
  i = 0
  while i < len(message):
    couple = message[i:i+2]
    if len(couple) == 1:
      couple = couple + 'X'
    elif couple[0] == couple[1]:
      couple = couple[0] + 'X'
      i = i - 1
    list_couples.append(couple)
    i = i + 2
  return list_couples

def search_characters(couple):
	list_positions = list()
	for character in couple:
	if ((character == 'I') | (character == 'J')):
		list_positions.append((2, 1))
	for row in range(len(matrix)):
		for column in range(len(matrix[row])):
		if matrix[row][column] == character:
			list_positions.append((row, column))
			break
		else: continue
		break
	return list_positions

def playfair(list_couples, indicator = 0):
	couples_encrypted = list()
	aux = 1 if indicator == 0 else -1
	for couple in list_couples:
		new_couple = str()
		positions = search_characters(couple)
		for i in range(len(positions)):
			row, col = positions[i][0], positions[i][1]
			if positions[0][1] == positions[1][1]:
				row = (positions[i][0] + aux) % len(matrix)
			elif positions[0][0] == positions[1][0]:
				col = (positions[i][1] + aux) % len(matrix)
			else:
				col = positions[(i+aux)%2][1]
			char = '[I/J]' if isinstance(matrix[row][col], list) else matrix[row][col]
			new_couple = new_couple + char
		couples_encrypted.append(new_couple)
	return couples_encrypted

