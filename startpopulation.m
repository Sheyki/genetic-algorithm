% 3. Napisać funkcję generującą populację startową algorytmu.
% Generowanie 20 losowych populacji startowych.

L = 16; % 2. Zaproponować długość implementacji binarnej
N = 38; % ilość osobników
S = 20; % ilość populacji/iteracji całego algorytmu

% 5 wartości losowych (od -10.00 do 10.00) dla każdego
Pt_ = cell(5, N, S);
for k = 1:S
    x = round(random('unif', -10, 10, 5, N)*100)/100;
    for j = 1:N
        for i = 1:5
            Pt_{i, j, k} = dec2bins(x(i,j), L);
        end
    end
end
clear k j i x

save('startpopulation')