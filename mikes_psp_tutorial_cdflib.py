from datetime import datetime
import enum
import dateutil.parser
from datetime import datetime
import pathlib

import matplotlib.pyplot as plt
import numpy as np
import cdflib

load_date = datetime(2020, 1, 29)
current_dir = pathlib.Path(__file__).parent
file_paths = sorted(current_dir.rglob(f'psp_swp_spi_sf00_l3_mom_{load_date.strftime("%Y%m%d")}*.cdf'))
assert len(file_paths) == 1, f"Found {len(file_paths)} paths. In {current_dir}."
file_path = file_paths[0]

cdf = cdflib.CDF(file_path)
time = cdflib.cdfepoch.to_datetime(cdf.varget('Epoch'))
mag_vel = np.sqrt(cdf.varget('VEL_RTN_SUN')[:, 0]**2 + cdf.varget('VEL_RTN_SUN')[:, 1]**2 + cdf.varget('VEL_RTN_SUN')[:, 2]**2)

fig, ax = plt.subplots(3, 1, sharex=True, figsize=(6, 7))
ax[0].plot(time, cdf.varget('DENS'))
for i, component in enumerate(['X', 'Y', 'Z']):
    ax[1].plot(time, cdf.varget('VEL_RTN_SUN')[:, i], label=f"$V_{{{component}}}$")
ax[2].plot(time, mag_vel, label='|V|')

ax[0].set(
    title=f'PSP SWP SPI data from {load_date.date()}',
    ylabel=f'$cm^{3}$'
)
ax[1].set(
    ylabel=f'km/s'
)
ax[-1].set(
    xlabel='Time',
    ylabel=f'km/s'
)
ax[1].legend()
plt.tight_layout()
plt.show()