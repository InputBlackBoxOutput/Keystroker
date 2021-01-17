EESchema Schematic File Version 4
LIBS:board-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Main controller board"
Date "2019-10-20"
Rev ""
Comp ""
Comment1 "Copyright 2019"
Comment2 "Designed by Rutuparn Pawar "
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2700 4775 2700 4675
$Comp
L power:GND #PWR05
U 1 1 5D63BA1D
P 4250 6425
F 0 "#PWR05" H 4250 6175 50  0001 C CNN
F 1 "GND" H 4255 6252 50  0000 C CNN
F 2 "" H 4250 6425 50  0001 C CNN
F 3 "" H 4250 6425 50  0001 C CNN
	1    4250 6425
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 6275 4250 6275
Wire Wire Line
	4250 6425 4250 6275
Connection ~ 4250 6275
Wire Wire Line
	4250 6275 4300 6275
Text GLabel 5900 4475 2    50   Input ~ 0
D-
Text GLabel 5900 4575 2    50   Input ~ 0
D+
$Comp
L Device:CP1 CS1
U 1 1 5D6560AA
P 7975 1950
F 0 "CS1" H 8090 1996 50  0000 L CNN
F 1 "10uF" H 8090 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7975 1950 50  0001 C CNN
F 3 "~" H 7975 1950 50  0001 C CNN
	1    7975 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5D658902
P 7975 2200
F 0 "#PWR011" H 7975 1950 50  0001 C CNN
F 1 "GND" H 7980 2027 50  0000 C CNN
F 2 "" H 7975 2200 50  0001 C CNN
F 3 "" H 7975 2200 50  0001 C CNN
	1    7975 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7975 1800 7975 1700
Connection ~ 7975 1700
Wire Wire Line
	7975 1700 8275 1700
Wire Wire Line
	2700 4675 2300 4675
$Comp
L power:GND #PWR04
U 1 1 5D67BC38
P 3725 2675
F 0 "#PWR04" H 3725 2425 50  0001 C CNN
F 1 "GND" H 3730 2502 50  0000 C CNN
F 2 "" H 3725 2675 50  0001 C CNN
F 3 "" H 3725 2675 50  0001 C CNN
	1    3725 2675
	1    0    0    -1  
$EndComp
Wire Wire Line
	5775 2325 5675 2325
Wire Wire Line
	5775 1625 5775 1425
Wire Wire Line
	5775 1925 5775 2325
$Comp
L Device:R_US R3
U 1 1 5D688B6F
P 5775 1775
F 0 "R3" V 5980 1775 50  0000 C CNN
F 1 "1k" V 5889 1775 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5815 1765 50  0001 C CNN
F 3 "~" H 5775 1775 50  0001 C CNN
	1    5775 1775
	1    0    0    -1  
$EndComp
Wire Wire Line
	5025 1625 5025 1425
Wire Wire Line
	4275 1625 4275 1425
Text GLabel 5025 1425 1    50   Input ~ 0
LED_Y
$Comp
L Device:R_US R1
U 1 1 5D671243
P 4275 1775
F 0 "R1" V 4480 1775 50  0000 C CNN
F 1 "1k" V 4389 1775 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4315 1765 50  0001 C CNN
F 3 "~" H 4275 1775 50  0001 C CNN
	1    4275 1775
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R2
U 1 1 5D670261
P 5025 1775
F 0 "R2" V 5230 1775 50  0000 C CNN
F 1 "1k" V 5139 1775 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5065 1765 50  0001 C CNN
F 3 "~" H 5025 1775 50  0001 C CNN
	1    5025 1775
	1    0    0    -1  
$EndComp
Wire Wire Line
	5225 2325 5375 2325
