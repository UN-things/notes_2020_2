dict_table_h = {
    'A': 366,
    'B': 0,
    'C': 160,
    'D': 242,
    'E': 161,
    'F': 176,
    'G': 77,
    'H': 151,
    'I': 226,
    'L': 244,
    'M': 241,
    'N': 234,
    'O': 380,
    'P': 100,
    'R': 193,
    'S': 253,
    'T': 329,
    'U': 80,
    'V': 199,
    'Z': 374
}

dict_connections = {
    'A': [['Z', 75], ['S', 140], ['T', 118]],
    'Z': [['A', 75], ['O', 71]],
    'O': [['Z', 71], ['S', 151]],
    'S': [['A', 140],['O', 151], ['R', 80], ['F', 99]],
    'T': [['A', 118],['L', 111]],
    'L': [['T', 111],['M', 70]],
    'M': [['L', 70], ['D', 75]],
    'D': [['M', 75], ['C', 120]],
    'C': [['D', 120], ['P', 138],['R', 146]],
    'R': [['S', 80], ['C', 146], ['P', 97]],
    'P': [['R', 97], ['C', 138], ['B', 101]],
    'F': [['S', 99], ['B', 211]],
    'B': [['F', 211],['P', 101], ['G', 90], ['U', 85]],
    'G': [['B', 90]],
    'U': [['B', 85], ['H', 98], ['V', 142]],
    'H': [['U', 98], ['E', 86]],
    'E': [['H', 86]],
    'V': [['U', 142], ['I', 92]],
    'I': [['V', 92], ['N', 87]],
    'N': [['I', 87]]
}

queue = []
'''
queue = [ [[cities_visited], accumulated_cost, accumulated_km + heuristic ],...]
'''

def A(start, end):
	if(queue[0][0][-1] == end):
		return queue[0][0]

	path = queue[0][0]      # cities visited
	path_cost = queue[0][1] # accumulated cost
	del queue[0]

	# dict_connections[start] = list of connections of city 'start'
	list_total_sum = dict_connections[start].copy()

	# Structure of each city
	'''
	['X', g('X'), f('X') = g('X') + h('X')]
	'''
	for i in range(len(list_total_sum)):
		heuristic = dict_table_h[list_total_sum[i][0]]
		list_total_sum[i].append(heuristic + list_total_sum[i][1] + path_cost)
		list_total_sum[i][1] = list_total_sum[i][1] + path_cost

	# List is sorted in ascending order, based on f('X')
	ordened_list = sorted(list_total_sum, key = lambda x: x[2])

	if(len(queue) == 0):
		for city in ordened_list:
			list_path = path.copy()
			list_path.append(city[0])
			queue.append([list_path, city[1], city[2]])
	else:
		# Queue is sorted in ascending order, based on f(city)
		for city in ordened_list:
			for i in range(len(queue)):
				if queue[i][2] >= city[2]:
					list_path = path.copy()
					list_path.append(city[0])
					queue.insert(0 if i == 0 else i-1 , [list_path, city[1], city[2]])
					break
	#print(queue)
	return A(queue[0][0][-1], end)

def main():
    #queue = []
	queue.append([['A'], 0, 0])
	print(A('A', 'B'))

if __name__ == "__main__":
    main()