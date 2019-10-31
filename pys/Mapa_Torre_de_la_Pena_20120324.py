#!/usr/bin/env python
#-*- coding: utf-8 -*-
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

# LUGAR	Torre de Peña, Navarra	
# FECHA	24/03/2012	AstroNavarra
# Fernando Jáuregui

# 42 31 45.09 N
# 01 18 12.49  W
# altitud 459 m      
# SQM_L _2.17  6502

# HORA INICIO	01:15	# HORA FINAL 	03:30	

# Acimutes     S 0   W 90   N 180   E 270
#   0     15    30    45    60    75    90    105   120   135   150   165   180   195   210   225   240   255   270   285   300   315   330   345
# 15 21.10 21.03 20.97 20.89 20.78 20.60 20.52 20.51 20.48 20.45 20.45 20.40 20.11 19.91 20.13 20.54 20.76 20.97 21.05 21.06 21.08 21.15 21.17 21.17
# 30 21.19 21.16 21.10 21.02 20.91 20.80 20.68 20.60 20.56 20.59 20.61 20.61 20.48 20.39 20.47 20.67 20.87 21.02 21.13 21.18 21.19 21.21 21.22 21.21
# 45 21.37       21.30       21.15       21.00       20.93       20.95       20.90       21.00       21.19       21.32       21.39       21.40
# 60 21.47       21.43       21.35       21.26       21.21       21.21       21.20       21.25       21.35       21.45       21.49       21.49
# 75 21.54             21.50             21.45             21.42             21.42             21.47             21.53             21.55
# 90 21.21

m15 = [21.10,21.03,20.97,20.89,20.78,20.60,20.52,20.51,20.48,20.45,20.45,20.40,20.11,19.91,20.13,20.54,20.76,20.97,21.05,21.06,21.08,21.15,21.17,21.17]
m30 = [21.19,21.16,21.10,21.02,20.91,20.80,20.68,20.60,20.56,20.59,20.61,20.61,20.48,20.39,20.47,20.67,20.87,21.02,21.13,21.18,21.19,21.21,21.22,21.21]
m45 = [21.37,21.30,21.15,21.00,20.93,20.95,20.90,21.00,21.19,21.32,21.39,21.40]
m60 = [21.47,21.43,21.35,21.26,21.21,21.21,21.20,21.25,21.35,21.45,21.49,21.49]
m75 = [21.54,21.50,21.45,21.42,21.42,21.47,21.53,21.55]
m90 = [21.53]

#x00 = [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345]
x15 = [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345]
x30 = [0,15,30,45,60,75,90,105,120,135,150,165,180,195,210,225,240,255,270,285,300,315,330,345]
x45 = [0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330]
x60 = [0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330]
x75 = [0, 45, 90, 135, 180, 225, 270, 315]
x90 = [180]

xx =  np.linspace(-30,360,27)       # Para interpolar primero en acimuts

#x00 = [-30] + [-15] + x00 + [360]          
#m00 = [m00[22]] + [m00[21]] + m00 + [m00[0]]  
#interpolater=interp1d(x00,m00,kind='linear')
#mm00=interpolater(xx)

x15 = [-30] + [-15] + x15 + [360]          
m15 = [m15[22]] + [m15[21]] + m15 + [m15[0]]  
interpolater=interp1d(x15,m15,kind='linear')
mm15=interpolater(xx)

x30 = [-30] + [-15] + x30 + [360]          
m30 = [m30[22]] + [m30[21]] + m30 + [m30[0]]  
interpolater=interp1d(x30,m30,kind='linear')
mm30=interpolater(xx)

x45 = [-30]    + x45 + [360]           
m45 = [m45[11]]+ m45 + [m45[0]]   
interpolater=interp1d(x45,m45,kind='linear')
mm45=interpolater(xx)

x60 = [-30]    + x60 + [360]           
m60 = [m60[11]]+ m60 + [m60[0]]   
interpolater=interp1d(x60,m60,kind='linear')
mm60=interpolater(xx)

x75 = [-45]    + x75 + [360]           
m75 = [m75[7]]+ m75 + [m75[0]]   
interpolater=interp1d(x75,m75,kind='linear')
mm75=interpolater(xx)

x90 = [-60,0,60,120,180,240,300,360]
m90=[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]

interpolater=interp1d(x90,m90,kind='linear')
mm90=interpolater(xx)

# Grafica al estilo horizontal
#plt.plot(x00,m00,'bo')
#plt.plot(xx,mm00,'k')
plt.plot(x15,m15,'bo')
plt.plot(xx,mm15,'k')
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

plt.show()

y = [90., 75., 60., 45., 30., 15.]       #, 0.]  
m=[mm90, mm75, mm60, mm45, mm30, mm15]   #,mm00]

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

todom = m15+ m30 + m45 + m60 + m75 + m90
todox = x15+ x30 + x45 + x60 + x75 + x90
todoy = [15] * 27 + [30] * 27 + [45] * 14 + [60] * 14 + [75] * 10 + [90] * 8

print len(x15),len(x30),len(x45),len(x60),len(x75),len(x90)
print len(todom),len(todox),len(todoy)
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

label = u"Torre de Peña"
ax.text(1.6,1.5, label, fontsize=18, horizontalalignment='center')
#ax.text(1.6,1.5, "Torre de Pe\~na", fontsize=18, horizontalalignment='center')
ax.text(5.36,1.7, "2012-03-24", fontsize=14, horizontalalignment='center')
ax.text(4.1,1.7, "mag/arcsec$^2$", fontsize=14, horizontalalignment='center')

Xn = (np.pi * (Xn) / 180.)  
Xn = (2* np.pi) - Xn - (np.pi /2.) 
Yn = (90.-Yn) *np.pi/180.

# 42 31 45.09 N
# 01 18 12.49  W
# LATITUD:	42 31 45.09  N  
# LONGITUD:	01 18 12.49  W 
LAT= "42 31 45.1 N"				
LONG="01 18 12.5 W"			
ax.text(1.05,1.55,LAT, fontsize=14, horizontalalignment='left')
ax.text(1.00,1.43,LONG, fontsize=14, horizontalalignment='left')


## niveles = arange(19.4,21.6,0.2)
niveles = arange(19.4,21.8,0.1)
CS = contourf(Xn,Yn,mm,20,cmap=get_cmap('YlGnBu'),levels=niveles) 

print "Minimum=", np.min(mm)
print "Maximum=", np.max(mm)

#CS2=contour(CS,levels=[19.0,20.6,20.8,21.0,21.2,21.3], colors='w',origin='upper',hold='on')
CS2=contour(CS,levels=[17.0,17.4,17.8,19.6,20.5,20.7,20.9,21.1,21.2,21.3,21.4,21.5], colors='w',origin='upper',hold='on')
plt.clabel(CS2,fmt = '%2.1f',fontsize=15)

cbaxes = fig.add_axes([0.1, 0.05,0.80,0.04]) 
cbar=colorbar(CS,orientation='horizontal',cax=cbaxes)

savefig("dummy.png")
show()
