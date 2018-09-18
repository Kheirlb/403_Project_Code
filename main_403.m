%% Project and Code Description
% Make a 3-Prop VSTOL fly.

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
motor{1}.LiftMax = 1.540; %kg
motor{1}.Lift50 = 0.590; %kg

% Motor/Propeller 2 Info MN3110-17 KV780, APC 12x3.8
motor{2}.Info = 'MN3110-17 KV780, APC 12x3.8';
motor{2}.Vol = 11.1; %V
motor{2}.MaxAmp = 18.2; %A
motor{2}.LiftMax = 1.230; %kg
motor{2}.Lift50 = 0.450; %kg
motor{2}.Lift65 = 0.680; %kg
motor{2}.Lift75 = 0.900; %kg

% Battery 1 Info
bat1cap = 5.1; %Ah
bat1dis = 10; %C
bat1Weight = 0; %? 
bat1Voltage = 0; %?

% Distance and Time of Flight Goals for Each Step:
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
maxTotalLiftV = 3 * motor{motorType}.LiftMax;
max50LiftV = 3 * motor{motorType}.Lift50;
max65LiftV = 3 * motor{motorType}.Lift65;
max75LiftV = 3 * motor{motorType}.Lift75;
batMaxAmp = bat1cap * bat1dis; %A
totalMotorAmpDraw = 3 * motor{motorType}.MaxAmp;

%% Print Statements
fprintf('Weight of Plane: ---------------> %2.2f kg\n', weightOfPlane);
fprintf('SF: ----------------------------> %2.1f \n', SF);
fprintf('Weight of Plane with SF: -------> %2.2f kg\n', weightOfPlaneSF);
fprintf('Minimum Lift Required: ---------> %2.2f N\n', minLiftRequired);
fprintf('Wing Area: ---------------------> %2.2f m^2\n', wingArea);
fprintf('---\n');
fprintf('Motor Info: --------------------> %s \n', motor{motorType}.Info);
fprintf('Motor Voltage: -----------------> %2.2f A\n', motor{motorType}.Vol);
fprintf('---\n');
fprintf('Total Amp Draw of All Motors: --> %2.2f A\n', totalMotorAmpDraw);
fprintf('Max Total Lift (Vert): ---------> %2.2f kg\n', maxTotalLiftV);
fprintf('50 Percent Total Lift (Vert): --> %2.2f kg\n', max50LiftV);
fprintf('65 Percent Total Lift (Vert): --> %2.2f kg\n', max65LiftV);
fprintf('75 Percent Total Lift (Vert): --> %2.2f kg\n', max75LiftV);
fprintf('---\n');
fprintf('Max Battery Current Draw: ------> %2.2f A\n', batMaxAmp);
