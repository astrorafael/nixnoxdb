# -*- coding: utf-8 -*-
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

matplotlib.rcParams['text.latex.unicode']=True
matplotlib.rcParams['text.usetex']=False

# Independiente
# Observadores: José Pascual Rochera Alba 
# FECHA	2016/08/09	
# Fotómetro SQM-L manual 
# LUGAR: Vilafranca del Cid 	
# Localización: Comarca de l'Alt Maestrat
# Paraje: Montaña cerca de la población de Vilafranca
# 40 27 32.19 N
# 00 12 46.91 W
# altitud 1300 m  
# TU inicio 23h 35m   
# TU final  00h 44m 

# T = 19C

# Comentarios
# Azimut 0º en Sur
# Azimut 0º en Sur

# Medida en el Cenit 90   21.33	
#AZIMUT   0° 15º 30° 45º 60° 75º 90° 105º 120° 135º 150° 165º 180° 195º 210° 225º 240° 255º 270° 285º 300° 315º 330° 345º
#         S          		  W		               N              		     O
# ALTURA

# S -> W -> N -> E ->S 

m15 = [20.95,21.04,21.00,20.41,20.12,20.72,21.13,21.16,21.13,21.02,21.01,20.98,21.01,21.00,21.02,21.00,20.95,20.80,20.69,20.63,20.64,20.69,20.68,20.78]
m30 = [21.09,21.17,21.20,20.92,20.42,20.89,21.31,21.32,21.31,21.08,21.19,21.17,21.21,21.25,21.27,21.26,21.22,21.16,21.11,21.07,21.04,20.99,20.95,21.00]
m45 = [21.18,21.22,21.21,21.28,21.25,21.37,21.39,21.39,21.36,21.26,21.27,21.28,21.30,21.36,21.39,21.40,21.39,21.36,21.33,21.29,21.23,21.15,21.09,21.11]
m60 = [21.18,21.18,21.21,21.27,21.30,21.33,21.35,21.33,21.32,21.32,21.29,21.34,21.30,21.34,21.38,21.41,21.43,21.41,21.39,21.36,21.30,21.23,21.19,21.16]
m75 = [21.23,21.23,21.27,21.26,21.26,21.26,21.28,21.28,21.29,21.30,21.33,21.34,21.24,21.25,21.26,21.29,21.29,21.30,21.29,21.30,21.28,21.25,21.24,21.22]
m90 = [21.33]

x15 = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300, 315, 330, 345]
x30 = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300, 315, 330, 345]
x45 = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300, 315, 330, 345]
x60 = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300, 315, 330, 345]
x75 = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300, 315, 330, 345]
x90 = [180]

xx =  np.linspace(-15,360,26)       # No interpolaremos con tantos datos
print xx

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
interpolater=interp1d(x60,m60,kind='linear')
mm75=interpolater(xx)

x90 = [-15, 0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 180, 195, 210, 225, 240, 255, 270, 285, 300, 315, 330, 345, 360]
m90=[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]
print len(x90),len(m90)

interpolater=interp1d(x90,m90,kind='linear')
mm90=interpolater(xx)

# Grafica al estilo horizontal
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

#plt.show()

y = [90., 75., 60., 45., 30., 15.]  
#m=[mm90, mm75, mm60, mm45, mm30, mm15]
m=[m90, m75, m60, m45, m30, m15]   # sin interpolar

# Grafica horizontal en contornos
CS=contourf(xx,y,m,cmap=plt.cm.gist_yarg)
CS2=contour(CS,levels=CS.levels[::1], colors='w',origin='upper',hold='on')
cbar=colorbar(CS)
cbar.ax.set_ylabel('mag/arcsec2')
cbar.add_lines(CS2)

#show()

xn = np.linspace(0,360,25) 
print xn
yn=  np.linspace(20,90,12)
Xn,Yn = np.meshgrid(xn,yn)

#print Yn

todom = m15 + m30 + m45 + m60 + m75 + m90
todox = x15 + m30 + x45 + x60 + x75 + x90
todoy = [15] * 26 + [30] * 26 + [45] * 26 + [60] * 26 + [75] * 26 + [90] * 26

assert len(todom) == len(todox) == len(todoy)

mm = ml.griddata(todox, todoy, todom,Xn,Yn,interp="linear")

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

label = u"Vilafranca del Cid"
ax.text(1.6,1.5, label, fontsize=18, horizontalalignment='center')
ax.text(5.36,1.7, "2016-08-09", fontsize=14, horizontalalignment='center')
ax.text(4.1,1.7, "mag/arcsec$^2$", fontsize=14, horizontalalignment='center')


Xn = (np.pi * (Xn) / 180.)  
Xn = (2* np.pi) - Xn - (np.pi /2.) 
Yn = (90.-Yn) *np.pi/180.

# 40 27 32.19 N
# 00 12 46.91 W    
# LATITUD:	40 27 32.19  N  
# LONGITUD:	00 12 46.91  W 
LAT= "40 27 32.2 N"				
LONG="00 12 46.9 W"			
ax.text(1.05,1.55,LAT, fontsize=14, horizontalalignment='left')
ax.text(1.00,1.43,LONG, fontsize=14, horizontalalignment='left')


#niveles = arange(19.4,21.6,0.2)
#niveles = arange(19.4,21.8,0.1)
niveles = arange(19.4,21.8,0.1)

CS = contourf(Xn,Yn,mm,20,cmap=get_cmap('YlGnBu'),levels=niveles) 

print "Minimum=", np.min(mm)
print "Maximum=", np.max(mm)

#CS2=contour(CS,levels=[19.0,20.6,20.8,21.0,21.2,21.3], colors='w',origin='upper',hold='on')
CS2=contour(CS,levels=[20.6,20.8,21.1,21.2,21.3,21.4, 21.5], colors='w',origin='upper',hold='on')
plt.clabel(CS2,fmt = '%2.1f',fontsize=15)

cbaxes = fig.add_axes([0.1, 0.05,0.80,0.04]) 
cbar=colorbar(CS,orientation='horizontal',cax=cbaxes)

savefig("dummy.png")
show()

