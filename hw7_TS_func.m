 % "I discussed this homework problem with Tim Gong. 
% I certify that the assignment I am submitting represents my own work. Tien Li Shen"
% Tien-Li Shen, 03/25/2018, HW5, ID:30930512
 
function [heat_flux, thickness, cost, time, savings_per_day] = hw7_TS_func(Type, T_O, DHL)
%initialize and determine the thermal conductivity
thermalK = 0;
if(Type == 1)
    thermalK = .78;
end
if(Type == 2)
    thermalK = .8;
end
if(Type == 3)
    thermalK = .82;
end
%caclulating thickness of the glass
%q = -k*(?T/?x) && w = q * A <-- given equations
%w = -k*(?T/?x) * A <-- substitute q
%?x = -k*?T*A/w <-- rearrange the equation
thickness = -thermalK * (T_O-25) * .5 * 1000 / DHL;
%calculating heat flux
%q = -k*(?T/?x)
heat_flux = -thermalK * (T_O-25) / thickness;
%calculating cost
if(Type == 1)
    cost = 28.7+12*thickness;
end
if(Type == 2)
    cost = 30+11*thickness;
end
if(Type == 3)
    cost = 30+8*thickness;
end
%caculating Time until Investment is Covered
%total cost = difference watts/1000 / efficiency * hours * cost per kWh
time = (500+cost) / ((500-DHL)/1000/.8*.1*24);
%caclulating Cost Savings per Day
savings_per_day = (500-DHL)/.8/1000*24*.1;