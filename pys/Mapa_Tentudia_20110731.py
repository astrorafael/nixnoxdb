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

# LUGAR	Tentudia 		
# FECHA	31/07/11	OBSERV.	Israel Perez de Tudela - Astronomia Sevilla.
# Monte Tentudia
# 38.054005,-6.338339
				    

#Medicione  1       2       3       4       5       6       7       8       9       10      Hora UT     
#Horizonte       Altura    
#90 Zenit21,60   21,59   21,61   21,60   21,59   21,62   21,61   21,58   21,61   21,58   00:10   21,60   
#180 20  20,17   20,19   20,14   20,16   20,19   20,20   20,14   20,14   20,19   20,20   00:20   20,17   
#180 40  20,94   20,99   20,95   20,93   20,94   20,95   20,96   20,96   20,91   20,96   00:25   20,95   
#180 60  21,33   21,34   21,34   21,33   21,34   21,26   21,31   21,31   21,33   21,31   00:25   21,32   
#180 80  21,41   21,36   21,36   21,36   21,36   21,35   21,36   21,33   21,33   21,36   00:25   21,36   
#210 20  20,55   20,53   20,51   20,53   20,51   20,50   20,53   20,54   20,59   20,54   00:30   20,53   
#210 40  20,91   20,88   20,90   20,88   20,91   20,90   20,92   20,95   20,95   20,92   00:35   20,91   
#210 60  21,21   21,21   21,19   21,22   21,18   21,21   21,21   21,21   21,19   21,18   00:35   21,20   
#210 80  21,60   21,60   21,61   21,62   21,61   21,61   21,62   21,62   21,61   21,59   00:32   21,61   
#240 20  Tapado por el monasterio                                                                     
#240 40  21,37   21,35   21,37   21,40   21,39   21,34   21,33   21,31   21,34   21,34   00:45   21,35   
#240 60  21,37   21,35   21,32   21,35   21,34   21,34   21,34   21,31   21,34   21,34   00:45   21,34   
#240 80  21,59   21,60   21,61   21,62   21,59   21,58   21,61   21,60   21,61   21,61   00:50   21,60   
#270 20  21,19   21,15   21,18   21,24   21,19   21,20   21,20   21,18   21,16   21,19   00:53   21,19   
#270 40  21,34   21,32   21,32   21,32   21,29   21,32   21,32   21,32   21,32   21,31   00:55   21,32   
#270 60  21,47   21,45   21,42   21,45   21,45   21,41   21,48   21,42   21,41   21,42   00:57   21,44   
#270 80  21,72   21,62   21,61   21,66   21,66   21,66   21,65   21,63   21,66   21,66   01:00   21,65   
#300 20  20,94   20,94   20,91   20,89   20,94   20,91   20,90   20,92   20,91   20,93   01:02   20,92   
#300 40  21,22   21,24   21,23   21,23   21,23   21,23   21,20   21,23   21,23   21,23   01:05   21,23   
#300 60  21,49   21,45   21,44   21,47   21,47   21,46   21,46   21,46   21,46   21,46   01:07   21,46   
#300 80  21,72   21,69   21,65   21,68   21,64   21,68   21,69   21,68   21,67   21,67   01:09   21,68   
#330 20  20,80   20,74   20,76   20,76   20,76   20,73   20,76   20,76   20,76   20,76   01:11   20,76   
#330 40  21,20   21,19   21,16   21,14   21,15   21,18   21,18   21,15   21,16   21,14   01:13   21,17   
#330 60  21,45   21,45   21,41   21,44   21,41   21,42   21,43   21,43   21,43   21,43   01:15   21,43
#330 80  21,66   21,65   21,69   21,68   21,65   21,64   21,65   21,67   21,67   21,68   01:18   21,66   
#360 20  20,78   20,78   20,79   20,76   20,77   20,76   20,77   20,77   20,77   20,77   01:20   20,77   
#360 40  21,12   21,16   21,12   21,11   21,12   21,11   21,11   21,11   21,07   21,11   01:23   21,11   
#360 60  21,33   21,28   21,31   21,31   21,30   21,30   21,31   21,30   21,31   21,30   01:25   21,31   
#360 80  21,70   21,65   21,65   21,65   21,65   21,68   21,68   21,68   21,64   21,67   01:29   25,67   
#30  20  20,69   20,75   20,74   20,74   20,74   20,73   20,73   20,73   20,73   20,73   01:34   20,73   
#30  40  21,11   21,11   21,14   21,14   21,13   21,10   21,13   21,10   21,13   21,1    01:34   21,12   
#30  60  21,35   21,35   21,35   21,32   21,35   21,32   21,34   21,34   21,32   21,34   01:37   21,34   
#30  80  21,67   21,66   21,69   21,69   21,69   21,68   21,65   21,67   21,65   21,65   01:39   21,67  
#60  20  21,01   20,97   21,01   20,99   20,99   20,96   20,99   20,99   20,95   20,99   01:40   20,99   
#60  40  21,06   21,06   21,02   21,05   21,04   21,01   21,01   21,04   21,01   21,01   01:42   21,03   
#60  60  21,25   21,26   21,28   21,28   21,26   21,28   21,25   21,27   21,27   21,28   01:44   21,27   
#60  80  21,44   21,42   21,42   21,42   21,41   21,39   21,42   21,41   21,42   21,41   01:47   21,42
#90  20  20,89   20,90   20,90   20,88   20,88   20,86   20,88   20,88   20,85   20,85   01:49   20,88   
#90  40  21,01   21,01   20,97   20,99   20,97   21,01   21,00   20,96   20,99   20,99   01:52   20,99   
#90  60  21,30   21,29   21,32   21,32   21,31   21,30   21,31   21,32   21,32   21,32   01:54   21,31   
#90  80  21,45   21,43   21,46   21,45   21,46   21,45   21,42   21,42   21,46   21,46   01:55   21,45   
#120 20  20,93   20,92   20,86   20,91   20,91   20,91   20,91   20,91   20,89   20,89   01:57   20,90   
#120 40  20,99   20,96   20,99   20,99   20,95   20,95   20,97   20,95   20,99   20,97   01:59   20,97   
#120 60  21,36   21,37   21,37   21,36   21,34   21,36   21,36   21,36   21,33   21,36   02:02   21,36   
#120 80  21,49   21,48   21,48   21,56   21,48   21,48   21,48   21,48   21,49   21,49   02:04   21,49   
#150 20  20,90   20,99   20,96   20,99   21,01   20,96   21,01   21,02   21,02   21,01   02:05   20,99   
#150 40  21,15   21,14   21,14   21,14   21,12   21,12   21,14   21,14   21,12   21,11   02:06   21,13   
#150 60  21,41   21,43   21,43   21,42   21,43   21,43   21,42   21,39   21,42   21,43   02:08   21,42   
#150 80  21,50   21,52   21,51   21,51   21,47   21,49   21,48   21,46   21,49   21,46   02:12   21,49   
#     20    40    60    80
#180 20,17 20,95 21,32 21,36    
#210 20,53 20,91 21,20 21,61   
#240 XX.XX 21,35 21,34 21,60    
#270 21,19 21,32 21,44 21,65    
#300 20,92 21,23 21,46 21,68    
#330 20,76 21,17 21,43 21,66    
#360 20,77 21,11 21,31 21,67    
# 30 20,73 21,12 21,34 21,67    
# 60 20,99 21,03 21,27 21,42    
# 90 20,88 20,99 21,31 21,45    
#120 20,90 20,97 21,36 21,49    
#150 20,99 21,13 21,42 21,49   


