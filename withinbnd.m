function Pi_fixed = withinbnd(Pi, L)
% 4. Napisać funkcję testującą ograniczenia (stabilność generowanego wielomianu) i naprawiającą lub usuwającą rozwiązania przekraczające ograniczenia.
    min_ = -10; max_ = 10;
    for i = 1:length(Pi)
        if Pi(i) < min_
            Pi(i) = min_;
        elseif Pi(i) > max_
            Pi(i) = max_;
        end
    end
    stable = isstable(tf([Pi(1) Pi(2) Pi(3)], [1 Pi(4) Pi(5)]));
    Pi_fixed = cell(5,1);
    for i = 1:5
        Pi_fixed{i} = dec2bins(Pi(i), L);
    end
end