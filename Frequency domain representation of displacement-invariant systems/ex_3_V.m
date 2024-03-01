%% Tema 3
clc;
close all;

% Subpunctul A
[phi_a, rho_a] = PS_Lab_3_Tema_1a(3, 7);
j = sqrt(-1);
z = tf('z');
legend_entries_a = cell(length(rho_a), 1);

for i = 1:length(rho_a)
    a = [1, -2 * rho_a(i) * cos(phi_a), rho_a(i)^2];
    w1 = -pi:pi/1000:pi;
    G = 1 / (1 - 2 * rho_a(i) * cos(phi_a) * z^(-1) + (rho_a(i)^2) * (z^(-2)));
    [h, w] = freqz(1, a, w1);

    figure(1); hold on; title("Amplitudine");
    plot(w, 20 * log10(abs(h))); hold off;

    figure(2); hold on; title("Faza");
    plot(w, 360 / (2 * pi) * angle(h)); hold off;

    figure(3); hold on; title('Poli-Zerouri');
    pzmap(G); hold off;

    legend_entries_a{i} = ['rho = ', num2str(rho_a(i))];
end

figure(1); hold on; grid on; xlabel('Pulsatie'); ylabel('Amplitudine (dB)');
legend('Location', 'northwest');
legend(legend_entries_a{:});
hold off;

figure(2); hold on; grid on; xlabel('Pulsatie'); ylabel('Faza (grade)');
legend('Location', 'southwest');
legend(legend_entries_a{:});
hold off;

phi_b = PS_Lab_3_Tema_1b(3, 4);
legend_entries_b = cell(length(rho_a), 1);

for i = 1:length(rho_a)
    a = [1, -2 * rho_a(i) * cos(phi_b), rho_a(i)^2];
    w1 = -pi:pi/1000:pi;
    G = 1 / (1 - 2 * rho_a(i) * cos(phi_b) * z^(-1) + (rho_a(i)^2) * (z^(-2)));
    [h, w] = freqz(1, a, w1);

    figure(4); hold on; title("Amplitudine(phi_b)");
    plot(w, 20 * log10(abs(h))); hold off;

    figure(5); hold on; title("Faza(phi_b)");
    plot(w, 360 / (2 * pi) * angle(h)); hold off;

    figure(6); hold on; title('Poli-Zerouri(phi_b)');
    pzmap(G); hold off;

    legend_entries_b{i} = ['rho = ', num2str(rho_a(i))];
end

figure(4); hold on; grid on; xlabel('Pulsatie'); ylabel('Amplitudine (dB)');
legend('Location', 'northwest');
legend(legend_entries_b{:});
hold off;

figure(5); hold on; grid on; xlabel('Pulsatie'); ylabel('Faza (grade)');
legend('Location', 'southwest');
legend(legend_entries_b{:});
hold off;

% Subpunctul B
w1 = -pi:pi/1000:pi;
figure(7);

legend_entries_c = cell(length(rho_a), 1);

for i = 1:length(rho_a)
    b = poly(rho_a(i) * [exp(j * phi_b), exp(-j * phi_b)]);

    [G, w] = freqz(1, b, w1);
    %normarea g(1000) aprox 0
    G = G / G(1000); 
    % w = 0
    plot(w, 20 * log10(abs(G)));
    hold on;

    legend_entries_c{i} = ['rho = ', num2str(rho_a(i))];
end

hold off;
xlabel('Pulsatie'); ylabel('Amplitudine (dB)');
legend('Location', 'southeast');
legend(legend_entries_c{:});
title('Graficele normate');
grid on;

