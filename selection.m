function Q = selection(P, N, L, dStp, dImp, dFrq)
% 6. Napisać funkcję selekcji osobników do operacji genetycznych.
% Selekcja turniejowa.
    q = 10; % ilość osobników w turnieju
    Q_ = zeros(5, q);
    Q_fp = zeros(1, q);
    for i = 1:N
        r_ = randperm(N, q);
        for j = 1:q
            for k = 1:5
                Q_(k, j) = bin2decs(P{k, r_(j)});
            end
        end
        for j = 1:q
            Q_fp(j) = fitnessfunction(Q_(:,j), dStp, dImp, dFrq);
            [x, y] = max(Q_fp);
            for k = 1:5
                Q(k, i) = dec2bins(Q_(k, y), L);
            end
        end
    end
end