# -*- coding: utf-8 -*-
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

matplotlib.rcParams['text.latex.unicode']=True
matplotlib.rcParams['text.usetex']=False

# AGRUPACION:	Astro Córdoba
# OBSERVADOR:   Manolo Barco
# SQM:		SEA#08
# LUGAR:	Santuario Virgen de las veredas
#               (Torrecampo, Córdoba)
# LATITUD:	38 31 26.76   N  
# LONGITUD:	04 38 45.6  W 
# ALTITUD:	481 m			
#               FECHA	     HORA (TU)	T 24 (C)    H (%)	cénit	cielo	 
# INICIO	27/8/2016     23h25m	  	21.39	despejado  	
# FINAL:	28/8/2016     00h14m       		despejado							

# OBSERVACIONES:
# Camima excesiva

#MEDIDA EN EL CENIT:			21,39
#	S			W			N			E		
#	S	S+30	S+60	W	W+30	W+60	N	N+30	N+60	E	E+30	E+60

#30º	21,18	20,95	21,08	21,29	21,47	21,52	21,56	21,46	21,43	21,49	21,47	21,37
#45º	21,31	21,19	21,29	21,43	21,56	21,61	21,63	21,50	21,44	21,51	21,53	21,46
#60º	21,35	21,29	21,35	21,43	21,51	21,56	21,60	21,51	21,46	21,45	21,48	21,43
#75º	21,36	21,35	21,35	21,37	21,39	21,41	21,50	21,48	21,44	21,42	21,39	21,38


#        S -> W -> N -> E -> S
m30 = [21.18 , 20.95 , 21.08 , 21.29 , 21.47 , 21.52 , 21.56 , 21.46 , 21.43 , 21.49 , 21.47 , 21.37]
m45 = [21.31 , 21.19 , 21.29 , 21.43 , 21.56 , 21.61 , 21.63 , 21.50 , 21.44 , 21.51 , 21.53 , 21.46]
m60 = [21.35 , 21.29 , 21.35 , 21.43 , 21.51 , 21.56 , 21.60 , 21.51 , 21.46 , 21.45 , 21.48 , 21.43]
m75 = [21.36 , 21.35 , 21.35 , 21.37 , 21.39 , 21.41 , 21.50 , 21.48 , 21.44 , 21.42 , 21.39 , 21.38]
m90=  [21.39]

x30 = [0, 30 , 60, 90 , 120, 150, 180, 210, 240, 270, 300, 330]
x45 = [0, 30 , 60, 90 , 120, 150, 180, 210, 240, 270, 300, 330]
x60 = [0, 30 , 60, 90 , 120, 150, 180, 210, 240, 270, 300, 330]
x75 = [0, 30 , 60, 90 , 120, 150, 180, 210, 240, 270, 300, 330]
x90 = [180]

xx =  np.linspace(-18,360,27)       # Para interpolar primero en acimuts
print xx                             # en este caso no se interpola porque el muestreo es suficiente

x30 = [-30]    + x30 + [360]         
m30 = [m30[11]]+ m30 + [m30[0]]  
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

x75 = [-30]    + x75 + [360]           
m75 = [m75[11]]+ m75 + [m75[0]]   
interpolater=interp1d(x75,m75,kind='linear')
mm75=interpolater(xx)

x90 = [-30, 0, 30 , 60, 90 , 120, 150, 180, 210, 240, 270, 300, 330,360]
m90=[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]+[m90[0]]
interpolater=interp1d(x90,m90,kind='linear')
mm90=interpolater(xx)

# Grafica al estilo horizontal
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

y = [90., 75., 60., 45., 30.]  
m=[mm90, mm75, mm60, mm45, mm30]

# Grafica horizontal en contornos
CS=contourf(xx,y,m,cmap=plt.cm.gist_yarg)
CS2=contour(CS,levels=CS.levels[::1], colors='w',origin='upper',hold='on')
cbar=colorbar(CS)
cbar.ax.set_ylabel('mag/arcsec2')
cbar.add_lines(CS2)

#show()

xn = np.linspace(0,360,25) 
yn=  np.linspace(30,90,12)
Xn,Yn = np.meshgrid(xn,yn)

#print Yn

todom = m30 + m45 + m60 + m75 + m90
todox = x30 + x45 + x60 + x75 + x90
todoy = [30] * 14 + [45] * 14 + [60] * 14 + [75] * 14 + [90] * 14


assert len(todom) == len(todox) == len(todoy)

mm = ml.griddata(todox, todoy, todom,Xn,Yn,interp='linear')

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
label = u"Santuario Virgen de las Veredas"
ax.text(1.6,1.25, label, fontsize=18, horizontalalignment='center')
ax.text(5.36,1.5, "2016-08-27", fontsize=14, horizontalalignment='center')
ax.text(4.1,1.45, "mag/arcsec$^2$", fontsize=14, horizontalalignment='center')


Xn = (np.pi * (Xn) / 180.)  
Xn = (2* np.pi) - Xn - (np.pi /2.) 
Yn = (90.-Yn) *np.pi/180.

# LATITUD:	38 31 26.76 N  
# LONGITUD:	04 38 45.6  W 
LAT= "38 31 26.8 N"				
LONG="04 38 45.6 W"			
ax.text(1.05,1.25,LAT, fontsize=14, horizontalalignment='left')
ax.text(1.00,1.15,LONG, fontsize=14, horizontalalignment='left')


## niveles = arange(19.4,21.6,0.2)
niveles = arange(19.4,21.8,0.1)
##niveles = arange(18.4,21.1,0.1)
CS = contourf(Xn,Yn,mm,20,cmap=get_cmap('YlGnBu'),levels=niveles) 

print "Minimum=", np.min(mm)
print "Maximum=", np.max(mm)

CS2=contour(CS,levels=[19.0,20.0,20.7,20.9,21.1,21.2,21.3,21.4,21.5,21.6], colors='w',origin='upper',hold='on')
plt.clabel(CS2,fmt = '%2.1f',fontsize=15)

cbaxes = fig.add_axes([0.1, 0.05,0.80,0.04]) 
cbar=colorbar(CS,orientation='horizontal',cax=cbaxes)
#cbar.ax.set_ylabel('mag/arcsec2')
#cbar.add_lines(CS2)

savefig("dummy.png")
show()