# CENIT 	21.60	# HORA INICIO	00:10			
# Acimutes	N	N+30	N+60	E	E+30	E+60	S	S+30	S+60	W	W+30	W+60
#20             20,17 20,53 XX.XX 21,19 20,92 20,76 20,77 20,73 20,99 20,88 20,90 20,99
#40      	20,95 20,91 21,35 21,32 21,23 21,17 21,11 21,12 21,03 20,99 20,97 21,13
#60	        21,32 21,20 21,34 21,44 21,46 21,43 21,31 21,34 21,27 21,31 21,36 21,42
#80	        21,36 21,61 21,60 21,65 21,68 21,66 21,67 21,67 21,42 21,45 21,49 21,49


#        S -> W -> N -> E -> S   
m20 = [20.77, 20.73, 20.99, 20.88, 20.90, 20.99, 20.17, 20.53, 20.60, 21.19, 20.92, 20.76]
m40 = [21.11, 21.12, 21.03, 20.99, 20.97, 21.13, 20.95, 20.91, 21.35, 21.32, 21.23, 21.17]
m60 = [21.31, 21.34, 21.27, 21.31, 21.36, 21.42, 21.32, 21.20, 21.34, 21.44, 21.46, 21.43]
m80 = [21.67, 21.67, 21.42, 21.45, 21.49, 21.49, 21.36, 21.61, 21.60, 21.65, 21.68, 21.66]
m90 = [21.60]													      


