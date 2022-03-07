main();

function main()
    SemData = struct('Si_1', getData("Si", 1), ...
                     'Si_2', getData("Si", 2), ...
                     'Ge_1', getData("Ge", 1), ...
                     'Ge_2', getData("Ge", 2), ...
                     'GaAs_1', getData("GaAs", 1), ...
                     'GaAs_2', getData("GaAs", 2), ...
                     'InSb_1', getData("InSb", 1), ...
                     'InSb_2', getData("InSb", 2));

    fprintf("\tТемпература\t|\tSi\t|\tGe\t|\tGaAs\t|\tInSb\t\n");
    fprintf("\tT1,K = %g\t\t|\t%g\t|\t%g\t|\t%g\t|\t%g\t\n", ...
        SemData.Si_1.t, SemData.Si_1.c, SemData.Ge_1.c, ...
        SemData.GaAs_1.c, SemData.InSb_1.c);
    fprintf("\tT2,K = %g\t\t|\t%g\t|\t%g\t|\t%g\t|\t%g\t\n", ...
        SemData.Si_2.t, SemData.Si_2.c, SemData.Ge_2.c, ...
        SemData.GaAs_2.c, SemData.InSb_2.c);

    makePlot(SemData);
end

function Data = getData(semicon_name, num)
    QN = struct('q', 1.6e-19, 'n', 1.6e10);

    fprintf("\n------- %s -------\n", semicon_name);
    t = input("Введите температуру T" + num + ", К: ");
    m_e = input("Введите подвижность электронов при T" + ...
        num + ", см^2 / В * с: ");
    m_p = input("Введите подвижность дырок при T" + ...
        num + ", см^2 / В * с: ");
    concentration = input("Введите собственную концентрацию " + ...
        "носителей при T" + num + ", см^-3: ");

    Data = struct('c', vpa(1 / (QN.q * QN.n * (m_p + m_p)), 4), 't', t);
end

function makePlot(Data)
    figure
    title("Точечная диаграмма");
    x = [Data.Si_1.t, Data.Si_2.t]; y = [Data.Si_1.c, Data.Si_2.c];
    semilogy(x, y);
    text(x, y, "\leftarrow Si");
    hold on
    x = [Data.Ge_1.t, Data.Ge_2.t]; y = [Data.Ge_1.c, Data.Ge_2.c];
    semilogy(x, y);
    text(x, y, "\leftarrow Ge");
    hold on
    x = [Data.GaAs_1.t, Data.GaAs_2.t]; y = [Data.GaAs_1.c, Data.GaAs_2.c];
    semilogy(x, y);
    text(x, y, "\leftarrow GaAs");
    hold on
    x = [Data.InSb_1.t, Data.InSb_2.t]; y = [Data.InSb_1.c, Data.InSb_2.c];
    semilogy(x, y);
    text(x, y, "\leftarrow InSb");
    xlabel("Температура, К");
    ylabel("Удельное сопротивление, Ом * см")
end
