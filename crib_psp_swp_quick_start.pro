pro crib_psp_swp_quick_start
; 
;Welcome to a quick start guide to analyzing PSP SWEAP data. This is work in progress, please check back periodically for updates.
;
;Written by: Jaye Verniero jaye.l.verniero@nasa.gov
;
;The user is encouraged to contact the SPAN instrument team for questions:
;Roberto Livi rlivi@berkeley.edu 
;Ali Rahmati rahmati@berkeley.edu 
;Michael McManus mdmcmanus@berkeley.edu 
;Davin Larson davin@berkeley.edu 
;Phyllis Whittlesey phyllisw@berkeley.edu 
;
;First, here are steps to download SPEDAS:
;  1.) http://spedas.org/wiki/index.php?title=Main_Page
;  2.) Under Downloads and Installation, Nightly build - Quick link to the nightly "bleeding edge" SPEDAS source code zip file.
;  3.) Unzip
;  4.) Do to IDL >> file > new Pro, (name it speeds), click create new project from exising directory, link to directory where spedas is placed.
;  5.) Window >> Preferences >> IDL >> Paths

; ================================================================================

;  Load data

;  ================================================================================

 ; 6.) Choose date to load, and number of days:

  timespan,'2020-01-29',3

;  7.) type:

  spp_swp_spi_load

 ; This loads the protons (the sf00 data product). Each variable will have a number. For example, the variable 'psp_swp_spi_sf00_L3_DENS' might have the number '2' next to it. To plot it, type:

  tplot,2

 ; Plot multiple variables using brackets:

  tplot,[2,8]

 ; You don't have to put numbers, you put the variable name in quotes:

  tplot,'psp_swp_spi_sf00_L3_TEMP'

  ;8.) To load electron data, type:

  spp_swp_spe_load

 ; For encounters 1-9, the strahl electrons are represented by the variable:
  'psp_swp_spe_sf0_L3_EFLUX_VS_PA_E8' 
  
 ; After 9, use:
 'psp_swp_spe_sf0_L3_EFLUX_VS_PA_E12'

 ; 9.) Now add this variable to the top of the plot (using either the number or name)

  tplot,/ad,'psp_swp_spe_sf0_L3_EFLUX_VS_PA_E8'

 ; 10.) If you want to pick the order of panels, type:

  tplot,/pick
 
 ; Then use your cursor to click.

;  11.) If you want to resize the window, drag from the bottom right corner. Then type

  tplot

 ; Again to re-plot on the larger window.

 ; 12.) To zoom in on a time, type:

  tlimit

 ; And use your cursor to select the time range.

 ; 13.) To go back to the last time range you were looking at, type:

  tlimit,/last

;  And for the full time range of data,

  tlimit,/full



;  =================================================

;  psp_swp_spi_sf00_L3_mom_INST_YYYYMMDD_v04.cdf (proton moment) v4 Variable description:

;  DENS - Density (1/cm^3)
;  VEL_INST - Velocity in SPAN-I instrument coordinates (km/s)
;  VEL_SC - Spacecraft Velocity (km/s)
;  VEL_RTN_SUN - Ion Velocity in RTN coordinates (km/s)
;  TEMP - Ion Temperature (eV)
;  T_TENSOR_INST - Temperature Tensor SPAN-I instrument coordinates
;  EFLUX_VS_ENERGY - Proton Differential Energy Flux vs eV
;  EFLUX_VS_THETA - Proton Differential Energy Flux vs Theta (deflectors)
;  EFLUX_VS_PHI - Proton Differential Energy Flux vs Phi (anodes)
;  SUN-DIST - Distance from Sun (km)
;  VENUS-DIST - Distance from Venus (km)
;  SC_VEL_RTN- Spacecraft Velocity in RTN coordinates (km/s)
;  QUAT_SC_TO_RTN - Quaternion rotation of spacecraft in RTN coordinates
;  MAGF_SC - Magnetic field downsampled to SPAN_I time resolution in spacecraft coordinates (nT)
;  MAGF_INST - Magnetic field downsampled to SPAN_I time resolution in SPAN-I instrument coordinates (nT)


end 