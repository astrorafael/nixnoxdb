#!/usr/bin/env python
# coding: utf-8

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

# LUGAR	Venta de la Leche (Zafarraya, Granada)	Llano del Puerto, Cortijo de la Estrella	
# FECHA	2012/05/18	
# Observadores: Jesús Navas Fernández
# 36 59 59.34 N
# 04 12 29.10 W
# altitud 1100 m  

# TU inicio 23h27m   20 grados 25-40% Humedad
# TU final  01h47m 

# Cenit 90   21.21	


#Datos recogidos la noche del 24-25/08/2012.                         
#   S                                   O     ACIMUT
#   0     15    30    45    60    75    90    105   120   135   150   165
#   N                                   E       ACIMUT  
#   180   195   210   225   240   255   270   285   300   315   330   345

#ALTURA 90 21,21
#75 21,20 21,20 21,20 21,19 21,18 21,18 21,16 21,15 21,14 21,13 21,13 21,13 
#   21,13 21,13 21,13 21,16 21,17 21,18 21,19 21,21 21,19 21,21 21,21 21,21
#60 21,16 21,15 21,13 21,12 21,10 21,07 21,02 21,00 20,97 20,97 21,02 21,02 
#   21,02 21,03 21,03 21,04 21,06 21,09 21,13 21,16 21,18 21,18 21,18 21,17
#45 20,98 20,96 20,94 20,93 20,89 20,85 20,81 20,81 20,85 20,92 20,97 21,01 
#   21,00 20,99 20,96 20,93 20,93 20,96 21,00 21,02 21,03 21,04 21,03 21,00
#30 20,74 20,71 20,67 20,62 20,59 20,60 20,63 20,68 20,74 20,80 20,83 20,87 
#   20,89 20,88 20,85 20,79 20,75 20,75 20,77 20,80 20,79 20,80 20,78 20,77
#15 20,56 20,56 20,41 20,22 20,22 20,33 20,39 20,41 20,48 20,55 20,61 20,66 
#   20,70 20,75 20,65 20,55 20,47 20,46 20,52 20,55 20,54 20,54 20,53 20,55
#0  21,01 21,03 20,81 20,48 20,42 20,52 20,50 20,38 20,46 20,64 20,72 20,80 
#   20,94 21,07 20,93 20,78 20,63 20,57 20,65 20,69 20,67 20,66 20,74 20,91

#         S -> W -> N -> E -> S 
m00 = [21.01,21.03,20.81,20.48,20.42,20.52,20.50,20.38,20.46,20.64,20.72,20.80, 
       20.94,21.07,20.93,20.78,20.63,20.57,20.65,20.69,20.67,20.66,20.74,20.91]
m15 = [20.56,20.56,20.41,20.22,20.22,20.33,20.39,20.41,20.48,20.55,20.61,20.66, 
       20.70,20.75,20.65,20.55,20.47,20.46,20.52,20.55,20.54,20.54,20.53,20.55]
m30 = [20.74,20.71,20.67,20.62,20.59,20.60,20.63,20.68,20.74,20.80,20.83,20.87, 
       20.89,20.88,20.85,20.79,20.75,20.75,20.77,20.80,20.79,20.80,20.78,20.77]
m45 = [20.98,20.96,20.94,20.93,20.89,20.85,20.81,20.81,20.85,20.92,20.97,21.01,
       21.00,20.99,20.96,20.93,20.93,20.96,21.00,21.02,21.03,21.04,21.03,21.00]
m60 = [21.16,21.15,21.13,21.12,21.10,21.07,21.02,21.00,20.97,20.97,21.02,21.02, 
       21.02,21.03,21.03,21.04,21.06,21.09,21.13,21.16,21.18,21.18,21.18,21.17]
m75 = [21.20,21.20,21.20,21.19,21.18,21.18,21.16,21.15,21.14,21.13,21.13,21.13, 
       21.13,21.13,21.13,21.16,21.17,21.18,21.19,21.21,21.19,21.21,21.21,21.21]
m90 = [21.21]

x00 = [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345]
x15 = [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345]
x30 = [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345]
x45 = [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345]
x60 = [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345]
x75 = [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345]
x90 = [180]

xx =  np.linspace(-15,360,27)       # Para interpolar primero en acimuts

