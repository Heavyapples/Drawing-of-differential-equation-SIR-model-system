function main
    tspan = [0 150];
    initial_conditions = [0.01, 1-0.01, 0, 0]; % Si(0), Ii(0), Ri(0), Di(0)

    % 使用ode45求解
    [t, y] = ode45(@ODEs, tspan, initial_conditions);

    % 绘制结果
    plot(t, y);
    xlabel('Time (t)');
    ylabel('Values');
    legend('Si(t)', 'Ii(t)', 'Ri(t)', 'Di(t)');
    title('Results');
    grid on;
end

function dydt = ODEs(~, y)
    b = 0.01;
    p1 = 0.005;
    p3 = 0.0125;
    p4 = 0.25;
    p5 = 0.05;
    p6 = 0.0125;
    Li_p2 = 0.1383;

    Si = y(1);
    Ii = y(2);
    Ri = y(3);
    Di = y(4);

    dSi_dt = b + p1 * Ri - Li_p2 * Ii * Si - p3 * Si;
    dIi_dt = Li_p2 * Ii * Si - p4 * Ii - p5 * Ii;
    dRi_dt = p4 * 3 - p1 * Ri - p6 * Ri;
    dDi_dt = p3 * Si + p5 * Ii + p6 * Ri - b;

    dydt = [dSi_dt; dIi_dt; dRi_dt; dDi_dt];
end
