#=========================================================================
# floorplan.tcl
#=========================================================================
# Author : Nikhil Poole
# Date   : March 05, 2021

#-------------------------------------------------------------------------
# Floorplan variables
#-------------------------------------------------------------------------

# Set the floorplan to target a reasonable placement density with a good
# aspect ratio (height:width). An aspect ratio of 2.0 here will make a
# rectangular chip with a height that is twice the width.

set core_aspect_ratio   1.00; # Aspect ratio 1.0 for a square chip
set core_density_target 0.55; # Placement density target of 55% to account
                              # for SRAM halos.

# Make room in the floorplan for the core power ring

set pwr_net_list {VDD VSS}; # List of power nets in the core power ring

set M1_min_width   [dbGet [dbGetLayerByZ 1].minWidth]
set M1_min_spacing [dbGet [dbGetLayerByZ 1].minSpacing]

set savedvars(p_ring_width)   [expr 48 * $M1_min_width];   # Arbitrary!
set savedvars(p_ring_spacing) [expr 24 * $M1_min_spacing]; # Arbitrary!

# Core bounding box margins

set core_margin_t [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]
set core_margin_b [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]
set core_margin_r [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]
set core_margin_l [expr ([llength $pwr_net_list] * ($savedvars(p_ring_width) + $savedvars(p_ring_spacing))) + $savedvars(p_ring_spacing)]

#-------------------------------------------------------------------------
# Floorplan
#-------------------------------------------------------------------------

# Calling floorPlan with the "-r" flag sizes the floorplan according to
# the core aspect ratio and a density target (55% is a reasonable
# density with halos included).
#

floorPlan -r $core_aspect_ratio $core_density_target \
             $core_margin_l $core_margin_b $core_margin_r $core_margin_t

setFlipping s
addHaloToBlock 70 40 10 10 -allBlock

# Use automatic floorplan synthesis to pack macros (e.g., SRAMs) together
planDesign

selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
flipOrRotateObject -rotate R180
uiSetTool move
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 263.381 746.898 874.891 1342.088
zoomBox -473.03300 37.67500 2798.77200 1671.32100
zoomBox -589.70400 -137.13100 3259.47900 1784.80600
zoomBox -450.33700 -43.95500 2821.46900 1589.69200
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 15.174 904.849 626.684 1500.039
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 285.945 762.696 897.455 1357.886
zoomBox -306.49100 105.98400 2474.54500 1494.58400
zoomBox -184.22200 233.43200 2179.65900 1413.74200
uiSetTool move
uiSetTool select
deselectAll
zoomBox -401.14300 127.27200 2379.89400 1515.87300
zoomBox -627.57700 51.45600 2644.23400 1685.10500
zoomBox -831.45100 -107.02400 3017.73800 1814.91600
zoomBox -685.31500 -38.93300 2586.49600 1594.71600
zoomBox -572.26900 -10.16400 2208.77100 1378.43800
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
flipOrRotateObject -rotate R180
uiSetTool move
zoomBox -780.76200 -90.04100 2491.04900 1543.60800
zoomBox -1024.05700 -180.03200 2825.13200 1741.90800
zoomBox -1310.28700 -285.90400 3218.17100 1975.20200
zoomBox -1647.02800 -410.46000 3680.57000 2249.66500
zoomBox -2043.19500 -556.99600 4224.56800 2572.56300
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 279.436 79.861 890.946 675.051
zoomBox -1706.68100 -411.10800 3620.91800 2249.01700
zoomBox -2036.06300 -510.31200 4231.70100 2619.24700
zoomBox -1619.14900 -77.18900 3708.45100 2582.93700
zoomBox -516.11600 208.40700 3333.07700 2130.34900
zoomBox -104.78400 330.25400 3167.03100 1963.90500
zoomBox 242.81800 434.50000 3023.86100 1823.10400
zoomBox 538.27900 523.11000 2902.16600 1703.42300
zoomBox 789.42200 598.42800 2798.72600 1601.69400
zoomBox 1002.89300 662.44800 2710.80200 1515.22500
uiSetTool select
deselectAll
selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
flipOrRotateObject -rotate R180
flipOrRotateObject -rotate R90
flipOrRotateObject -rotate R90
flipOrRotateObject -rotate R90
flipOrRotateObject -flip MX
flipOrRotateObject -flip MX
flipOrRotateObject -flip MY
zoomBox 872.77100 528.79400 2882.07800 1532.06200
zoomBox 687.16400 383.78200 3051.05500 1564.09700
zoomBox 176.70900 22.28400 3448.53100 1655.93900
zoomBox -166.93300 -202.29700 3682.27100 1719.65000
deselectAll
selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
flipOrRotateObject -rotate R270
flipOrRotateObject -rotate R90
flipOrRotateObject -rotate R90
flipOrRotateObject -flip MY
zoomBox -543.57700 -221.97200 3984.89800 2039.14200
zoomBox -969.60300 -256.69400 4358.01500 2403.44100
deselectAll
uiSetTool move
uiSetTool select
uiSetTool move
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
uiSetTool select
zoomBox -807.57100 129.09900 3720.90500 2390.21400
zoomBox -689.98700 454.68100 3159.21800 2376.62900
zoomBox -590.04000 731.42500 2681.78400 2365.08100
zoomBox -505.08700 966.65800 2275.96500 2355.26600
zoomBox -432.87600 1166.60600 1931.01900 2346.92300
zoomBox -505.08700 966.65700 2275.96600 2355.26600
zoomBox -689.99000 454.67800 3159.22100 2376.62900
zoomBox -795.86300 210.60800 3732.62100 2471.72700
zoomBox -920.41900 -76.53300 4407.20900 2583.60700
zoomBox -815.15300 257.45400 3713.33100 2518.57300
zoomBox -725.67600 541.34300 3123.53500 2463.29400
zoomBox -639.66700 798.17800 2632.16400 2431.83700
zoomBox -453.33600 1358.91000 1555.97700 2362.18100
zoomBox -338.90800 1703.26900 895.06400 2319.40400
zoomBox -192.96400 1851.57500 698.58200 2296.73300
zoomBox -48.71100 1999.86100 498.81000 2273.24400
zoomBox 63.01000 2110.14100 348.82100 2252.84900
zoomBox 156.54000 2203.77600 222.74100 2236.83100
zoomBox 170.04600 2217.48000 204.60600 2234.73600
zoomBox 176.67500 2224.82800 194.71800 2233.83700
zoomBox 180.03300 2228.68700 189.45400 2233.39100
zoomBox 181.44200 2230.30400 187.22800 2233.19300
zoomBox 176.87100 2226.50000 192.21700 2234.16200
zoomBox 161.27800 2214.85000 209.15300 2238.75400
zoomBox 112.65700 2178.53000 262.00000 2253.09900
zoomBox -8.11300 2083.27600 387.87100 2280.99500
zoomBox -185.66200 1943.23800 572.92100 2322.00600
zoomBox -233.11600 1889.32100 659.33500 2334.93100
zoomBox -354.62500 1751.26500 880.60300 2368.02700
zoomBox -431.89600 1663.47000 1021.31400 2389.07300
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
flipOrRotateObject -rotate R180
flipOrRotateObject -flip MY
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram
flipOrRotateObject -rotate R180
flipOrRotateObject -flip MY
zoomBox -529.52300 1578.22300 1180.13500 2431.87300
zoomBox -626.48500 1474.39500 1384.87800 2478.68900
zoomBox -740.55700 1352.24400 1625.75200 2533.76700
zoomBox -874.76200 1208.53700 1909.13400 2598.56500
zoomBox -1218.39600 840.56800 2634.74700 2764.48200
zoomBox -1436.92300 606.56600 3096.18600 2869.99400
zoomBox -1694.01400 331.26900 3639.05600 2994.12600
zoomBox -1446.85500 623.66800 3086.25600 2887.09700
zoomBox -1139.69800 820.62400 2713.44700 2744.53900
zoomBox -878.61400 988.03600 2396.55900 2623.36400
zoomBox -685.49300 1131.35300 2098.40500 2521.38200
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
flipOrRotateObject -rotate R180
flipOrRotateObject -flip MY
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram
flipOrRotateObject -rotate R180
flipOrRotateObject -flip MY
zoomBox -767.82400 921.29000 2507.35000 2556.61800
zoomBox -864.68400 675.75100 2988.46200 2599.66700
zoomBox -978.63900 386.88200 3554.47600 2650.31300
zoomBox -1127.59700 40.41600 4205.47900 2703.27600
zoomBox -1389.16700 -373.68200 4885.04100 2759.09500
deselectAll
uiSetTool move
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 2517.795 483.936 2904.225 835.006
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram 2958.263 496.918 3344.693 847.988
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 2496.16 78.539 2882.59 429.609
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram 2984.225 91.521 3370.655 442.591
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 190.751 1307.902 802.261 1903.092
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 179.913 642.375 791.423 1237.565
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 192.897 607.759 804.407 1202.949
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 194.175 100.175 580.605 451.245
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 665.822 103.156 1052.252 454.226
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 683.128 98.828 1069.558 449.898
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram 2551.523 860.392 2937.953 1211.462
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram 2547.753 1968.111 2934.183 2319.181
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram 3079.09 1950.803 3465.52 2301.873
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram 2456.886 1567.041 2843.316 1918.111
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram 3057.454 1515.116 3443.884 1866.186
deselectAll
selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setObjFPlanBox Instance weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 902.803 1474.559 1497.993 2086.069
deselectAll
selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
setObjFPlanBox Instance weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 1573.495 1470.403 2168.685 2081.913
setObjFPlanBox Instance weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 1599.457 1479.059 2194.647 2090.569
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram 1733.715 168.063 2120.145 519.133
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram 1210.138 169.406 1596.568 520.476
zoomBox -1156.15700 -230.24100 4176.92100 2432.62000
zoomBox -646.65000 83.41100 2628.52800 1718.74100
zoomBox -525.01700 158.28800 2258.88500 1548.31900
zoomBox -59.52200 461.06200 832.93500 906.67500
zoomBox -22.50000 483.58900 736.08800 862.36000
zoomBox 128.17300 570.31800 371.36100 691.74400
zoomBox 170.06400 592.61700 277.96800 646.49500
zoomBox 185.77000 598.07200 252.03700 631.16000
zoomBox 203.53500 605.69200 218.88600 613.35700
zoomBox 205.57200 606.50800 215.00300 611.21700
zoomBox 200.33800 604.17700 225.34700 616.66400
zoomBox 181.00100 596.28200 259.01300 635.23400
zoomBox 122.16200 572.38000 365.51800 693.89000
zoomBox 72.59800 552.66000 468.86300 750.51900
zoomBox 23.26400 533.03100 571.72800 806.88500
zoomBox -145.07000 461.67900 905.61900 986.29900
zoomBox -202.99700 434.44200 1033.10800 1051.64200
zoomBox -445.64600 320.34800 1567.14600 1325.35600
zoomBox -1778.36300 -306.29300 4500.29300 2828.70500
zoomBox -1501.02000 -182.88500 3835.83800 2481.86300
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_3__sram 1792.604 105.495 2179.034 456.565
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_2__sram 1283.752 106.835 1670.182 457.905
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 811.951 102.511 1198.381 453.581
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 786.186 102.51 1172.616 453.58
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 282.51 100.175 668.94 451.245
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 192.895 534.148 804.405 1129.338
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 179.708 1241.649 791.218 1836.839
zoomBox -642.48400 474.54100 2143.39100 1865.55700
zoomBox -186.05800 817.09100 1268.18800 1543.21100
zoomBox 214.26200 1117.53200 500.56900 1260.48800
zoomBox 268.85100 1158.50200 395.89000 1221.93400
zoomBox 288.19800 1173.24300 354.51500 1206.35600
zoomBox 299.46300 1182.22800 328.89000 1196.92100
zoomBox 303.75800 1185.59400 319.12000 1193.26400
zoomBox 306.00000 1187.42600 314.02100 1191.43100
zoomBox 307.16900 1188.38300 311.35900 1190.47500
zoomBox 304.41400 1186.01500 317.49600 1192.54700
zoomBox 274.43600 1161.05700 382.65900 1215.09400
zoomBox 201.66900 1101.42000 539.26200 1269.98400
zoomBox 157.22400 1068.02300 624.48200 1301.33000
zoomBox 95.70800 1027.17900 742.43400 1350.09600
zoomBox 10.56800 970.64700 905.69100 1417.59100
zoomBox -97.07800 880.30900 1141.84700 1498.91700
zoomBox -257.55600 764.16200 1457.22100 1620.36800
zoomBox -464.68100 604.27600 1908.71600 1789.33800
zoomBox -596.39800 502.60000 2195.83500 1896.79100
zoomBox -751.35900 382.98100 2533.62200 2023.20600
zoomBox -933.66600 242.25300 2931.01900 2171.93000
uiSetTool select
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
flipOrRotateObject -flip MX
uiSetTool move
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 176.904 568.799 788.414 1163.989
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 174.24 587.457 785.75 1182.647
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 184.901 606.112 796.411 1201.302
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 179.57 603.445 791.08 1198.635
zoomBox -1349.45300 80.45400 3197.23500 2350.66200
zoomBox -1846.91400 -51.79600 3502.13000 2619.03700
zoomBox -1492.21800 -24.12900 3054.47100 2246.08000
zoomBox -1206.71800 2.21000 2657.96900 1931.88800
zoomBox -977.63600 19.00100 2307.34900 1659.22800
zoomBox -784.95500 28.85600 2007.28300 1423.04900
zoomBox -481.96500 44.35300 1535.42800 1051.65800
zoomBox -263.05500 55.54800 1194.51300 783.32700
zoomBox -177.56100 59.92100 1061.37200 678.53300
zoomBox -104.89100 63.63800 948.20200 589.45800
zoomBox -161.15600 57.48600 1077.77700 676.09800
zoomBox -504.62900 19.93100 1868.77900 1204.99800
zoomBox -631.43600 6.06600 2160.80900 1400.26300
zoomBox -780.62100 -10.24600 2504.37400 1629.98600
zoomBox -956.13200 -29.43700 2908.56800 1900.24800
zoomBox -1085.47900 -131.50300 3461.22800 2138.71500
zoomBox -486.25400 183.63100 3378.44700 2113.31600
zoomBox 456.76600 672.52200 3249.01300 2066.72000
zoomBox 1373.72000 1132.48500 3088.51000 1988.69700
zoomBox 1775.40700 1331.68700 3014.34200 1950.30000
zoomBox 1530.91700 1254.23800 3245.70500 2110.44900
zoomBox 1158.45500 1150.67400 3531.86500 2335.74200
zoomBox 905.99700 1055.93000 3698.24400 2450.12800
zoomBox 608.98700 944.46700 3893.98400 2584.70000
zoomBox 244.37200 792.94400 4109.07500 2722.63000
zoomBox -184.58700 614.68200 4362.12300 2884.90100
zoomBox -651.06300 369.54700 4698.00800 3040.39300
zoomBox -1159.49600 66.83100 5133.52900 3209.00300
zoomBox -1016.27500 338.95000 4332.79600 3009.79600
zoomBox -876.27700 533.17600 3670.43400 2803.39600
uiSetTool select
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
flipOrRotateObject -rotate R90
flipOrRotateObject -flip MY
flipOrRotateObject -flip MY
flipOrRotateObject -flip MX
uiSetTool moveWire
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
uiSetTool move
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 148.353 1473.689 743.543 2085.199
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 201.662 1473.69 796.852 2085.2
zoomBox -985.28800 268.67400 4363.78400 2939.52100
zoomBox -1113.53600 -42.50500 5179.49000 3099.66800
zoomBox -929.95300 155.40000 4419.11900 2826.24700
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 198.015 743.628 809.525 1338.818
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 172.192 754.697 783.702 1349.887
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 175.879 754.695 787.389 1349.885
zoomBox -755.09400 449.23000 3791.61800 2719.45000
zoomBox -372.74400 1091.72500 2419.50700 2485.92500
zoomBox -281.46700 1245.10600 2091.94700 2430.17600
zoomBox -203.88200 1375.48000 1813.52100 2382.79000
zoomBox -14.36700 1670.22200 1224.57200 2288.83700
zoomBox 118.77400 1890.35800 765.51000 2213.28000
zoomBox 165.46200 2001.43300 503.06400 2170.00100
zoomBox 189.83300 2059.41500 366.06500 2147.40900
zoomBox 199.18500 2089.27600 291.18000 2135.21000
zoomBox 203.59300 2104.51000 251.61700 2128.48900
zoomBox 208.04400 2112.15700 233.11300 2124.67400
zoomBox 210.43200 2116.16400 223.51900 2122.69800
zoomBox 211.43800 2117.85200 219.47500 2121.86500
zoomBox 211.23500 2117.42800 220.69200 2122.15000
zoomBox 210.99900 2116.93000 222.12500 2122.48500
zoomBox 204.51800 2099.59400 271.01600 2132.79700
zoomBox 192.24600 2064.67700 368.56700 2152.71600
zoomBox 221.42400 2091.47200 313.46500 2137.42900
zoomBox 236.65200 2105.45900 284.70100 2129.45000
zoomBox 243.98700 2113.86500 265.30800 2124.51100
zoomBox 246.86400 2117.72500 256.32700 2122.45000
zoomBox 247.67700 2119.25000 252.61800 2121.71700
zoomBox 247.11700 2118.23700 255.16400 2122.25500
zoomBox 244.04600 2112.67200 269.15100 2125.20700
zoomBox 234.86800 2096.92100 313.18800 2136.02700
zoomBox 226.38300 2082.36100 353.91500 2146.03900
zoomBox 235.23500 2088.12600 343.63900 2142.25300
zoomBox 271.67700 2111.89200 301.21800 2126.64200
zoomBox 279.12100 2116.81000 292.23200 2123.35600
zoomBox 281.41700 2118.68400 288.26400 2122.10300
zoomBox 278.26300 2116.11300 293.70100 2123.82100
zoomBox 279.79800 2118.68300 286.64700 2122.10300
zoomBox 277.77400 2115.29600 295.93900 2124.36600
zoomBox 273.70500 2108.47800 314.64600 2128.92000
zoomBox 267.00900 2097.25700 345.43900 2136.41800
zoomBox 288.94400 2110.37600 323.74400 2127.75200
zoomBox 297.36300 2115.30800 315.53000 2124.37900
zoomBox 298.74200 2116.11600 314.18400 2123.82600
zoomBox 303.36300 2118.69300 310.21500 2122.11400
zoomBox 302.03300 2117.93400 311.51600 2122.66900
zoomBox 273.12000 2101.44700 339.79100 2134.73700
zoomBox 251.94200 2089.37000 360.50700 2143.57800
zoomBox 181.72600 2052.47800 426.40400 2174.64800
zoomBox 51.19100 1966.79500 602.63600 2242.13700
zoomBox -96.24900 1870.01500 801.69000 2318.36500
zoomBox -378.64400 1648.86300 1341.52700 2507.76200
zoomBox -919.62200 1225.20500 2375.68700 2870.58700
zoomBox -1159.85300 1026.28300 2716.98200 2962.02700
zoomBox -1442.47700 792.25700 3118.50600 3069.60300
zoomBox -1776.08600 552.45800 3589.77700 3231.68900
zoomBox -2002.04100 246.83200 4310.74000 3398.86900
zoomBox -2245.59000 -153.44700 5181.21200 3554.83200
zoomBox -1890.64000 224.55200 4422.14200 3376.58900
zoomBox -1570.64800 524.95300 3795.21700 3204.18500
zoomBox -1285.33200 751.98500 3275.65300 3029.33200
zoomBox -1567.87300 524.95300 3797.99200 3204.18500
zoomBox -1769.66500 165.12400 4543.11800 3317.16200
zoomBox -2007.06700 -258.20400 5419.73700 3450.07600
zoomBox -1379.37400 -189.05800 4933.40900 2962.98000
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram 1799.485 1057.664 2185.915 1408.734
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram 1798.929 644.602 2185.359 995.672
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram 1294.462 1031.543 1680.892 1382.613
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram 1289.554 609.771 1675.984 960.841
zoomBox -965.34300 -153.79300 4400.52300 2525.43900
zoomBox 1032.13400 22.15900 1930.07900 470.51200
zoomBox 1256.31500 69.16300 1654.74000 268.10100
zoomBox 1400.63700 99.83400 1479.07900 139.00100
zoomBox 1417.91000 103.35400 1452.71600 120.73300
zoomBox 1424.33600 104.88600 1442.50700 113.95900
zoomBox 1426.91700 105.64000 1438.07800 111.21300
zoomBox 1427.48700 105.86400 1436.97400 110.60100
zoomBox 1410.72700 103.40600 1458.92100 127.47000
zoomBox 1238.93500 74.67600 1707.90200 308.83600
zoomBox -324.45500 -265.70000 4238.84900 2012.80500
zoomBox -668.23000 -304.57600 4700.36300 2376.01800
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram 1735.67 611.711 2122.1 962.781
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram 1757.885 611.71 2144.315 962.78
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram 1780.1 611.71 2166.53 962.78
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram 1798.612 615.412 2185.042 966.482
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram 1794.908 608.005 2181.338 959.075
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram 1798.032 1025.186 2184.462 1376.256
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram 1798.03 1028.887 2184.46 1379.957
uiSetTool select
deselectAll
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
uiSetTool move
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 794.072 103.496 1180.502 454.566
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 295.326 103.133 681.756 454.203
deselectAll
uiSetTool move
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 248.119 103.135 634.549 454.205
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 748.752 103.495 1135.182 454.565
zoomBox -176.13700 -32.55900 1541.07100 1504.70900
zoomBox -351.37300 -52.16100 1668.87200 1756.39000
zoomBox -557.53400 -75.22200 1819.22600 2052.48600
zoomBox -800.07600 -102.35200 1996.11300 2400.83400
zoomBox -556.45000 238.40000 1820.31100 2366.10800
zoomBox -391.33700 517.89200 1628.91000 2326.44400
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 162.458 1473.69 757.648 2085.2
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 123.61 754.695 735.12 1349.885
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 139.291 754.695 750.801 1349.885
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 134.063 754.695 745.573 1349.885
deselectAll
uiSetTool move
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 764.8 103.495 1151.23 454.565
deselectAll
uiSetTool move
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 766.615 107.289 1153.045 458.359
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_1__sram 766.615 106.96 1153.045 458.03
zoomBox 1074.61400 407.28000 1356.00000 547.77900
zoomBox 1042.90200 398.71800 1373.94500 564.01100
zoomBox 910.06400 362.85400 1449.11400 632.00700
zoomBox 474.26400 246.32900 1689.15200 852.93500
zoomBox -17.96800 114.71600 1960.27500 1102.47300
zoomBox 323.98800 288.51500 1201.74700 726.78900
zoomBox 507.14900 368.95500 965.34500 597.73700
zoomBox 555.72800 390.96500 886.77500 556.26000
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 250.859 105.418 637.289 456.488
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 250.86 106.79 637.29 457.86
zoomBox 531.79500 370.18200 989.99300 598.96500
zoomBox 478.47000 323.80600 1224.57300 696.34300
zoomBox 378.88900 221.63900 1593.79500 828.25400
zoomBox -6.36600 -130.72800 3214.92200 1477.69400
zoomBox -79.28600 -265.20000 3710.46500 1627.06200
zoomBox 484.98000 94.53800 3223.07700 1461.69800
zoomBox 693.17000 246.64400 3020.55200 1408.73000
zoomBox 908.74800 496.52000 2590.28400 1336.12800
zoomBox 1162.18400 746.36900 2194.85800 1261.99400
zoomBox 1169.87600 787.49800 2047.64900 1225.77900
zoomBox 1176.41400 822.45700 1922.52100 1194.99600
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 371.266 186.032 757.696 537.102
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram
zoomBox 1204.27700 862.05200 1838.46800 1178.71000
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram 1276.09 1035.481 1662.52 1386.551
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram 1279.932 609.332 1666.362 960.402
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram 1275.993 609.768 1662.423 960.838
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram 1788.407 1032.384 2174.837 1383.454
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram 1788.842 1034.572 2175.272 1385.642
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram 1788.35 609.755 2174.78 960.825
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram 1788.84 1035.883 2175.27 1386.953
zoomBox 1123.00300 838.58800 1869.11000 1211.12700
zoomBox 782.55400 740.30100 1997.46600 1346.91900
zoomBox 443.68600 642.47000 2125.22500 1482.08000
zoomBox 299.81600 583.94000 2278.09900 1571.71700
zoomBox -66.99700 434.07100 2671.11200 1801.23700
zoomBox -574.69600 226.63900 3215.07500 2118.91100
zoomBox -897.55800 94.72700 3560.99800 2320.93000
zoomBox -1277.39400 -60.46400 3967.96600 2558.59900
zoomBox -406.04600 -2.10200 1921.35000 1159.99100
zoomBox -77.78300 30.72300 1351.53200 744.39500
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 246.076 106.185 632.506 457.255
zoomBox 27.34500 95.19000 1242.26300 701.81100
zoomBox 196.61200 204.89700 1074.39100 643.18100
zoomBox 318.90600 284.52300 953.10300 601.18400
zoomBox 470.89400 383.82800 801.94900 549.12700
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 246.075 106.87 632.505 457.94
deselectAll
uiSetTool move
zoomBox 718.56900 1190.73800 1614.96400 1993.20300
zoomBox 742.39900 1259.79400 1504.33500 1941.88900
zoomBox 779.87200 1368.38400 1330.37100 1861.19800
zoomBox 749.71000 1318.61700 1397.35600 1898.39800
selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setObjFPlanBox Instance weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 898.616 1474.56 1493.806 2086.07
deselectAll
selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
setObjFPlanBox Instance weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram 1594.428 1475.709 2189.618 2087.219
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 134.065 743.099 745.575 1338.289
deselectAll
selectInst ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram
setObjFPlanBox Instance ofmap_buffer_inst/ram1/genblk1_width_macro_0__sram 242.514 106.87 628.944 457.94
deselectAll
uiSetTool move
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 141.022 750.058 752.532 1345.248
deselectAll
uiSetTool move
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 136.994 750.06 748.504 1345.25
deselectAll
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
flipOrRotateObject -rotate R90
flipOrRotateObject -rotate R180
deselectAll
fit
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
deselectAll
selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
flipOrRotateObject -rotate R270
deselectAll
selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
flipOrRotateObject -rotate R270
deselectAll
selectInst weight_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_1__sram
flipOrRotateObject -rotate R270
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_0__sram
flipOrRotateObject -rotate R270
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_1__sram
flipOrRotateObject -rotate R270
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_2__sram
flipOrRotateObject -rotate R270
deselectAll
selectInst ofmap_buffer_inst/ram0/genblk1_width_macro_3__sram
flipOrRotateObject -rotate R270
deselectAll

selectInst ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram
flipOrRotateObject -rotate R270
uiSetTool move
zoomBox 49.82100 1365.11300 200.42800 1499.93800
zoomBox 38.02800 1350.53500 215.21300 1509.15300
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 161.063 750.06 756.253 1361.57
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 161.982 750.06 757.172 1361.57
setObjFPlanBox Instance ifmap_double_buffer_inst/ram/genblk1_width_macro_0__depth_macro_0__sram 162.21 750.06 757.4 1361.57
deselectAll
