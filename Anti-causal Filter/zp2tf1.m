function tfunc=zp2tf1(z,p)%(zero array and pole array)
D = poly(p);
N = poly(z);
tfunc=tf(N,D);