


%% Tema 5A
clc;
clear all;
close all;

%Subpunctul A

% [poli,~] = PS_Lab_3_Tema_4b(3,7);
% poli = unique(abs(poli));
% 
% for l = 1 : length(poli)
% for i = 0 : 5
% instrument = i ; 
% pol =  pnoli(l);  %-0.95 ;
% 
% [y,n,Y,f,yp] = musical_tones(instrument,pol,1) ;
% end
% end

for i = 0 : 5
    instrument = i;
    pol = -0.95;

    [y,n,Y,f,yp] = musical_tones(instrument,pol,1) ;
end

