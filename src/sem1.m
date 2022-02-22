main();

function res = main()
    Data = struct('e', 1.6e-19, ...
                  'h', 6.63e-34, ...
                  'm', 9.11e-31, ...
                  'k', 1.38e-23, ...
                  'alfa', 10, ...
                  'a1', 2, ...
                  'S', 1e-7, ...
                  'T', 300);

    [n, Eg, a2, i_res] = parseInput();
    if (i_res == -1)
        return;
    end
    Ef_Ec = ((Data.h / pi / 2) ^ 2 * (3 * pi ^ 2 * n) ^ ...
        (2 / 3)) / 2 / Data.m;
    Ef_Em = 1.1 * Data.k * Data.T;
    Umax = Data.alfa * Ef_Em / Data.e;
    Umin = Data.alfa * Ef_Ec / Data.e;
    E = Ef_Ec - Ef_Em;
    U = 2 * Ef_Ec + Eg * 1.6e-19;
    a2 = [1.6e-9:0.02e-9:2e-9];
    D0 = (16 * E / U) * (1 - E / U);
    D = D0 * exp((-2 * a2) / (Data.h / (2 * pi)) * ...
        sqrt(2 * Data.m * (U - E)));
    Imax = Data.e * Data.S * n * D * sqrt(E / 2 / Data.m);
    
    makePlot(a2, D, Imax)
end

% function CalcData = calculate()
%     
% end

function [n, Eg, a2, res] = parseInput()
    n = input("Введите n: ");
    if (n < 5e25 || n > 10e25)
        disp("Концентрация электронов и дырок должна лежать в " + ...
            "диапазоне [5e25, 10e25]!");
        res = -1;
    end
    Eg = input("Введите Eg: ");
    if (Eg < 0)
        disp("Энергия запрещенной зоны должна быть больше нуля!");
        res = -1;
    end
    a2 = input("Введите a2: ");
    if (a2 < 0)
        disp("Ширина барьера должна быть больше нуля!");
        res = -1;
    end
    res = 0;
end

function makePlot(a2, D, Imax)
    figure
    plot(a2, D)
    title('Зависимость коэффициента прохождения от ширины барьера');
    xlabel('Ширина барьера, М'); 
    ylabel('Коэффиициент прохождения');
    fprintf("D = %g\n", max(D));

    figure
    plot(a2, Imax)
    title('Зависимость тока от ширины барьера');
    xlabel('Ширина барьера, М'); 
    ylabel('Imax, A'); 
    fprintf("Imax = %g\n", max(Imax));
end

