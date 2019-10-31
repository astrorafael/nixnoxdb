#!/usr/bin/env python
#
# Mapa all-sky de brillo de fondo de cielo
# a partir de medidas en puntos de la boveda celeste
# usando fotometros SQM.
# version 1.2 julio 2011  jzamorano
# Falta pasar de magnitudes a flujos, interpolar y volver a magnitudes

# Version 1.3 septiembre 2011 JZ     
# Mapa con las coordenadas estilo geografico 
# y no astronomico como si el cielo se proyectara en el suelo para poder compa
# mas facilmente con las fuentes de contaminacion luminica.

import matplotlib
from pylab import *
import numpy as np
from matplotlib.pyplot import show
import matplotlib.pyplot as plt
from scipy.interpolate import interp1d

import matplotlib.mlab as ml

from math import pi  
from matplotlib.pyplot import figure, show, rc, grid, savefig
mpl.rcParams['text.latex.unicode']=True
mpl.rcParams['text.usetex']=False

# Carles Schnabel Astro Sabadell
# Observatorio Cal Pigot en Sant Esteve Sesrovires (Barcelona) 
# Coordenadas geograficas
# Longitud: 01 52 25.68 E 
# Latitud:  41 29 41.52 N 
# Elevacion: 180 m 

# Coordenadas UTM
# huso 31 N
# UTMX: 405985 m
# UTMY: 4594393 m 
# Datum: WGS84 

# Medidas con SQM 28/6/2011 (00h 00m - 00h 20m) UT
# Cielo despejado con buena transparencia, T=21C
# Brillo de fondo de cielo en el cenit 19.01 mag/arcsec2

#      S=0 30 60 W=90 120 150 180 210 240 270 300 330
# 90 19.01
# 80 19.01   19.01   19.02   19.07
# 60 19.04 19.08 19.08 19.10 19.06 19.06 19.04 18.99 18.99 19.00 19.03 19.03
# 40 18.77 18.90 19.02 18.95 18.97 18.99 18.89 18.75 18.66 18.75 18.84 18.78
# 20 18.50 18.55 18.57 18.55 18.58 18.35 18.44 18.44 18.15 17.92 18.08 18.05

# Agrupacio Astronomica de Sabadell   (remitido por Carles Schnabel)

#        S -> W -> N -> E -> S
m20 = [ 18.50, 18.55, 18.57, 18.55, 18.58, 18.35, 18.44, 18.44, 18.15, 17.92, 18.08, 18.05]
m40 = [ 18.77, 18.90, 19.02, 18.95, 18.97, 18.99, 18.89, 18.75, 18.66, 18.75, 18.84, 18.78]
m60 = [ 19.04, 19.08, 19.08, 19.10, 19.06, 19.06, 19.04, 18.99, 18.99, 19.00, 19.03, 19.03]
m80 = [ 19.01, 19.01, 19.01, 19.01, 19.02, 19.02, 19.03, 19.04, 19.07, 19.06, 19.04, 19.02]
m90 = [ 19.01]

x20 = [0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330]
x40 = [0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330]
x60 = [0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330]
x80 = [0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330]
x90 = [180]

xx =  np.linspace(-30,360,27)       # Para interpolar primero en acimuts

x20 = [-30]    + x20 + [360]         
m20 = [m20[11]]+ m20 + [m20[0]]  
interpolater=interp1d(x20,m20,kind='linear')
mm20=interpolater(xx)

x40 = [-30]    + x40 + [360]           
m40 = [m40[11]]+ m40 + [m40[0]]   
interpolater=interp1d(x40,m40,kind='linear')
mm40=interpolater(xx)

x60 = [-30]    + x60 + [360]           
m60 = [m60[11]]+ m60 + [m60[0]]   
interpolater=interp1d(x60,m60,kind='linear')
mm60=interpolater(xx)

x80 = [-30]    + x80 + [360]           
m80 = [m80[11]]+ m80 + [m80[0]]   
interpolater=interp1d(x60,m60,kind='linear')
mm80=interpolater(xx)

x90=[-30,0,30,60,90,120,150,180,210,240,270,300,330,360]
m90=[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]

interpolater=interp1d(x90,m90,kind='linear')
mm90=interpolater(xx)