$Comp
L power:GND #PWR08
U 1 1 5D688B7B
P 5225 2675
F 0 "#PWR08" H 5225 2425 50  0001 C CNN
F 1 "GND" H 5230 2502 50  0000 C CNN
F 2 "" H 5225 2675 50  0001 C CNN
F 3 "" H 5225 2675 50  0001 C CNN
	1    5225 2675
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5D688B65
P 5525 2325
F 0 "D3" H 5518 2541 50  0000 C CNN
F 1 "GREEN LED" H 5518 2450 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5525 2325 50  0001 C CNN
F 3 "~" H 5525 2325 50  0001 C CNN
	1    5525 2325
	1    0    0    -1  
$EndComp
Wire Wire Line
	3725 2325 3875 2325
Wire Wire Line
	4475 2325 4625 2325
$Comp
L power:GND #PWR07
U 1 1 5D67C259
P 4475 2675
F 0 "#PWR07" H 4475 2425 50  0001 C CNN
F 1 "GND" H 4480 2502 50  0000 C CNN
F 2 "" H 4475 2675 50  0001 C CNN
F 3 "" H 4475 2675 50  0001 C CNN
	1    4475 2675
	1    0    0    -1  
$EndComp
Wire Wire Line
	5025 2325 4925 2325
Wire Wire Line
	5025 1925 5025 2325
Wire Wire Line
	4275 2325 4175 2325
Wire Wire Line
	4275 1925 4275 2325
$Comp
L Device:LED D2
U 1 1 5D6147A3
P 4775 2325
F 0 "D2" H 4768 2541 50  0000 C CNN
F 1 "YELLOW LED" H 4768 2450 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4775 2325 50  0001 C CNN
F 3 "~" H 4775 2325 50  0001 C CNN
	1    4775 2325
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 5D61382E
P 4025 2325
F 0 "D1" H 4018 2541 50  0000 C CNN
F 1 "RED LED" H 4018 2450 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4025 2325 50  0001 C CNN
F 3 "~" H 4025 2325 50  0001 C CNN
	1    4025 2325
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5D6AACF7
P 1550 4825
F 0 "#PWR03" H 1550 4575 50  0001 C CNN
F 1 "GND" H 1555 4652 50  0000 C CNN
F 2 "" H 1550 4825 50  0001 C CNN
F 3 "" H 1550 4825 50  0001 C CNN
	1    1550 4825
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5D6A8A98
P 1850 5075
F 0 "C2" V 1598 5075 50  0000 C CNN
F 1 "22pF" V 1689 5075 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1888 4925 50  0001 C CNN
F 3 "~" H 1850 5075 50  0001 C CNN
	1    1850 5075
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 5D6A75B0
P 1850 4575
F 0 "C1" V 1598 4575 50  0000 C CNN
F 1 "22pF" V 1689 4575 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1888 4425 50  0001 C CNN
F 3 "~" H 1850 4575 50  0001 C CNN
	1    1850 4575
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 4575 2300 4575
Wire Wire Line
	2300 4575 2300 4675
Connection ~ 2300 4675
Wire Wire Line
	2000 5075 2300 5075
Wire Wire Line
	2300 5075 2300 4975
Wire Wire Line
	1700 5075 1700 4825
Wire Wire Line
	1700 4825 1550 4825
Wire Wire Line
	1700 4575 1700 4825
Connection ~ 1700 4825
Text GLabel 2800 5775 0    50   Input ~ 0
PGC
Text GLabel 2800 5875 0    50   Input ~ 0
PGD
Text GLabel 2700 4275 0    50   Input ~ 0
LED_Y
Wire Wire Line
	2800 4675 2800 4575
Text GLabel 2700 4575 0    50   Input ~ 0
GPIO
Wire Wire Line
	2700 4775 3100 4775
Wire Wire Line
	2800 4675 3100 4675
Wire Wire Line
	3100 4975 2300 4975
Connection ~ 2300 4975
$Comp
L Device:C_Small C3
U 1 1 5D7B937A
P 6050 5075
F 0 "C3" H 6142 5121 50  0000 L CNN
F 1 "220nF" H 6142 5030 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6050 5075 50  0001 C CNN
F 3 "~" H 6050 5075 50  0001 C CNN
	1    6050 5075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5D7C1C0F
