LEVEL   = 1;
VTOn    = 0.7;           %(V)        -> Tensión umbral
VTOp    = 0.8;           %(V)        -> Tensión umbral
GAMMA   = 0.45;          %(V^1/2)    -> Coeficiente de cuerpo
PHI     = 0.9;           %(V)        -> Potencial ? (? 2F)
NSUB    = 9e14;          %(cm^-3)    -> Dopaje del sustrato
LD      = 0.08;          %(um)        -> Longitud de difusión (fuente/drenaje)
UON     = 0.0350;        %(m^2/V·s) -> Movilidad de portadores
UOP     = 0.0100;        %(m^2/V·s) -> Movilidad de portadores
LAMBDAn  = 0.1;          %(V^-1)     -> Modulación de longitud de canal
LAMBDAp  = 0.2;          %(V^-1)     -> Modulación de longitud de canal
TOX     = 9e-9;          %(m)        -> Espesor del óxido
PB      = 0.9;           %(V)        -> Potencial de unión
CJ      = 0.56e-3;       %(F/m^2)    -> Capacitancia de unión por área
CJSW    = 0.35e-11;      %(F/m)      -> Capacitancia de unión lateral
MJ      = 0.45;          %(unitless) -> Exponente de CJ
MJSW    = 0.2;           %(unitless) -> Exponente de CJSW
CGDO    = 0.4e-9;        %(F/m)      -> Capacitancia solapamiento puerta-drenaje 
JS      = 1.0e-8;        %(A/m^2)    -> Corriente de fuga por unidad de área
Vdd     = 3;             %V
W       = 50;            %(um)
L       = 0.5;           %(um)
E = 1e-6       ;          %m 
Cox     = 3836e-6;       %F/m^2
Id      = 0.25e-3;             %A
R       = 2000;            %ohm
% Question 1
% Problem 8.12: Enter the calculated value for 1/2*up*Cox*(W/L)2 (mA/V^2)
a =0.5*UOP*1000*Cox*(W/L);
% Question 2
% Problem 8.12: Enter the calculated value for |Vgs2-Vth2|
Vgsp=-( sqrt(2*Id/(UOP*Cox*(W/L)))+VTOp);
Q2 = Vgsp - (-VTOp);
% Question 3
% Problem 8.12: Enter the calculated value for Vgs2 (V)  notice that Vgs2 is a negative quantity, so enter it as a negative number
Vgsp;
% Question 4
% Problem 8.12: Enter the calculated value for Vx (X node in Figure 8.54(a), in units (V)
% Vx = VG2 
% VGS2 = VG2 - VS2  y VS2 = VDD
Vg2 = Vgsp + 3;
% Question 5
% Problem 8.12: Enter the calculated value for Id1  (mA)
% ID1 = (VDD - Vx) / Rd1 
Id1 = (3 - Vg2)/2000;
% Question 6
% Problem 8.12: Enter the calculated value for 1/2*un*Cox*(W/L)1 (mA/V^2)
b =0.5*UON*1000*Cox*(W/L);
% Question 7
% Problem 8.12: Enter the calculated value for (Vgs1-Vth1)  in units (V)
Vgs1= sqrt(2*Id1/(UON*Cox*(W/L)))+VTOn;
Vov1 = Vgs1 - VTOn;
% Question 8
% Problem 8.12: Enter the calculated value for Vgs1 (V)
Vgs1;
% Question 9
% Problem 8.12: Enter the calculated value for Vout (V)
Vout = (Id1+ Id*2)*R/3;
% Question 10
% Problem 8.12: Enter the calculated value for Vy (Y in this question is the circuit node connected to the source of M1, not the node marked as "Y" in the figure.  The node marked as "y" in the figure is "Vout"); units (V)
Vy = 2*Vout - Id*R;
%Question 11
%Calcular Vin
Vin = Vgs1 + Vy;
%Question 12
gm1 = (2*Id1*1e3)/ Vov1;
%Question 13
Vov2 = -Q2;
gm2 = (2*Id*1e3)/Vov2;
% Question 14
Gm1= gm1*1e-3;
Gm2=gm2*1e-3;
% Problem 8.12: Enter the calculated value for Av_open_loop
Av_OP= ((-R)/((R*R)/(R+R)+(1/Gm1)))*(-Gm2*((R*(R+R))/(R+(R+R))));
% Question 15
% Problem 8.12: Enter the calculated value for Av_closed_loop
g21= R/(R+R);
AV_CO=Av_OP/(1+Av_OP*g21)
