main();

function main()
    Data = struct('q', 1.6e-19, ...
                  'k', 1.38e-23, ...
                  'T', 300);
    SemData = struct('Si', getData('Si'), ...
                     'Ge', getData('Ge'), ...
                     'GaAs', getData('GaAs'), ...
                     'InSb', getData('InSb'));
    Mobility = struct('Si', 1500, ...
                      'Ge', 3900, ...
                      'GaAs', 8500, ...
                      'InSb', 78e3);

    Dn_Si = Data.k * Data.T * Mobility.Si / Data.q / 1e4;
    Jn_Si = Data.q * Dn_Si * (SemData.Si.x1 - SemData.Si.x2) ...
        / 1e4 / SemData.Si.delta_x / 1e2;
    Dn_Ge = Data.k * Data.T * Mobility.Ge / Data.q / 1e4;
    Jn_Ge = Data.q * Dn_Ge * (SemData.Ge.x1 - SemData.Ge.x2) ...
        / 1e4 / SemData.Ge.delta_x / 1e2;
    Dn_GaAs = Data.k * Data.T * Mobility.GaAs / Data.q / 1e4;
    Jn_GaAs = Data.q * Dn_GaAs * (SemData.GaAs.x1 - SemData.GaAs.x2) ...
        / 1e4 / SemData.GaAs.delta_x / 1e2;
    Dn_InSb = Data.k * Data.T * Mobility.InSb / Data.q / 1e4;
    Jn_InSb = Data.q * Dn_InSb * (SemData.InSb.x1 - SemData.InSb.x2) ...
        / 1e4 / SemData.InSb.delta_x / 1e2;

    CalcData = struct('Si', struct('Dn', Dn_Si, 'Jn', Jn_Si), ...
                      'Ge', struct('Dn', Dn_Ge, 'Jn', Jn_Ge), ...
                      'GaAs', struct('Dn', Dn_GaAs, 'Jn', Jn_GaAs), ...
                      'InSb', struct('Dn', Dn_InSb, 'Jn', Jn_InSb));

    makePlot(CalcData);
end

function Data = getData(semicon_name)
    fprintf("\n------- %s -------\n", semicon_name);
    x1 = input("Введите концентрацию электронов при x1 = 0мкм: ");
    x2 = input("Введите концентрацию электронов при x1 = 2мкм: ");
    delta_x = input("Введите размер области градиента концентрации, см: ");

    Data = struct('x1', x1, 'x2', x2, 'delta_x', delta_x);
end

function makePlot(Data)
    figure
    title("Точечная диаграмма");
    semilogy(Data.Si.Dn, Data.Si.Jn, '.');
    text(Data.Si.Dn, Data.Si.Jn, "\leftarrow Si");
    hold on
    semilogy(Data.Ge.Dn, Data.Ge.Jn, '.');
    text(Data.Ge.Dn, Data.Ge.Jn, "\leftarrow Ge");
    hold on
    semilogy(Data.GaAs.Dn, Data.GaAs.Jn, '.');
    text(Data.GaAs.Dn, Data.GaAs.Jn, "\leftarrow GaAs");
    hold on
    semilogy(Data.InSb.Dn, Data.InSb.Jn, '.');
    text(Data.InSb.Dn, Data.InSb.Jn, "\leftarrow InSb");
    hold on
    xlabel("Градиент изменения концентрации электронов");
    ylabel("Плотность диффузионного тока электронов");
end
