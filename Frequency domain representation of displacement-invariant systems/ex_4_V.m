%% Tema 4
clc;
close all;
j = sqrt(-1);

% Subpunctul A

[poli_a, zerouri_a] = PS_Lab_3_Tema_4a(3, 7);
w_a = -pi:3.14/1000:pi;
b_a = poly(zerouri_a);
a_a = poly(poli_a);

[H_a, w_a] = freqz(b_a, a_a, w_a);

frecvente_poli_a = angle(poli_a);
frecvente_zerouri_a = angle(zerouri_a);

figure(1); hold on; title('Raspunsul in frecventa(A)');
ylabel('Amplitudine(dB)');
xlabel('Pulsatia');
plot(w_a, 20*log10(H_a)); hold off;

poli_a = poli_a.';
zerouri_a = zerouri_a.';
figure(2); hold on;
zplane(zerouri_a, poli_a); hold off; title("Poli-zerouri(A)");

% Subpunctul B

[poli_b, zerouri_b] = PS_Lab_3_Tema_4b(3, 7);
w_b = -pi:3.14/1000:pi;
b_b = poly(zerouri_b);
a_b = poly(poli_b);

[H_b, w_b] = freqz(b_b, a_b, w_b);

frecvente_poli_b = angle(poli_b);
frecvente_zerouri_b = angle(zerouri_b);

figure(3); hold on; title('Raspunsul in frecventa(B)');
ylabel('Amplitudine(dB)');
xlabel('Pulsatia');
plot(w_b, 20*log10(H_b)); hold off;

poli_b = poli_b.';
zerouri_b = zerouri_b.';
figure(4); hold on;
zplane(zerouri_b, poli_b); hold off; title("Poli-zerouri(B)");
