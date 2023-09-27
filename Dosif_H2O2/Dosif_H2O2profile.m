function dosifValues = Dosif_H2O2profile(vecH2O2, nS, tvec,Cin,tSlot)
    dosifValues=zeros(size(tvec));
    for i=1:length(tvec)
        dosifValues(i)=Dosif(tvec(i),Cin,vecH2O2, nS, tSlot);
    end
    
end

