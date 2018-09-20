%% Project and Code Description
% Make a 3-Prop VSTOL fly.
clear; clc;

%% Initial Values from Previous Team


%% Initial Values of Fall 2018 Team
% Plane Information
weightOfPlane = 1.6; %kg
topCruiseSpeed = 50; %m/s
wingSpan = 1; %m
chord = 0.2; %m
SF = 1.5;

% Motor/Propeller 1 Info MN3110-17 KV700, APC 11x4.7
motor{1}.Info = 'MN3110-17 KV700, APC 11x4.7';
motor{1}.Vol = 14.8; %V
motor{1}.MaxAmp = 18.7; %A
motor{1}.Amp75 = 10.7; %A
motor{1}.LiftMax = 1.540; %kg
motor{1}.Lift50 = 0.590; %kg
motor{1}.Lift65 = 0.800; %kg
motor{1}.Lift75 = 1.080; %kg

% Motor/Propeller 2 Info MN3110-17 KV780, APC 12x3.8
motor{2}.Info = 'MN3110-17 KV780, APC 12x3.8';
motor{2}.Vol = 11.1; %V
motor{2}.MaxAmp = 18.2; %A
motor{2}.Amp75 = 10.6; %A
motor{2}.LiftMax = 1.230; %kg
motor{2}.Lift50 = 0.450; %kg
motor{2}.Lift65 = 0.680; %kg
motor{2}.Lift75 = 0.900; %kg

% Battery 1 Info GensAce 5200mAh 11.1V
bat{1}.Info = 'GensAce 5200mAh 11.1V'; %Ah
bat{1}.Cap = 5.2; %Ah
bat{1}.Dis = 10; %C
bat{1}.Weight = 0.315; %kg 
bat{1}.Vol = 11.1; %V

% Battery 2
bat{2}.Info = 'Zippy Compact 3700mAh 3s 40c Lipo Pack'; %Ah
bat{2}.Cap = 3.7; %Ah
bat{2}.Dis = 40; %C
bat{2}.Weight = 0.317; %kg 
bat{2}.Vol = 11.1; %V

% Battery 3
bat{3}.Info = 'ZIPPY Compact 3700mAh 4s 60c Lipo Pack'; %Ah
bat{3}.Cap = 3.7; %Ah
bat{3}.Dis = 60; %C
bat{3}.Weight = 0.442; %kg 
bat{3}.Vol = 14.8; %V

% Battery 4
bat{3}.Info = 'Multistar High Capacity 16000mAh 4S 12C Multi-Rotor Lipo Pack w/XT90'; %Ah
bat{3}.Cap = 16; %Ah
bat{3}.Dis = 12; %C
bat{3}.Weight = 1.366; %kg
bat{3}.Vol = 14.8; %V

% Battery 5
bat{4}.Info = 'Turnigy 5000mAh 3S 20C Lipo Pack w/XT-60'; %Ah
bat{4}.Cap = 5; %Ah
bat{4}.Dis = 20; %C
bat{4}.Weight = 0.360; %kg
bat{4}.Vol = 11.1; %V

% Distance and Time of Flight Goals for Each Step:
% Assume each step happens instantaneously
% Assume everything is done at full power unless directed not to
s1_climbV = 100;    %Climb to 100 m (VTOL)
s2_loiter = 2;      %Loiter in VTOL mode for 2 minutes
s3_tranistion = 0;  %Transition to forward flight
s4_climbC = 150;    %Climb to 150 m
s5_topCruise = 50;  %Fly in straight line at 50 m/s
s6_loiterC = 5;     %Loiter for 5 minutes
s7_descendC = 100;  %Descend to 100 m
s8_transition = 0;  %Transition to VTOL mode
s9_land = 0;        %Land on takeoff platform

% NACA #### Airfoil 1 Info

%% Universe Contstants
g = 9.81; %m/s^2

%% Calculations
weightOfPlaneSF = weightOfPlane * SF;
minLiftRequired = g * weightOfPlaneSF;
wingArea = wingSpan * chord;

lift = 0;

motorType = 2; %adjust this to switch between motors
batType = 4; %adjust this to switch between batteries

max50LiftV = 3 * motor{motorType}.Lift50;
max65LiftV = 3 * motor{motorType}.Lift65;
max75LiftV = 3 * motor{motorType}.Lift75;
maxTotalLiftV = 3 * motor{motorType}.LiftMax;

batMaxAmp = bat{batType}.Cap * bat{batType}.Dis; %A
totalMotorAmpDraw = 3 * motor{motorType}.MaxAmp;
maxFlightTime100 = (bat{batType}.Cap/totalMotorAmpDraw)*60; 
maxFlightTime75 = (bat{batType}.Cap/(3 * motor{motorType}.Amp75))*60; 

%% Print Statements
fprintf('---\n');
fprintf('Weight of Aircraft: ------------> %2.2f kg\n', weightOfPlane);
fprintf('SF: ----------------------------> %2.1f \n', SF);
fprintf('Weight of Aircraft with SF: ----> %2.2f kg\n', weightOfPlaneSF);
fprintf('Minimum Lift Required: ---------> %2.2f N\n', minLiftRequired);
fprintf('Wing Area: ---------------------> %2.2f m^2\n', wingArea);
fprintf('---\n');
fprintf('Motor/Propeller Info: ----------> %s \n', motor{motorType}.Info);
fprintf('Motor Voltage: -----------------> %2.2f V\n', motor{motorType}.Vol);
fprintf('50 Percent Total Lift (Vert): --> %2.2f kg\n', max50LiftV);
fprintf('65 Percent Total Lift (Vert): --> %2.2f kg\n', max65LiftV);
fprintf('75 Percent Total Lift (Vert): --> %2.2f kg\n', max75LiftV);
fprintf('Max Total Lift (Vert): ---------> %2.2f kg\n', maxTotalLiftV);
fprintf('Total Amp Draw of All Motors: --> %2.2f A\n', totalMotorAmpDraw);
fprintf('---\n');
fprintf('Battery Info: ------------------> %s \n', bat{batType}.Info);
fprintf('Max Battery Current Draw: ------> %2.2f A\n', batMaxAmp);
fprintf('Flight Time Max Thrust: --------> %2.2f Minutes\n', maxFlightTime100);
fprintf('Flight Time 75 Percent Thrust: -> %2.2f Minutes\n', maxFlightTime75);
fprintf('Remaining Weight of Aircraft: --> %2.2f kg\n', (weightOfPlane - bat{batType}.Weight));

%Warnings
%Check compatibilty of motor and battery
if (motor{motorType}.Vol ~= bat{batType}.Vol)
    fprintf('WARNING: Motor and Battery are Incompatible\n');
else
    fprintf('Motor and Battery are Compatible\n');
end