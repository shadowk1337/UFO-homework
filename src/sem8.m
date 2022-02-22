main();

function main()
    Data = struct('R_h', 1.18, 'q', 1.6e-19, 'k', 1.38e-23, 't', 300);
    InputData = getData();
    CalcData = calcParameters(Data, InputData);

    if (InputData.U_h < 0)
        fprintf("��� �������������� - n-���\n");
    else
        fprintf("��� �������������� - p-���\n");
    end
    fprintf("������������ �������� ���������, �-3 = %g\n", CalcData.N_main);
    fprintf("������������ �������� ���������, ��-3 = %g\n", ...
        CalcData.N_main * 1e-6);
    fprintf("���������� ����������� ���������, ��2*�-1*�-1 = %g\n", ...
        CalcData.Mu_h * 1e4);
    fprintf("�����������, ��������� � ����������� ��������� ����, " + ...
        "��2*�-1*�-1 = %g\n", CalcData.Mu_h_main * 1e4);
    fprintf("����������� ��������, ��2*�-1 = %g\n", CalcData.D * 1e4);

    makePlot(Data, InputData, CalcData);
end

function Data = getData()
    L = input('������� ����� ������� � �����������: ');
    d = input('������� ������ ������� � �����������: ');
    a = input('������� ������� ������� � �����������: ');
    I = input('������� ��� � ������������: ');
    B = input('������� ��������� �������� � ������: ');
    U = input('������� ����������, ����������� � ������� � �������: ');
    U_h = input('������� ���������� ����� � ������������: ');

    Data = struct('L', L * 1e-2, 'd', d * 1e-2, 'a', a * 1e-2, 'I', ...
        I * 1e-3, 'B', B, 'U', U, 'U_h', U_h * 1e-3);
end

function Data = calcParameters(Data, InputData)
    N_main = (Data.R_h * InputData.I * InputData.B) / (Data.q * ...
        InputData.U_h * InputData.d);
    Mu_h = (InputData.U_h * InputData.L) / (InputData.a * InputData.U * ...
        InputData.B);
    Mu_h_main = Mu_h / Data.R_h;
    D = (Data.k * Data.t * Mu_h) / (Data.q);

    Data = struct('N_main', N_main, 'Mu_h', Mu_h, 'Mu_h_main', ...
        Mu_h_main, 'D', D);
end

function makePlot(Data, InputData, CalcData)
    B = 0:0.001:3;
    U_h = (InputData.I * B) / (Data.q * CalcData.N_main * InputData.d);
    plot(B, U_h);
    title('����������� ���������� ����� �� �������� ��������� ��������');
    xlabel('��������� ��������, ��');
    ylabel('���������� �����, �');
end
