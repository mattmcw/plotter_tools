# Find a <rect> bounding box inserted by Processing
# and remove it. Happens inconsistently.

import sys

argIndex = len(sys.argv) - 1
filePath = str(sys.argv[argIndex])

evalLine = ''
rest = ''
i = 0

with open(filePath) as f :
	lines = f.readlines()
	for line in lines :
		if i < 20 :
			evalLine += line.replace('\r', '').replace('\n', '')
		else :
			rest += line
		i += 1
	f.close()

evalLine = evalLine.replace('>', '>\n')
lines = evalLine.split('\n')
first = True
removed = ''
clean = ''

for line in lines:
	if '<rect' in line and first:
		removed += line
		first = False
	else :
		clean += line + '\n'

if len(removed) > 0 :
	overwrite = open(filePath, 'w')
	overwrite.write(clean + rest)
	overwrite.close()
	print(f'File: {filePath}')
	print(f'Removed: {removed}')
else :
	print(f'Nothing found to remove in {filePath}')