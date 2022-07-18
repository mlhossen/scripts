import numpy as np

filename = 'In_Na_41_hbonds.dat'
r = np.loadtxt(filename)
for i in range(0, 4000, 100):
    interval = [x ** 2 for x in r[i:i + 100]]
    av_r = np.mean(interval)
    print(av_r)
