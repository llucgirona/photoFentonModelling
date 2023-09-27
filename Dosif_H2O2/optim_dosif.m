function vecH2O2=optim_dosif(nS,tfin,PARAM,ALTRES,C0,Cin,tSlot)
    
    numSlots=tfin/tSlot;
    numComb=2^numSlots;
    
    OF=0;
    vecH2O2=zeros(1,numSlots);

    for i=1:numComb-1
        binvec = transpose(sscanf(num2str(dec2bin(i)), '%1d'));
        binvec = [zeros(1, numSlots-length(binvec)), binvec];
        
        objfun = OF_dosif_profile(PARAM,ALTRES,Cin,binvec,nS,tSlot,tfin,C0);

        if objfun>OF
            OF=objfun;
            vecH2O2=binvec;
        end
    end
end