#        S -> W -> N -> E -> S   
m20 = [20.17, 20.53, 20.60, 21.19, 20.92, 20.76,20.77, 20.73, 20.99, 20.88, 20.90, 20.99 ]     # Modificado de acuerdo a comentarios de Felipe Gallego
m40 = [20.95, 20.91, 21.35, 21.32, 21.23, 21.17,21.11, 21.12, 21.03, 20.99, 20.97, 21.13 ]
m60 = [21.32, 21.20, 21.34, 21.44, 21.46, 21.43,21.31, 21.34, 21.27, 21.31, 21.36, 21.42 ]
m80 = [21.36, 21.61, 21.60, 21.65, 21.68, 21.66,21.67, 21.67, 21.42, 21.45, 21.49, 21.49 ]
m90 = [21.60]													      

#        S -> W -> N -> E -> S   
m20 = [20.99, 20.90, 20.88, 20.99, 20.71, 20.77,20.76, 20.92, 21.19, 20.60, 20.53, 20.17 ]
m40 = [21.13, 20.97, 20.99, 21.03, 21.12, 21.11,21.17, 21.23, 21.32, 21.35, 20.91, 20.95 ]
m60 = [21.42, 21.36, 21.31, 21.27, 21.34, 21.31,21.43, 21.46, 21.44, 21.34, 21.20, 21.32 ]
m80 = [21.49, 21.49, 21.45, 21.42, 21.67, 21.67,21.66, 21.68, 21.65, 21.60, 21.61, 21.36 ]
m90 = [21.60]													      


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

label = u"Tentudia"
ax.text(1.6,1.5, label, fontsize=18, horizontalalignment='center')
ax.text(5.36,1.7, "2011-07-31", fontsize=14, horizontalalignment='center')
ax.text(4.1,1.7, "mag/arcsec$^2$", fontsize=14, horizontalalignment='center')


Xn = (np.pi * (Xn) / 180.)  
Xn = (2* np.pi) - Xn - (np.pi /2.) 
Yn = (90.-Yn) *np.pi/180.

# 38.054005,-6.338339
# LATITUD:	38 03 14.4  N  
# LONGITUD:	06 20 18.0  W 
LAT= "38 03 14.4 N"				
LONG="06 20 18.0 W"			
ax.text(1.05,1.55,LAT, fontsize=14, horizontalalignment='left')
ax.text(1.00,1.43,LONG, fontsize=14, horizontalalignment='left')

#niveles = arange(19.4,21.6,0.2)
niveles = arange(19.4,21.8,0.1)
CS = contourf(Xn,Yn,mm,20,cmap=get_cmap('YlGnBu'),levels=niveles) 

print "Minimum=", np.min(mm)
print "Maximum=", np.max(mm)

#CS2=contour(CS,levels=[19.0,20.6,20.8,21.0,21.2,21.3], colors='w',origin='upper',hold='on')
CS2=contour(CS,levels=[17.0,17.4,17.8,19.6,20.6,20.9,21.1,21.2,21.3,21.4,21.5], colors='w',origin='upper',hold='on')
plt.clabel(CS2,fmt = '%2.1f',fontsize=15)

cbaxes = fig.add_axes([0.1, 0.05,0.80,0.04]) 
cbar=colorbar(CS,orientation='horizontal',cax=cbaxes)


savefig("dummy.png")
show()
