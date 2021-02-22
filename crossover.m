function T_ = crossover(T, N)
% 7. Napisać funkcję krzyżowania z zadanym prawdopodobieństwem.
% Krzyżowanie jednopunktowe.
    pc = 0.5; % szansa na krzyżowanie
    Tr = random('unif', 0, 1, 1, N); % los
    Tg = round(random('unif', 1, 5, 1, N)); % gen
    T_ = cell(5, 10);
    for i = 1:(N/2)
        ii = i*2;
        if Tr(1,ii) < pc
            for j = 1:5
                if Tg(1,ii) < j 
                    T_{j,ii} = T{j, ii};
                    T_{j, ii-1} = T{j, ii-1};
                else
                    T_{j,ii} = T{j, ii-1};
                    T_{j,ii-1} = T{j, ii};
                end
            end
        else
            for j = 1:5
                T_{j,ii} = T{j,ii};
                T_{j,ii-1} = T{j,ii-1};
            end
        end
    end
end