% Define problem parameters
initial_mass = 500; % kg
payload_mass = 50; % kg
max_thrust1 = 10000; % N
burn_time1 = 10; % s
max_thrust2 = 5000; % N
burn_time2 = 20; % s
delta_t = 0.1; % s
g = 9.81; % m/s^2
rho0 = 1.225; % kg/m^3
h0 = 0; % m

% Define optimization problem
fun = @(x) -rocket_altitude(x(1), x(2), initial_mass, payload_mass, max_thrust1, burn_time1, max_thrust2, burn_time2, delta_t, g, rho0, h0);
x0 = [100, 10]; % initial guess
lb = [0, 0]; % lower bounds
ub = [1000, 100]; % upper bounds
options = optimset('Display', 'iter', 'MaxIter', 100);
[x, fval] = fmincon(fun, x0, [], [], [], [], lb, ub, [], options);

% Define rocket altitude function
function altitude = rocket_altitude(stage1_mass, stage2_mass, initial_mass, payload_mass, max_thrust1, burn_time1, max_thrust2, burn_time2, delta_t, g, rho0, h0)
    % Calculate rocket parameters
    mass1 = initial_mass - stage1_mass;
    mass2 = stage1_mass - stage2_mass;
    mass3 = stage2_mass - payload_mass;
    thrust1 = min(max_thrust1, mass1 * g);
    thrust2 = min(max_thrust2, mass2 * g);
    thrust3 = -payload_mass * g;
    time1 = 0:delta_t:burn_time1;
    time2 = burn_time1+delta_t:delta_t:burn_time1+burn_time2;
    time3 = burn_time1+burn_time2+delta_t:delta_t:100;
    h1 = h0 + cumtrapz(time1, 0.5*rho0*(thrust1-mass1*g)./mass1) + 0.5*rho0*(thrust1-mass1*g)./mass1.*time1.^2;
    h2 = h1(end) + cumtrapz(time2, 0.5*rho0*(thrust2-mass2*g)./mass2) + 0.5*rho0*(thrust2-mass2*g)./mass2.*(time2-burn_time1).^2;
    h3 = h2(end) + cumtrapz(time3, 0.5*rho0*(thrust3-mass3*g)./payload_mass) + 0.5*rho0*(thrust3-mass3*g)./payload_mass.*(time3-burn_time1-burn_time2).^2;
    altitude = h3(end);
end
