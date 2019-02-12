% "I discussed this homework problem with Tim Gong. 
% I certify that the assignment I am submitting represents my own work. Tien Li Shen"
% Tien-Li Shen, 03/25/2018, HW5, ID:30930512

% this script runs 2 (nested) for loops and analyzes the data created
% initialize inputs
T_O = (-15:0.5:15); %size is b
b = length(T_O);
DHL = 250;
% initialize outputs
H_flux = zeros(b,3);
thickness = zeros(b,3);
cost = zeros(b,3);
%this nested for loop runs so that all temperature and types of glasses are
%simulated and stored in initialized matrices
for i=1:b
    for n=1:3
        [H_flux(i,n), thickness(i,n), cost(i,n), ~, ~] = hw7_TS_func(n, T_O(i), DHL);
    end
end
%graph of Thicknesses of each glass type versus the Outdoor temperature vector
figure(1)
plot(T_O, thickness(:,1), 'b-');
hold on
plot(T_O, thickness(:,2), 'r-');
hold on
plot(T_O, thickness(:,3), 'g-');
title('Thicknesses versus Outdoor Temperature');
xlabel('Outdoor Temperature');
ylabel('Thickness');
%graph of Costs of each glass type versus the outside temperatures
figure(2)
plot(T_O, cost(:,1), 'b-');
hold on
plot(T_O, cost(:,2), 'r-');
hold on
plot(T_O, cost(:,3), 'g-');
title('Costs versus the Outdoor Temperatures');
xlabel('Outdoor Temperature');
ylabel('Cost');
%question answer
%Outdoor temperature does have an effect on which glass type is the most
%cost efficient. Glass type 3 is the omst cost efficient. At tempertuare of
%25, the most efficient glass type change. I know this because I expanded
%range of temperature and found out where the lines cross. Glass type 3 is
%the most efficient in Flavortown in the winter. 

%initialize new inputs
DHL = (100:5:300); %size is 41
T_O = 0;
%initialize outputs
Investment_Time = zeros(41,1);
Daily_Savings = zeros(41,1);
%this nested for loop runs so that all temperature and types of glasses are
%simulated and stored in initialized matrices
for i=1:41
        [~, ~, ~, Investment_Time(i), Daily_Savings(i,1)] = hw7_TS_func(3, T_O, DHL(i));
end
%graph of Desired heat loss versus investment time
figure(3)
plot(DHL, Investment_Time,'b-');
title('Heat loss versus investment time');
xlabel('Heat');
ylabel('Time');
%graph of Desired heat loss versus Daily Savings
figure(4)
plot(DHL, Daily_Savings, 'r-');
title('Heat loss versus Daily Savings');
xlabel('Heat');
ylabel('Savings');
%At desired heat loss of aproximately 165W, Mr.Ramsay's investment recurperation time is
%minimized. At this DHL, Mr.Ramsay saves approximately $[1.0050] per day