mz_eSi=1.08;% - эффективная масса электрона для Si
mz_pSi=0.56;% - эффективная масса дырки для Si
mz_eGe=0.56; % - эффективная масса электрона для Ge
mz_pGe=0.35; % - эффективная масса дырки для Ge

mz_eGaAs=0.068;...........  - эффективная масса электрона для GaAs
mz_pGaAs=0.45;...........  - эффективная масса дырки для GaAs

mz_eInSb=0.013;...........  - эффективная масса электрона для InSb
mz_pInSb=0.6;............ - эффективная масса дырки для InSb

k=1.38*1e-23;% - постоянная Больцмана, Дж/К 
T1=77;% - первая температура 77К
T2=300;% - вторая температура 300К
h=6.63*1e-34;% - постоянная Планка Дж*с
m0=9.1*1e-31;% - масса покоя электрона, кг
Eg0Si=1.21;%   - ширина запрещенной зоны Si при 0К,Эв
Eg0Ge=0.8;%    - ширина запрещенной зоны Ge при 0К,Эв 
Eg0GaAs=1.56;...........   - ширина запрещенной зоны GaAs при 0К,Эв
Eg0InSb=1.56;...........   - ширина запрещенной зоны GaAs при 0К,Эв
aSi=2.4*1e-4;% - температурный коэффициент Si,эВ/К
aGe=5.8*1e-4;% - температурный коэффициент Ge,эВ/К
aGaAs=5.8*1e-4; %.....; - температурный коэффициент GaAs,эВ/К
aInSb= 5.1*1e-4;%.....; - температурный коэффициент InSb,эВ/К

NcSi77=2*(sqrt(((2*pi*m0*mz_eSi.*k.*T1)/h^2).^3))/1000000;
NvSi77=2*(sqrt(((2*pi*m0*mz_pSi.*k.*T1)/h^2).^3))/1000000;
EgSi77=Eg0Si-aSi.*T1;
nSi77=sqrt(NcSi77.*NvSi77).*2.7183^(-EgSi77*1.6*1e-19/(2*k*T1));

NcSi300=2*(sqrt(((2*pi*m0*mz_eSi.*k.*T2)/h^2).^3))/1000000;
NvSi300=2*(sqrt(((2*pi*m0*mz_pSi.*k.*T2)/h^2).^3))/1000000;
EgSi300=Eg0Si-aSi.*T2;
nSi300=sqrt(NcSi300.*NvSi300).*2.7183^(-EgSi300*1.6*1e-19/(2*k*T2));

NcGe77=2*(sqrt(((2*pi*m0*mz_eGe.*k.*T1)/h^2).^3))/1000000;
NvGe77=2*(sqrt(((2*pi*m0*mz_pGe.*k.*T1)/h^2).^3))/1000000;
EgGe77=Eg0Ge-aGe.*T1;
nGe77=sqrt(NcGe77.*NvGe77).*2.7183^(-EgGe77*1.6*1e-19/(2*k*T1));

NcGe300=2*(sqrt(((2*pi*m0*mz_eGe.*k.*T2)/h^2).^3))/1000000;
NvGe300=2*(sqrt(((2*pi*m0*mz_pGe.*k.*T2)/h^2).^3))/1000000;
EgGe300=Eg0Ge-aGe.*T2;
nGe300=sqrt(NcGe300.*NvGe300).*2.7183^(-EgGe300*1.6*1e-19/(2*k*T2));

NcGaAs77=2*(sqrt(((2*pi*m0*mz_eGaAs.*k.*T1)/h^2).^3))/1000000;
NvGaAs77=2*(sqrt(((2*pi*m0*mz_pGaAs.*k.*T1)/h^2).^3))/1000000;
EgGaAs77=Eg0GaAs-aGaAs.*T1;
nGaAs77=sqrt(NcGaAs77.*NvGaAs77).*2.7183^(-EgGaAs77*1.6*1e-19/(2*k*T1));

NcGaAs300=2*(sqrt(((2*pi*m0*mz_eGaAs.*k.*T2)/h^2).^3))/1000000;
NvGaAs300=2*(sqrt(((2*pi*m0*mz_pGaAs.*k.*T2)/h^2).^3))/1000000;
EgGaAs300=Eg0GaAs-aGaAs.*T2;
nGaAs300=sqrt(NcGaAs300.*NvGaAs300).*2.7183^(-EgGaAs300*1.6*1e-19/(2*k*T2));

