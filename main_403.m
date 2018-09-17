%% Project and Code Description
% Make a 3-Prop VSTOL fly.

%% Initial Values from Previous Team


%% Initial Values of Fall 2018 Team
% Plane Information
weightOfPlane = 1.6; %kg
topCruiseSpeed = 50; %m/s
wingSpan = 1; %m
chord = 0.2; %m
SF = 2.5;
% Plane Power Consumption for 

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
weightOfPlaneSF = weightOfPlane * 2.5;
minLiftRequired = g * weightOfPlaneSF;
wingArea = wingSpan * chord;

lift = 0;

%% Print Statements
fprintf('Weight of Plane: -----------> %2.2f kg\n', weightOfPlane);
fprintf('Weight of Plane with SF: ---> %2.2f kg\n', weightOfPlaneSF);
fprintf('Minimum Lift Required: -----> %2.2f N\n', minLiftRequired);
fprintf('Wing Area: -----------------> %2.2f m^2\n', wingArea);

