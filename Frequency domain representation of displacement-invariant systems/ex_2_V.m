%% Tema 2
clc;
close all;

% Subpunctul A
[phi, rho] = PS_Lab_3_Tema_1a(3, 7);
j = sqrt(-1);
z = tf('z');
legend_entries_A = cell(length(rho), 1);

for i = 1:length(rho)
    % Calculul transfer function H și coeficienților b și a
    H = 1 - 2 * rho(i) * cos(phi) * z^(-1) + (rho(i)^2) * (z^(-2)); %relatia 3.11
    b = [1, -2 * rho(i) * cos(phi), rho(i)^2];
    a = 1;

    % Calculul răspunsului în frecvență
    w1 = -pi : pi/1000 : pi;
    [h, w] = freqz(b, a, w1);

    % Plot Amplitudine
    figure(1); hold on; title("Amplitudine(A)");
    plot(w, 20 * log10(abs(h))); hold off;

    % Plot Faza
    figure(2); hold on; title("Faza(A)");
    plot(w, 360 / (2 * pi) * angle(h)); hold off;

    % Plot Poli-Zerouri
    figure(3); hold on; title('Poli-Zerouri(A)');
    pzmap(H);
    
    legend_entries_A{i} = ['rho = ', num2str(rho(i))];
end

% Formatare legenda și axe pentru Amplitudine
figure(1); hold on; grid on; xlabel('Pulsatie'); ylabel('Amplitudine (dB)');
legend('Location', 'southwest');
legend(legend_entries_A{:});
hold off;

% Formatare legenda și axe pentru Faza
figure(2); hold on; grid on; xlabel('Pulsatie'); ylabel('Faza (grade)');
legend('Location', 'southeast');
legend(legend_entries_A{:});
hold off;

% Subpunctul B
phi2 = PS_Lab_3_Tema_1b(3, 4);
legend_entries_B = cell(length(rho), 1);

for i = 1:length(rho)
    % Calculul transfer function H și coeficienților b și a
    H = 1 - 2 * rho(i) * cos(phi2) * z^(-1) + (rho(i)^2) * (z^(-2)); %relatia 3.11
    b = [1, -2 * rho(i) * cos(phi2), rho(i)^2];
    a = 1;

    % Calculul răspunsului în frecvență
    w1 = -pi : pi/1000 : pi;
    [h, w] = freqz(b, a, w1);

    % Plot Amplitudine
    figure(4); hold on; title("Amplitudine(phi2)");
    plot(w, 20 * log10(abs(h))); hold off;

    % Plot Faza
    figure(5); hold on; title("Faza(phi2)");
    plot(w, 360 / (2 * pi) * angle(h)); hold off;

    % Plot Poli-Zerouri
    figure(6); hold on; title('Poli-Zerouri(phi2)');
    pzmap(H);

    legend_entries_B{i} = ['rho = ', num2str(rho(i))];
end

% Formatare legenda și axe pentru Amplitudine
figure(4); hold on; grid on; xlabel('Pulsatie'); ylabel('Amplitudine (dB)');
legend('Location', 'southwest');
legend(legend_entries_B{:});
hold off;

% Formatare legenda și axe pentru Faza
figure(5); hold on; grid on; xlabel('Pulsatie'); ylabel('Faza (grade)');
legend('Location', 'southeast');
legend(legend_entries_B{:});
hold off;