x00 = [-15]    + x00 + [360]         
m00 = [m00[23]]+ m00 + [m00[0]]  
interpolater=interp1d(x00,m00,kind='linear')
mm00=interpolater(xx)

x15 = [-15]    + x15 + [360]         
m15 = [m15[23]]+ m15 + [m15[0]]  
interpolater=interp1d(x15,m15,kind='linear')
mm15=interpolater(xx)

x30 = [-15]    + x30 + [360]         
m30 = [m30[23]]+ m30 + [m30[0]]  
interpolater=interp1d(x30,m30,kind='linear')
mm30=interpolater(xx)

x45 = [-15]    + x45 + [360]         
m45 = [m45[23]]+ m45 + [m45[0]]  
interpolater=interp1d(x45,m45,kind='linear')
mm45=interpolater(xx)

x60 = [-15]    + x60 + [360]         
m60 = [m60[23]]+ m60 + [m60[0]]  
interpolater=interp1d(x60,m60,kind='linear')
mm60=interpolater(xx)

x75 = [-15]    + x75 + [360]         
m75 = [m75[23]]+ m75 + [m75[0]]  
interpolater=interp1d(x75,m75,kind='linear')
mm75=interpolater(xx)

x90 =[-15,0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345,360]
m90 =[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]

nterpolater=interp1d(x90,m90,kind='linear')
mm90=interpolater(xx)

# Grafica al estilo horizontal
plt.plot(x00,m00,'bo')
plt.plot(xx,mm00,'k')

plt.plot(x30,m30,'bo')
plt.plot(xx,mm30,'k')

plt.plot(x45,m45,'bo')
plt.plot(xx,mm45,'k')

plt.plot(x60,m60,'bo')
plt.plot(xx,mm60,'k')

plt.plot(x75,m75,'bo')
plt.plot(xx,mm75,'k')

plt.plot(x90,m90,'bo')
plt.plot(xx,mm90,'k')

#plt.show()

y = [90., 75., 60., 45., 30., 15., 00.]  
m=[mm90, mm75, mm60, mm45, mm30, mm15, mm00]

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

todom = m00 + m15 + m30 + m45 + m60 + m75 + m90
todox = x00 + x15 + x30 + x45 + x60 + x75 + x90
todoy = [0] * 26 + [15] * 26 + [30] * 26 + [45] * 26 + [60] * 26 + [75]*26 +[90] * 26


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

label = u"Venta de la Leche"
ax.text(1.6,1.5, label, fontsize=18, horizontalalignment='center')
ax.text(5.36,1.7, "2012-08-24", fontsize=14, horizontalalignment='center')
ax.text(4.1,1.7, "mag/arcsec$^2$", fontsize=14, horizontalalignment='center')

#ax.text(1.2,-1.7, "(Zafarraya, Granada)", fontsize=16, horizontalalignment='left')

Xn = (np.pi * (Xn) / 180.)  
Xn = (2* np.pi) - Xn - (np.pi /2.) 
Yn = (90.-Yn) *np.pi/180.

# 36 59 59.34 N
# 04 12 29.10 W
# LATITUD:	36 59 59.34 N 
# LONGITUD:	04 12 29.10 W 
LAT= "36 59 59.3 N"				
LONG="04 12 29.1 W"			
ax.text(1.05,1.55,LAT, fontsize=14, horizontalalignment='left')
ax.text(1.00,1.43,LONG, fontsize=14, horizontalalignment='left')

## niveles = arange(19.4,21.6,0.2)
niveles = arange(19.4,21.8,0.1)
##niveles = arange(18.4,21.1,0.1)
##niveles = arange(16.3,18.7,0.1)
CS = contourf(Xn,Yn,mm,20,cmap=get_cmap('YlGnBu'),levels=niveles) 

print "Minimum=", np.min(mm)
print "Maximum=", np.max(mm)

#CS2=contour(CS,levels=[19.0,20.6,20.8,21.0,21.2,21.3], colors='w',origin='upper',hold='on')
CS2=contour(CS,levels=[17.0,17.4,17.8,19.6,20.8,20.9,21.0,21.1,21.2,21.3,21.5], colors='w',origin='upper',hold='on')
plt.clabel(CS2,fmt = '%2.1f',fontsize=15)

cbaxes = fig.add_axes([0.1, 0.05,0.80,0.04]) 
cbar=colorbar(CS,orientation='horizontal',cax=cbaxes)

savefig("dummy.png")
show()
