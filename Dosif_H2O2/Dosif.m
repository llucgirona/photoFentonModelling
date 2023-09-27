function dosifValue = Dosif(t,Cin,vecH2O2, nS,tSlot)
    
    H2O2_in=Cin(3);
    sumH2O2 = sum(vecH2O2);

    quantSlot = nS / sumH2O2;
    
    
    cabMolar=quantSlot/tSlot;
    
    cabVol=cabMolar/H2O2_in;


    tNorm=floor(t/tSlot)+1;
    
    if tNorm<length(vecH2O2)+1
        dosifValue = vecH2O2(tNorm)*cabVol;
    else 
        dosifValue=vecH2O2(tNorm-1)*cabVol;
    end
end