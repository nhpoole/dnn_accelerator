#=========================================================================
# globalnetconnect.tcl
#=========================================================================
# Author : Nikhil Poole
# Date   : March 8, 2021

#-------------------------------------------------------------------------
# Global net connections for PG pins
#-------------------------------------------------------------------------

globalNetConnect VDD    -type pgpin -pin VPWR    -inst * -verbose
globalNetConnect VSS    -type pgpin -pin VGND    -inst * -verbose
globalNetConnect VSS    -type pgpin -pin VNB     -inst * -verbose
globalNetConnect VDD    -type pgpin -pin VPB     -inst * -verbose

globalNetConnect VDD    -type pgpin -pin vdd     -inst * -verbose
globalNetConnect VSS    -type pgpin -pin gnd     -inst * -verbose

