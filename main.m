clear all
close all
clc

% tf([Pi(1) Pi(2) Pi(3)], [1 Pi(4) Pi(5)])

% 1.1. Zaproponować stabilny, ciągły model LTI SISO rzędu (n=2) dowolnego obiektu
sysW = tf([1 -2 0], [1 2 1]);
% 1.2. Wyznaczyć charakterystykę częstotliwościową, skokową i impulsową w 100 punktach.
wStp = step(sysW, 0:0.1:9.9);
wImp = impulse(sysW, 0:0.1:9.9);
wFrq = freqresp(sysW, logspace(-2, 2, 100));

M = 100; % ilość iteracji
load("startpopulation")

bests = zeros(M, 5, S); % najlepsze parametry układu
best = zeros(M, S); % najlepsze wartości fp


for A = 1:S 
    Pt = Pt_(:, :, A);
    for K = 1:M
        [A, K]
        % 11. Napisać funkcję rysującą wartość funkcji celu najlepszego wyznaczonego rozwiązania w funkcji pokoleń algorytmu
        tempPt = zeros(5,N);
        for j = 1:N
            for i = 1:5
                tempPt(i,j) = bin2decs(Pt{i,j});
            end
        end
        fp = zeros(1,N);
        for i = 1:N
            fp(1,i) = fitnessfunction(tempPt(:,i), wStp, wImp, wFrq);
        end
        [best(K, A), y] = max(fp);
        if best(K, A) == Inf
            break
        end
        bests(K, :, A) = tempPt(:,y)';
        % 12. Na podstawie napisanych funkcji stworzyć algorytm genetyczny wyznaczający współczynniki poszukiwanego wielomianu.
        T = selection(Pt, N, L, wStp, wImp, wFrq);
        O = crossover(T, N);
        Pt = mutation(O, N, L, K, M);
        tempPt = zeros(5, N);
        for j = 1:N
            for i = 1:5
                tempPt(i, j) = bin2decs(Pt{i,j});
            end
            Pi_fixed = withinbnd(tempPt(:,j), L);
            for i = 1:5
                Pt{i, j} = char(Pi_fixed{i});
            end
        end
    end
end

fig1 = figure(1);
hold on
xlabel("Numer pokolenia")
ylabel("Wartość funkcji przystosowania")
for i = 1:S
    plot(best(:,i))
end

