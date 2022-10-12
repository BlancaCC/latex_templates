
#!/usr/bin/env python
DICT_PATH = './exceptions.txt'

f=open(DICT_PATH, mode='r')
file = f.read().split()
head_limit = 4
head = file[0:head_limit]
file_ordered = sorted(file[head_limit:])
last = file_ordered[-1]
f.close()

f=open(DICT_PATH, mode='w')
[f.write(h+' ') for h in head]
f.write('\n')
[f.write(l+'\n') for l in file_ordered[:-1]]
f.write(last)
f.close()

print(f'{DICT_PATH} has been sorted :D')