%% Tema 1
clc;
close all;
clear all;

% Subpunctul A
[phi1, rho] = PS_Lab_3_Tema_1a(3, 7);
z = tf('z');

legend_entries_A = cell(length(rho), 1);

for i = 1:length(rho)
    c = rho(i) * exp(1i * phi1);
    H = 1 - c * z^(-1);
    b = [1, -c];
    a = 1;
    
    w = -pi:pi/1000:pi;
    [h, ~] = freqz(b, a, w);

    % Plot PZ
    figure(1); hold on; title('PZ(A)');
    pzmap(H); hold off;

    % Plot Amplitudine
    figure(2); hold on; title("Amplitudine(A)");
    plot(w, 20 * log10(abs(h))); hold off;

    % Plot Faza
    figure(3); hold on; title("Faza(A)");
    plot(w, angle(h) * (180/pi)); hold off;

    legend_entries_A{i} = ['rho = ', num2str(rho(i))];
end

% Formatare legenda si axe pentru Amplitudine
figure(2); hold on; grid on; xlabel('Pulsatie'); ylabel('Amplitudine (dB)');
legend('Location', 'southwest');
legend(legend_entries_A{:});
hold off;

% Formatare legenda si axe pentru Faza
figure(3); hold on; grid on; xlabel('Pulsatie'); ylabel('Faza (grade)');
legend('Location', 'southwest');
legend(legend_entries_A{:});
hold off;

% Subpunctul B
phi2 = PS_Lab_3_Tema_1b(3, 4);

legend_entries_B = cell(length(rho), 1);

for i = 1:length(rho)
    c = rho(i) * exp(1i * phi2);
    H = 1 - c * z^(-1);
    b = [1, -c];
    a = 1;

    w = -pi:pi/1000:pi;
    [h, ~] = freqz(b, a, w);

    % Plot PZ
    figure(4); hold on; title('PZ(B)');
    pzmap(H); hold off;

    % Plot Amplitudine
    figure(5); hold on; title("Amplitudine(B)");
    plot(w, 20 * log10(abs(h))); hold off;

    % Plot Faza
    figure(6); hold on; title("Faza(B)");
    plot(w, angle(h) * (180/pi)); hold off;

    legend_entries_B{i} = ['rho = ', num2str(rho(i))];
end

% Formatare legenda si axe pentru Amplitudine
figure(5); hold on; grid on; xlabel('Pulsatie'); ylabel('Amplitudine (dB)');
legend('Location', 'southwest');
legend(legend_entries_B{:});
hold off;

% Formatare legenda si axe pentru Faza
figure(6); hold on; grid on; xlabel('Pulsatie'); ylabel('Faza (grade)');
legend('Location', 'southwest');
legend(legend_entries_B{:});
hold off;