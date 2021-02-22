function T_ = mutation(T, N, L, K, M)
% 9. Napisać funkcję mutacji z zadanym prawdopodobieństwem.
% Mutacja poprzez inwersję.
    pm = 0.03; % szansa inwersji
    T_ = T;
    for j = 1:N
        for i = 1:5
            change = random('unif', 0, 1, 1, L);
            for k = 1:L
                if change(1,k) < pm
                    temp = char(T(i,j));
                    if temp(2+k) == '1'
                        temp(2+k) = '0';
                    else
                        temp(2+k) = '1';
                    end
                    T_{i,j} = temp;
                end
            end
        end
    end
end