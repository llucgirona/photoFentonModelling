function dC = PhotoFentonFunctionDosif(t,C,PARAM,ALTRES,Cin,vecH2O2,nS,tSlot)
    % noms concentracions
    Fe_II = C(1);
    Fe_III=C(2);
    H2O2=C(3);
    R=C(4);
    M=C(5);
    MX1=C(6);
    MX2=C(7);
    O2=C(8);

    % noms concentracions in
    Fe_II_in = Cin(1);
    Fe_III_in=Cin(2);
    H2O2_in=Cin(3);
    R_in=Cin(4);
    M_in=Cin(5);
    MX1_in=Cin(6);
    MX2_in=Cin(7);
    O2_in=Cin(8);
    
    %% Parametres aprox inicial
    
    % cts cinètiques
    k1= PARAM(1); %1/(mM*h)
    k2=PARAM(2); %1/((W/m^2)*h)
    k3=PARAM(3); %1/(mM*h)
    k4=PARAM(4); %1/(mM*h)
    k5=PARAM(5); %1/(mM^2*h)
    k6=PARAM(6); %1/(mM*h)
    k7=PARAM(7); %1/(mM*h)
    k8=PARAM(8); %1/(mM*h)
    k9=PARAM(9); %1/(mM*h)
    
    % coeficients estequiometrics
    g1=PARAM(10);
    g2=PARAM(11);
    c1=PARAM(12);
    
    %%
    I=ALTRES(1); % Intensitat luminca (W m^(-2))
    % transferencia de materia o2
    KLa=ALTRES(2); % coeficient global referit a la fase líquida * superfice específica (1/h)
    O2_sol=ALTRES(3); %mM
    
    V=ALTRES(4); %L
    
    %eqns cinètiques
    r1=k1*Fe_II*H2O2;
    r2=k2*Fe_III*I;
    r3=k3*R*H2O2;
    r4=k4*R*R;
    r5=k5*M*R*O2;
    r6=k6*M*R;
    r7=k7*MX1*R;
    r8=k8*MX1*R;
    r9=k9*MX2*R;
    
    F=Dosif(t,Cin,vecH2O2, nS,tSlot);
    %Balanços massa
    dFe_II=(F/V)*(Fe_II_in-Fe_II)-r1+r2;
    dFe_III=(F/V)*(Fe_III_in-Fe_III)+r1-r2;
    dH2O2= (F/V)*(H2O2_in-H2O2)-r1-r3;
    dR=(F/V)*(R_in-R)+r1+r2-r3-2*r4-r5-r6-r7-r8-r9;
    dM=(F/V)*(M_in-M)-r5-r6;
    dMX1=(F/V)*(MX1_in-MX1)+r5+r6-r7-r8;
    dMX2=(F/V)*(MX2_in-MX2)+r7-r9;
    dO2=(F/V)*(O2_in-02)+g1*r3+g2*r4-c1*r5+KLa*(O2_sol-O2);
   
    % assignar variables
    dC(1,:)=dFe_II; 
    dC(2,:)=dFe_III;
    dC(3,:)=dH2O2;
    dC(4,:)=dR;
    dC(5,:)=dM;
    dC(6,:)=dMX1;
    dC(7,:)=dMX2;
    dC(8,:)=dO2;
    dC(9,:)=dM+dMX1+dMX2;
end