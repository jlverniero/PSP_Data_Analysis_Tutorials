import pyspedas
from pytplot import get_data
from pyspedas import time_string

import dateutil.parser
import matplotlib.pyplot as plt

#import math functions 
import numpy as np

#specify time range in the form ['yyyy-mm-dd/hh:mm:ss','yyyy-mm-dd/hh:mm:ss']
trange=['2020-01-29','2020-01-30']

#specify data type to plot
datatype='spi_sf00_l3_mom' #protons
spi_vars = pyspedas.psp.spi(trange=trange, datatype=datatype, level='l3', time_clip=True, notplot=True)

#plot variable vs time
# tplot('VEL_RTN_SUN')
# #set legend names 
# options('VEL_RTN_SUN', 'legend_names', ['Vr', 'Vt', 'Vn'])

dens_data=get_data('VEL_RTN_SUN')
times = [dateutil.parser.parse(t) for t in time_string(dens_data.times)]

fig, ax = plt.subplots()
ax.plot(times, dens_data.y)
plt.show()
pass