P 6050 5325
F 0 "#PWR09" H 6050 5075 50  0001 C CNN
F 1 "GND" H 6055 5152 50  0000 C CNN
F 2 "" H 6050 5325 50  0001 C CNN
F 3 "" H 6050 5325 50  0001 C CNN
	1    6050 5325
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4975 6050 4975
Wire Wire Line
	5500 4575 5900 4575
Wire Wire Line
	5500 4475 5900 4475
Wire Wire Line
	3100 4275 2700 4275
Text GLabel 5600 5175 2    50   Input ~ 0
RESET
$Comp
L MCU_Microchip_PIC18:PIC18F2550-ISP U1
U 1 1 5D76E169
P 4300 5075
F 0 "U1" H 4300 6456 50  0000 C CNN
F 1 "PIC18F2550-ISP" H 4300 6365 50  0000 C CNN
F 2 "Package_SO:SOIC-28W_7.5x17.9mm_P1.27mm" H 4300 5075 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/39632c.pdf" H 4300 4625 50  0001 C CNN
	1    4300 5075
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5175 5600 5175
Wire Wire Line
	2800 5775 3100 5775
Wire Wire Line
	2800 5875 3100 5875
Text GLabel 2800 5575 0    50   Input ~ 0
ACTIVATE
Wire Wire Line
	2800 5575 3100 5575
$Comp
L Device:R_US R4
U 1 1 5D885765
P 8750 3350
F 0 "R4" V 8955 3350 50  0000 C CNN
F 1 "10k" V 8864 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8790 3340 50  0001 C CNN
F 3 "~" H 8750 3350 50  0001 C CNN
	1    8750 3350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5D88576B
P 8250 4100
F 0 "#PWR012" H 8250 3850 50  0001 C CNN
F 1 "GND" H 8255 3927 50  0000 C CNN
F 2 "" H 8250 4100 50  0001 C CNN
F 3 "" H 8250 4100 50  0001 C CNN
	1    8250 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3350 8250 3350
Wire Wire Line
	8250 3500 8250 3350
Connection ~ 8250 3350
Wire Wire Line
	8250 3350 8600 3350
Wire Wire Line
	8250 4100 8250 3900
Wire Wire Line
	8900 3350 9150 3350
Text GLabel 8000 3350 0    50   Input ~ 0
RESET
$Comp
L Device:R_US R5
U 1 1 5D888547
P 8750 4750
F 0 "R5" V 8955 4750 50  0000 C CNN
F 1 "10k" V 8864 4750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8790 4740 50  0001 C CNN
F 3 "~" H 8750 4750 50  0001 C CNN
	1    8750 4750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5D88854D
P 8250 5500
F 0 "#PWR013" H 8250 5250 50  0001 C CNN
F 1 "GND" H 8255 5327 50  0000 C CNN
F 2 "" H 8250 5500 50  0001 C CNN
F 3 "" H 8250 5500 50  0001 C CNN
	1    8250 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4750 8250 4750
Wire Wire Line
	8250 4900 8250 4750
Connection ~ 8250 4750
Wire Wire Line
	8250 4750 8600 4750
Wire Wire Line
	8250 5500 8250 5300
Wire Wire Line
	8900 4750 9150 4750
$Comp
L Switch:SW_Push SW2
U 1 1 5D88855A
P 8250 5100
F 0 "SW2" H 8250 5385 50  0000 C CNN
F 1 "SW_Push" H 8250 5294 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_B3U-1000P" H 8250 5300 50  0001 C CNN
F 3 "~" H 8250 5300 50  0001 C CNN
	1    8250 5100
	0    1    1    0   
$EndComp
Text GLabel 8000 4750 0    50   Input ~ 0
ACTIVATE
Wire Wire Line
	2700 4175 3100 4175
