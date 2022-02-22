%Расчет положения уровня Ферми от температуры
mz_eSi=1.08;
mz_pSi=0.56;
mz_eGe=0.56;
mz_pGe=0.35;
mz_eInSb=0.013;
mz_pInSb=0.6;
mz_eGaAs=0.068; 
mz_pGaAs=0.45; 
k=1.38*1e-23;
T1=77;
T2=300;

%Определяем положения уровня Ферми
F300Si=3/4*k*T2*log(mz_eSi/mz_pSi)./(1.6*1e-19)
F77Si=3/4*k*T1*log(mz_eSi/mz_pSi)./(1.6*1e-19)

F300Ge=3/4*k*T2*log(mz_eGe/mz_pGe)./(1.6*1e-19)
F77Ge=3/4*k*T1*log(mz_eGe/mz_pGe)./(1.6*1e-19)

F300GaAs=3/4*k*T2*log(mz_eGaAs/mz_pGaAs)./(1.6*1e-19)
F77GaAs=3/4*k*T1*log(mz_eGaAs/mz_pGaAs)./(1.6*1e-19)

F300InSb=3/4*k*T2*log(mz_eInSb/mz_pInSb)./(1.6*1e-19)
F77InSb=3/4*k*T1*log(mz_eInSb/mz_pInSb)./(1.6*1e-19)

disp('f0 Si при T = 300');
disp(F300Si);

disp('f0 Ge при T = 300');
disp(F300Ge);

disp('f0 GaAs при T = 300');
disp(F300GaAs);

disp('f0 InSb при T = 300');
disp(F300InSb);

disp('f0 Si при T = 77');
disp(F77Si);

disp('f0 Ge при T = 77');
disp(F77Ge);

disp('f0 GaAs при T = 77');
disp(F77GaAs);

disp('f0 InSb при T = 77');
disp(F77InSb);

%создаем массивы со значениями уровня Ферми, материалами и температурами
fermiValues = [F300Si; F77Si; F300Ge; F77Ge; F300GaAs; F77GaAs; F300InSb; F77InSb];
temps = [300; 77; 300; 77; 300; 77; 300; 77];

for i = 1:1:8 %цикл отрисовки зонных диаграмм
    figure %создаем окно для зонной диаграммы
    hold on %позволяем добавлять новые графики без удаления предыдущих
if (i == 1) || (i == 2) %добавляем название зонной диаграмме
    title({'Si', sprintf('T=%dК', temps(i))})
elseif (i == 3) || (i == 4)
    title({'Ge', sprintf('T=%dК', temps(i))})
elseif (i == 5) || (i == 6)
    title({'GaAs', sprintf('T=%dК', temps(i))})
elseif (i == 7) || (i == 8)
    title({'InSb', sprintf('T=%dК', temps(i))})
end
    
    Ec = yline(0.1, 'LineWidth', 4); %рисуем линию дна зоны проводимости
    text(0, 0.095, 'Ec', 'FontSize', 15); %подписываем линию 
    lvl = yline(fermiValues(i), '--', 'LineWidth', 3); %рисуем уровень Ферми при расчетной температуре 
    Ef = yline(0, 'LineWidth', 4); %рисуем уровень ферми при T=0К
    text(0, 0.005, 'Ef', 'FontSize', 15); %подписываем линию    
    Ev = yline(-0.1, 'LineWidth', 4); %рисуем линию потолка валентной зоны 
    text(0,-0.095, 'Ev', 'FontSize', 15); %подписываем линию
    set(gca,'xtick',[]); %убираем значения на координатной оси по Х
    set(gca,'ytick',[]); %убираем значения на координатной оси по У
    %далее для того, чтобы правильно подписать уровень Ферми, определяем в какую сторону он сместится
    %если >0, то подписываем новое значение сверху, над линией уровня
    %если <0, то подпиываем новое значение снизу, под линией уровня
    if (fermiValues(i) >= 0)
        text(0.5, fermiValues(i)+0.01, ['\phi >0 ' sprintf('(%f эВ)', fermiValues(i))], 'FontSize', 15)
    else 
        text(0.5, fermiValues(i)-0.01, ['\phi <0 ' sprintf('(%f эВ)', fermiValues(i))], 'FontSize', 15)
    end 
end

