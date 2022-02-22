main();

function main()
    Data = struct('k', 1.38e-23, 'q', 1.6e-19, 't', 300);
    InputDataSemi = struct('Si', getDataSemi('Si'), 'Ge', ...
        getDataSemi('Ge'), 'GaAs', getDataSemi('GaAs'), 'InSb', ...
        getDataSemi('InSb'));
    InputDataFerr = struct('Al', getDataFerr('Al'), 'Cu', ...
        getDataFerr('Cu'), 'Au', getDataFerr('Au'), 'Pt', ...
        getDataFerr('Pt'));
    CalcData = struct('Si', calcParameters(Data, InputDataSemi.Si, ...
        InputDataFerr), 'Ge', calcParameters(Data, InputDataSemi.Ge, ...
        InputDataFerr), 'GaAs', calcParameters(Data, ...
        InputDataSemi.GaAs, InputDataFerr), 'InSb', calcParameters(Data, ...
        InputDataSemi.GaAs, InputDataFerr));

    fprintf("Параметр\t\t|Si\t\t|Ge\t\t|GaAs\t\t|InSb\n");
    fprintf("Al\t\t|%g\t\t|%g\t\t|%g\t\t|%g\n", CalcData.Si.Al, ...
        CalcData.Ge.Al, CalcData.GaAs.Al, CalcData.InSb.Al);
    fprintf("Cu\t\t|%g\t\t|%g\t\t|%g\t\t|%g\n", CalcData.Si.Cu, ...
        CalcData.Ge.Cu, CalcData.GaAs.Cu, CalcData.InSb.Cu);
    fprintf("Au\t\t|%g\t\t|%g\t\t|%g\t\t|%g\n", CalcData.Si.Au, ...
        CalcData.Ge.Au, CalcData.GaAs.Au, CalcData.InSb.Au);
    fprintf("Pt\t\t|%g\t\t|%g\t\t|%g\t\t|%g\n", CalcData.Si.Pt, ...
        CalcData.Ge.Pt, CalcData.GaAs.Pt, CalcData.InSb.Pt);

    makePlot(InputDataFerr, CalcData);
end

function Data = getDataSemi(semicon_name)
    fprintf("\n------- %s -------\n", semicon_name);
    Eg = input("Введите ширину запрещенной зоны, эВ: ");
    ksi = input("Введите электронное сродство, эВ: ");
    ro = input("Введите удельное сопротивление, Ом*см: ");
    mn = input("Введите подвижность электронов, см-2*В-1*с-1: ");
    n = input("Введите собственную концентрацию носителей, см-3: ");

    Data = struct('Eg', Eg, 'ksi', ksi, 'ro', ro, 'mn', mn, 'n', n);
end

function Data = getDataFerr(ferr_name)
    A = input("Введите работу выхода " + ferr_name + " при 300К, эВ: ");
    Data = A;
end

function Data = calcParameters(Data, InputDataSemi, InputDataFerr)
    ND = 1 / (Data.q * InputDataSemi.mn * InputDataSemi.ro);
    Fi_0 = Data.k * Data.t * log10(ND / InputDataSemi.n);
    Fi = InputDataSemi.ksi + InputDataSemi.Eg / 2 - Fi_0;
    Al = InputDataFerr.Al - Fi;
    Cu = InputDataFerr.Cu - Fi;
    Au = InputDataFerr.Au - Fi;
    Pt = InputDataFerr.Pt - Fi;

    Data = struct('Al', Al, 'Cu', Cu, 'Au', Au, 'Pt', Pt);
end

function makePlot(DataFerr, CalcData)
    figure
    title("Точечный график");

    plot(DataFerr.Al, CalcData.Si.Al, '.');
    text(DataFerr.Al + 0.01, CalcData.Si.Al + 0.01, "Si(Al)");
    hold on
    plot(DataFerr.Cu, CalcData.Si.Cu, '.');
    text(DataFerr.Cu + 0.01, CalcData.Si.Cu - 0.01, "Si(Cu)");
    hold on
    plot(DataFerr.Au, CalcData.Si.Au, '.');
    text(DataFerr.Au - 0.01, CalcData.Si.Au + 0.01, "Si(Au)");
    hold on
    plot(DataFerr.Pt, CalcData.Si.Pt, '.');
    text(DataFerr.Pt - 0.01, CalcData.Si.Pt - 0.01, "Si(Pt)");
    hold on
    
    plot(DataFerr.Al, CalcData.Ge.Al, '.');
    text(DataFerr.Al - 0.01, CalcData.Ge.Al - 0.01, "Ge(Al)");
    hold on
    plot(DataFerr.Cu, CalcData.Ge.Cu, '.');
    text(DataFerr.Cu + 0.01, CalcData.Ge.Cu + 0.01, "Ge(Cu)");
    hold on
    plot(DataFerr.Au, CalcData.Ge.Au , '.');
    text(DataFerr.Au + 0.01, CalcData.Ge.Au - 0.01, "Ge(Au)");
    hold on
    plot(DataFerr.Pt, CalcData.Ge.Pt, '.');
    text(DataFerr.Pt - 0.01, CalcData.Ge.Pt + 0.01, "Ge(Pt)");
    hold on

    plot(DataFerr.Al, CalcData.GaAs.Al, '.');
    text(DataFerr.Al - 0.01, CalcData.GaAs.Al + 0.01, "GaAs(Al)");
    hold on
    plot(DataFerr.Cu, CalcData.GaAs.Cu, '.');
    text(DataFerr.Cu - 0.01, CalcData.GaAs.Cu - 0.01, "GaAs(Cu)");
    hold on
    plot(DataFerr.Au, CalcData.GaAs.Au, '.');
    text(DataFerr.Au + 0.01, CalcData.GaAs.Au + 0.01, "GaAs(Au)");
    hold on
    plot(DataFerr.Pt, CalcData.GaAs.Pt, '.');
    text(DataFerr.Pt + 0.01, CalcData.GaAs.Pt - 0.01, "GaAs(Pt)");
    hold on

    plot(DataFerr.Al, CalcData.InSb.Al, '.');
    text(DataFerr.Al + 0.01, CalcData.InSb.Al - 0.01, "InSb(Al)");
    hold on
    plot(DataFerr.Cu, CalcData.InSb.Cu, '.');
    text(DataFerr.Cu - 0.01, CalcData.InSb.Cu + 0.01, "InSb(Cu)");
    hold on
    plot(DataFerr.Au, CalcData.InSb.Au, '.');
    text(DataFerr.Au - 0.01, CalcData.InSb.Au - 0.01, "InSb(Au)");
    hold on
    plot(DataFerr.Pt, CalcData.InSb.Pt, '.');
    text(DataFerr.Pt + 0.01, CalcData.InSb.Pt + 0.01, "InSb(Pt)");

    xlabel("Работа выхода из металла");
    ylabel("Контактная разность потенциалов");
end