Text GLabel 2700 4175 0    50   Input ~ 0
LED_R
Text GLabel 4275 1425 1    50   Input ~ 0
LED_R
Wire Wire Line
	2700 4375 3100 4375
Text GLabel 2700 4375 0    50   Input ~ 0
LED_G
Text GLabel 5775 1425 1    50   Input ~ 0
LED_G
Text GLabel 1900 1525 0    50   Input ~ 0
MCLR!
Wire Wire Line
	1900 1525 2050 1525
NoConn ~ 3100 4475
NoConn ~ 3100 4575
NoConn ~ 5500 4175
NoConn ~ 5500 4275
NoConn ~ 5500 4375
NoConn ~ 3100 5375
NoConn ~ 3100 5475
NoConn ~ 3100 5675
$Comp
L power:+5V #PWR010
U 1 1 5D93048F
P 7675 1700
F 0 "#PWR010" H 7675 1550 50  0001 C CNN
F 1 "+5V" H 7690 1873 50  0000 C CNN
F 2 "" H 7675 1700 50  0001 C CNN
F 3 "" H 7675 1700 50  0001 C CNN
	1    7675 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7675 1700 7975 1700
Text GLabel 8875 1400 0    50   Input ~ 0
D-
$Comp
L power:+5V #PWR06
U 1 1 5D9500C0
P 4300 3575
F 0 "#PWR06" H 4300 3425 50  0001 C CNN
F 1 "+5V" H 4315 3748 50  0000 C CNN
F 2 "" H 4300 3575 50  0001 C CNN
F 3 "" H 4300 3575 50  0001 C CNN
	1    4300 3575
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR015
U 1 1 5D96019A
P 9150 3350
F 0 "#PWR015" H 9150 3200 50  0001 C CNN
F 1 "+5V" H 9165 3523 50  0000 C CNN
F 2 "" H 9150 3350 50  0001 C CNN
F 3 "" H 9150 3350 50  0001 C CNN
	1    9150 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 5D962ADE
P 9150 4750
F 0 "#PWR016" H 9150 4600 50  0001 C CNN
F 1 "+5V" H 9165 4923 50  0000 C CNN
F 2 "" H 9150 4750 50  0001 C CNN
F 3 "" H 9150 4750 50  0001 C CNN
	1    9150 4750
	1    0    0    -1  
$EndComp
Text GLabel 8250 3200 1    50   Input ~ 0
MCLR!
Wire Wire Line
	8250 3200 8250 3350
Wire Wire Line
	5225 2675 5225 2325
$Comp
L power:GND #PWR014
U 1 1 5D93F051
P 9050 1050
F 0 "#PWR014" H 9050 800 50  0001 C CNN
F 1 "GND" H 9055 877 50  0000 C CNN
F 2 "" H 9050 1050 50  0001 C CNN
F 3 "" H 9050 1050 50  0001 C CNN
	1    9050 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1050 9350 1050
Wire Wire Line
	9350 1100 9350 1050
Connection ~ 9350 1050
Wire Wire Line
	9350 1050 9450 1050
Wire Wire Line
	9450 1100 9450 1050
Wire Wire Line
	3725 2325 3725 2675
Wire Wire Line
	4475 2325 4475 2675
Wire Wire Line
	7975 2200 7975 2100
Wire Wire Line
	6050 5175 6050 5325
Wire Wire Line
	4300 3575 4300 3875
Wire Wire Line
	2700 4575 2800 4575
Text GLabel 8875 1500 0    50   Input ~ 0
D+
$Comp
L Switch:SW_SPST SW3
U 1 1 5FF4F41F
P 8475 1700
F 0 "SW3" H 8475 1935 50  0000 C CNN
F 1 "SW_SPST" H 8475 1844 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_EVQPE1" H 8475 1700 50  0001 C CNN
F 3 "~" H 8475 1700 50  0001 C CNN
	1    8475 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8675 1700 9050 1700
Wire Wire Line
	8875 1400 9050 1400