NcInSb77=2*(sqrt(((2*pi*m0*mz_eInSb.*k.*T1)/h^2).^3))/1000000;
NvInSb77=2*(sqrt(((2*pi*m0*mz_pInSb.*k.*T1)/h^2).^3))/1000000;
EgInSb77=Eg0InSb-aInSb.*T1;
nInSb77=sqrt(NcInSb77.*NvInSb77).*2.7183^(-EgInSb77*1.6*1e-19/(2*k*T1));

NcInSb300=2*(sqrt(((2*pi*m0*mz_eInSb.*k.*T2)/h^2).^3))/1000000;
NvInSb300=2*(sqrt(((2*pi*m0*mz_pInSb.*k.*T2)/h^2).^3))/1000000;
EgInSb300=Eg0InSb-aInSb.*T2;
nInSb300=sqrt(NcInSb300.*NvInSb300).*2.7183^(-EgInSb300*1.6*1e-19/(2*k*T2));

fprintf('T=77K\n');
fprintf('Параметр%20s%20s%20s%20s\n', 'Si', 'Ge', 'GaAs', 'InSb');
fprintf('Nc      %20e%20e%20e%20e\n', NcSi77, NcGe77, NcGaAs77,NcInSb77);
fprintf('Nv      %20e%20e%20e%20e\n', NvSi77, NvGe77, NvGaAs77,NvInSb77);
fprintf('n      %20e%20e%20e%20e\n\n', nSi77, nGe77, nGaAs77,nInSb77);

fprintf('T=300K\n');
fprintf('Параметр%20s%20s%20s%20s\n', 'Si', 'Ge', 'GaAs', 'InSb');
fprintf('Nc      %20e%20e%20e%20e\n', NcSi300, NcGe300, NcGaAs300,NcInSb300);
fprintf('Nv      %20e%20e%20e%20e\n', NvSi300, NvGe300, NvGaAs300,NvInSb300);
fprintf('n      %20e%20e%20e%20e\n\n', nSi300, nGe300, nGaAs300,nInSb300);

t = 77:1:300;
yy1 = 2*(sqrt(((2*pi*m0*mz_eSi.*k.*t)/h^2).^3))/1000000;
yy2 = 2*(sqrt(((2*pi*m0*mz_pSi.*k.*t)/h^2).^3))/1000000;
yy3 = Eg0Si-aSi.*t;
z1 = sqrt(yy1.*yy2).*2.7183.^(-yy3.*1.6.*1e-19./(2.*k.*t));

y1 = 2*(sqrt(((2*pi*m0*mz_eGe.*k.*t)/h^2).^3))/1000000;
y2 = 2*(sqrt(((2*pi*m0*mz_pGe.*k.*t)/h^2).^3))/1000000;
y3 = Eg0Ge-aGe.*t;
z2 = sqrt(y1.*y2).*2.7183.^(-y3.*1.6.*1e-19./(2.*k.*t));

y1 = 2*(sqrt(((2*pi*m0*mz_eGaAs.*k.*t)/h^2).^3))/1000000;
y2 = 2*(sqrt(((2*pi*m0*mz_pGaAs.*k.*t)/h^2).^3))/1000000;
y3 = Eg0GaAs-aGaAs.*t;
z3 = sqrt(y1.*y2).*2.7183.^(-y3.*1.6.*1e-19./(2.*k.*t));

y1 = 2*(sqrt(((2*pi*m0*mz_eInSb.*k.*t)/h^2).^3))/1000000;
y2 = 2*(sqrt(((2*pi*m0*mz_pInSb.*k.*t)/h^2).^3))/1000000;
y3 = Eg0InSb-aInSb.*t;
z4 = sqrt(y1.*y2).*2.7183.^(-y3.*1.6.*1e-19./(2.*k.*t));

    subplot(2, 2, 1), plot(t, z1)
        xlabel('Температура, град К'); 
ylabel('Концентрация, Si'); 

    subplot(2, 2, 2), plot(t, z2)
        xlabel('Температура, град К'); 
ylabel('Концентрация, Ge'); 

    subplot(2, 2, 3), plot(t, z3)
        xlabel('Температура, град К'); 
ylabel('Концентрация, GaAs'); 

    subplot(2, 2, 4), plot(t, z4)
        xlabel('Температура, град К'); 
ylabel('Концентрация, InSb'); 

%%%end