# Grafica al estilo horizontal
plt.plot(x20,m20,'bo')
plt.plot(xx,mm20,'k')
plt.plot(x40,m40,'bo')
plt.plot(xx,mm40,'k')
plt.plot(x60,m60,'bo')
plt.plot(xx,mm60,'k')
plt.plot(x80,m80,'bo')
plt.plot(xx,mm80,'k')
plt.plot(x90,m90,'bo')
plt.plot(xx,mm90,'k')

#plt.show()

y = [90., 80., 60., 40., 20.]  
m=[mm90, mm80, mm60, mm40, mm20]

# Grafica horizontal en contornos
CS=contourf(xx,y,m,cmap=plt.cm.gist_yarg)
CS2=contour(CS,levels=CS.levels[::1], colors='w',origin='upper',hold='on')
cbar=colorbar(CS)
cbar.ax.set_ylabel('mag/arcsec2')
cbar.add_lines(CS2)

#show()

xn = np.linspace(0,360,25) 
yn=  np.linspace(20,90,12)
Xn,Yn = np.meshgrid(xn,yn)

#print Yn

todom = m20 + m40 + m60 + m80 + m90
todox = x20 + x40 + x60 + x80 + x90
todoy = [20] * 14 + [40] * 14 + [60] * 14 + [80] * 14 + [90] * 14


assert len(todom) == len(todox) == len(todoy)

mm = ml.griddata(todox, todoy, todom,Xn,Yn,'linear')

# Polar figure

rc('grid', color='#316931', linewidth=1, linestyle='-')
rc('xtick', labelsize=15)
rc('ytick', labelsize=15)

# force square figure and square axes looks better for polar, IMO
width, height = matplotlib.rcParams['figure.figsize']
size = min(width, height)
size = 6

# make a square figure
fig = figure(figsize=(size, size))
#ax = fig.add_axes([0.1, 0.1, 0.8, 0.7], polar=True, axisbg='#d5de9c')
ax = fig.add_axes([0.03, 0.15, 0.95, 0.72], polar=True, axisbg='#d5de9c')

#r = np.arange(0, 4.0, 0.01)
#theta = 2*np.pi*r
##ax.set_rmax(0.5)
grid(True)

ring_angles = [ (x+0.000001) * (np.pi/180.) for x in range(0,100,15)]
ring_labels = [ str(x) for x in range(0,100,15)]
ring_labels.reverse()
lines,labels = rgrids(ring_angles,ring_labels)

angles,labels = thetagrids( range(360,0,-45), ( 'E', 'SE', 'S', 'SW', 'W','NW', 'N', 'NE') )

label = u"Sant Esteve Sesrovires"
ax.text(1.6,1.5, label, fontsize=18, horizontalalignment='center')
ax.text(5.36,1.7, "2011-06-28", fontsize=14, horizontalalignment='center')
ax.text(4.1,1.7, "mag/arcsec$^2$", fontsize=14, horizontalalignment='center')

Xn = (np.pi * (Xn) / 180.)  
Xn = (2* np.pi) - Xn - (np.pi /2.) 
Yn = (90.-Yn) *np.pi/180.

# Latitud:  41 29 41.52 N
# Longitud: 01 52 25.68 E 
LAT= "41 29 41.52 N"				
LONG="01 52 25.68 E"			
ax.text(1.05,1.55,LAT, fontsize=14, horizontalalignment='left')
ax.text(1.00,1.43,LONG, fontsize=14, horizontalalignment='left')


## niveles = arange(19.4,21.6,0.2)

niveles = arange(19.4,21.8,0.1)
niveles = arange(17.5,19.5,0.1)

CS = contourf(Xn,Yn,mm,20,cmap=get_cmap('YlGnBu'),levels=niveles) 

print "Minimum=", np.min(mm)
print "Maximum=", np.max(mm)

#CS2=contour(CS,levels=[19.0,20.6,20.8,21.0,21.2,21.3], colors='w',origin='upper',hold='on')
CS2=contour(CS,levels=[17.0,17.4,17.8,18.5,18.7,18.9,19.0,19.1], colors='w',origin='upper',hold='on')
plt.clabel(CS2,fmt = '%2.1f',fontsize=15)

cbaxes = fig.add_axes([0.1, 0.05,0.80,0.04]) 
cbar=colorbar(CS,orientation='horizontal',cax=cbaxes)

savefig("dummy.png")
show()