Wire Wire Line
	8875 1500 9050 1500
Wire Wire Line
	1900 1625 2050 1625
Wire Wire Line
	1900 1725 2050 1725
Text GLabel 1900 1625 0    50   Input ~ 0
PGD
Text GLabel 1900 1725 0    50   Input ~ 0
PGC
$Comp
L power:+5V #PWR01
U 1 1 5D9913FE
P 1775 2250
F 0 "#PWR01" H 1775 2100 50  0001 C CNN
F 1 "+5V" H 1790 2423 50  0000 C CNN
F 2 "" H 1775 2250 50  0001 C CNN
F 3 "" H 1775 2250 50  0001 C CNN
	1    1775 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1775 2575 1775 2625
$Comp
L power:GND #PWR02
U 1 1 5D9A496F
P 1775 2625
F 0 "#PWR02" H 1775 2375 50  0001 C CNN
F 1 "GND" H 1780 2452 50  0000 C CNN
F 2 "" H 1775 2625 50  0001 C CNN
F 3 "" H 1775 2625 50  0001 C CNN
	1    1775 2625
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 6001C2FC
P 2250 1625
F 0 "J1" H 2222 1557 50  0000 R CNN
F 1 "Conn_01x03_Male" H 2222 1648 50  0000 R CNN
F 2 "Board:3_pads" H 2250 1625 50  0001 C CNN
F 3 "~" H 2250 1625 50  0001 C CNN
	1    2250 1625
	-1   0    0    1   
$EndComp
Text GLabel 1950 2475 0    50   Input ~ 0
GPIO
Text Notes 1700 3000 0    50   ~ 0
GPIO: Just incase I need one
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 600072CA
P 2200 2475
F 0 "J2" H 2172 2407 50  0000 R CNN
F 1 "Conn_01x03_Male" H 2172 2498 50  0000 R CNN
F 2 "Board:3_pads" H 2200 2475 50  0001 C CNN
F 3 "~" H 2200 2475 50  0001 C CNN
	1    2200 2475
	-1   0    0    1   
$EndComp
Wire Wire Line
	1775 2250 1775 2375
Wire Wire Line
	1775 2375 2000 2375
Wire Wire Line
	1950 2475 2000 2475
Wire Wire Line
	1775 2575 2000 2575
$Comp
L Switch:SW_Push SW1
U 1 1 5D885778
P 8250 3700
F 0 "SW1" H 8250 3985 50  0000 C CNN
F 1 "SW_Push" H 8250 3894 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPST_B3U-1000P" H 8250 3900 50  0001 C CNN
F 3 "~" H 8250 3900 50  0001 C CNN
	1    8250 3700
	0    1    1    0   
$EndComp
NoConn ~ 5500 4675
NoConn ~ 5500 4775
NoConn ~ 3100 5175
NoConn ~ 3100 5275
$Comp
L Connector:USB_A J3
U 1 1 5FFE68E3
P 9350 1500
F 0 "J3" H 9120 1397 50  0000 R CNN
F 1 "USB_A" H 9120 1488 50  0000 R CNN
F 2 "Board:usb_pcb" H 9500 1450 50  0001 C CNN
F 3 " ~" H 9500 1450 50  0001 C CNN
	1    9350 1500
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 60059DC6
P 6150 7375
F 0 "H1" H 6250 7421 50  0000 L CNN
F 1 "MountingHole" H 6250 7330 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.1mm" H 6150 7375 50  0001 C CNN
F 3 "~" H 6150 7375 50  0001 C CNN
	1    6150 7375
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5D611CBC
P 2300 4825
F 0 "Y1" H 2300 5093 50  0000 C CNN
F 1 "8Mhz" H 2300 5002 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 2300 4825 50  0001 C CNN
F 3 "~" H 2300 4825 50  0001 C CNN
	1    2300 4825
	0    -1   -1   0   
$EndComp
$EndSCHEMATC