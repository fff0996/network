from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import numpy as np

fig = plt.figure()
ax = Axes3D(fig)
x, y = np.random.rand(2, 100) * 4
hist, xedges, yedges = np.histogram2d(x, y, bins=4)

elements = (len(xedges) - 1) * (len(yedges) - 1)
xpos, ypos = np.meshgrid(xedges[:-1]+0.25, yedges[:-1]+0.25)
xpos
xpos = xpos.flatten()
ypos = ypos.flatten()
zpos = np.zeros(elements)

dx = 0.5 * np.ones_like(zpos)
dy = dx.copy()
dz = hist.flatten()

dx = dx*0.5
xpos = xpos - dx

#두개의 데이터 동시에 같은 bar plot에 그리기 
ax.bar3d(xpos, ypos, zpos, dx, dy, dz, color='b',shade=True)
ax.bar3d(xpos+dx, ypos, zpos, dx, dy, dz, color='r',shade=True)

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')

plt.show()
