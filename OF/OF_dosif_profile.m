function fun = OF_dosif_profile(PARAM,ALTRES,Cin,vecH2O2,nS,tSlot,tfin,C0)
    tspan=linspace(0,tfin);
    [~,C] = ode15s(@(t,C)  PhotoFentonFunctionDosif(t,C,PARAM,ALTRES,Cin,vecH2O2,nS,tSlot), tspan, C0);
    fun=(C(1,end)-C(end,end))/C(1,end);
end

