close all
clear all
clc

load("data6")

% system szukany
sysW = tf([1 -2 0], [1 2 1]);

% najlepszy z ostatniego pokolenia
[x, y] = max(best(100,:));
a = bests(100,:,y);
sysA = tf([a(1) a(2) a(3)], [1 a(4) a(5)]);

% % najlepszy z cyklu
[x1, y1] = max(best(:,:));
[x2, y2] = max(x1);
b = bests(y1(y2),:,y2);
sysB = tf([b(1) b(2) b(3)], [1 b(4) b(5)]);

syss = [a(1) a(2) a(3) a(4) a(5); b(1) b(2) b(3) b(4) b(5)]';

% statystyka
[x, y__] = min(1./best);
xavg = round(mean(x)*1000000)/1000000;
xmed = round(median(x)*1000000)/1000000;
xvar = round(var(x)*1000000)/1000000;
[xavg xmed xvar];

% wykresy
fig = figure(1);
hold on
for i = 1:S
    plot(best(:,i))
end
hold off
ylabel("Wartość funkcji przystosowania")
xlabel("Numer pokolenia")
saveas(fig, 'fig1.png')

fig = figure(2);
hold on
step(sysW)
step(sysA)
step(sysB)
hold off
title("Porównanie odpowiedzi skokowych")
xlabel("Czas")
ylabel("Y")
legend('Obiekt szukany', 'Najlepszy wynik (w ostatnim kroku)', 'Najlepszy wynik (przez cały cykl)')
saveas(fig, 'fig2.png')

fig = figure(3);
hold on
impulse(sysW)
impulse(sysA)
impulse(sysB)
hold off
title("Porównanie odpowiedzi impulsowych")
xlabel("Czas")
ylabel("Y")
legend('Obiekt szukany', 'Najlepszy wynik (w ostatnim kroku)', 'Najlepszy wynik (przez cały cykl)')
saveas(fig, 'fig3.png')

fig = figure(4);
hold on
nyquist(sysW)
nyquist(sysA)
nyquist(sysB)
legend('Obiekt szukany', 'Najlepszy wynik (w ostatnim kroku)', 'Najlepszy wynik (przez cały cykl)')
hold off
saveas(fig, 'fig4.png')

fig = figure(5);
hold on
bode(sysW)
bode(sysA)
bode(sysB)
legend('Obiekt szukany', 'Najlepszy wynik (w ostatnim kroku)', 'Najlepszy wynik (przez cały cykl)')
hold off
saveas(fig, 'fig5.png')