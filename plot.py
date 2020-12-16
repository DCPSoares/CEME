import matplotlib.pyplot as plt

r = []
b = []


dataset = open('0,05_N.txt','r')

for line in dataset:
    line = line.strip()
    R, B = line.split('\t')
    r.append(float(R))
    b.append(float(B))


dataset.close()

plt.plot(r, b, label = 'Fluxo magnético')


plt.title ('Fluxo magnético, entreferro 1mm')
plt.xlabel ('Raio,mm')
plt.ylabel ('Fluxo magnético, tesla')
plt.xlim([0,10])
plt.ylim([0,2])
plt.grid()
plt.legend()
plt.show()