function plot_all_profiles(t,C,filename,sheet)
    figure('units','normalized','outerposition',[0 0 1 1])
    newcolors = [255 0 0 %Fe_II
                 0 0 255 %Fe_III
                 0 255 0 %H2O2
                 255 255 0 %R
                 0 255 255 %M
                 255 0 255 %MX1
                 100 100 100 %MX2
                 200 0 0 %O2
                 0 200 200]/255;
    colororder(newcolors)
    
    p=plot(t,C);
    legend("Fe_II","Fe_III","H2O2","R","M","MX1","MX2","O2","TOC");
    xlabel("temps (h)");
    ylabel("Concentracions (mM)");
    %%
    figure('units','normalized','outerposition',[0 0 1 1])
    Fe_II=C(:,1); Fe_III=C(:,2); H2O2=C(:,3); R=C(:,4); M=C(:,5); MX1=C(:,6); MX2=C(:,7); O2=C(:,8); TOC=C(:,9);
    pos1 = [0.05 0.7 0.25 0.18];
    subplot('Position',pos1);
    p1 = plot(t,Fe_II,'k');
    p1.LineWidth = 2;
    xlabel("temps (h)");
    ylabel("Concentracio (mM)");
    title('Fe+2')
    
    pos2 = [0.05 0.4 0.25 0.18];
    subplot('Position',pos2);
    p2 = plot(t,Fe_III,'k');
    p2.LineWidth = 2;
    xlabel("temps (h)");
    ylabel("Concentracio (mM)");
    title('Fe+3')
    
    pos3 = [0.05 0.1 0.25 0.18];
    subplot('Position',pos3);
    p3 = plot(t,H2O2,'k');
    p3.LineWidth = 2;
    xlabel("temps (h)");
    ylabel("Concentracio (mM)");
    title('H2O2')
    
    pos7 = [0.35 0.7 0.25 0.18];
    subplot('Position',pos7);
    p7=plot(t,M,'k');
    p7.LineWidth = 2;
    xlabel("temps (h)");
    ylabel("Concentracio (mM)");
    title('M')
    
    pos5 = [0.35 0.4 0.25 0.18];
    subplot('Position',pos5);
    p5=plot(t,MX1,'k');
    p5.LineWidth = 2;
    xlabel("temps (h)");
    ylabel("Concentracio (mM)");
    title('MX1')
    
    pos6 = [0.35 0.1 0.25 0.18];
    subplot('Position',pos6);
    p6=plot(t,MX2,'k');
    p6.LineWidth = 2;
    xlabel("temps (h)");
    ylabel("Concentracio (mM)");
    title('MX2')
    
    pos7 = [0.65 0.7 0.25 0.18];
    subplot('Position',pos7);
    p7=plot(t,R,'k');
    p7.LineWidth = 2;
    xlabel("temps (h)");
    ylabel("Concentracio (mM)");
    title('R')
    
    pos8 = [0.65 0.4 0.25 0.18];
    subplot('Position',pos8);
    p8=plot(t,O2,'k');
    p8.LineWidth = 2;
    xlabel("temps (h)");
    ylabel("Concentracio (mM)");
    title('O2')
    
    pos9 = [0.65 0.1 0.25 0.18];
    subplot('Position',pos9);
    p9=plot(t,TOC,'k');
    p9.LineWidth = 2;
    xlabel("temps (h)");
    ylabel("Concentracio (mM)");
    title('TOC')
    
    %%
    conversio=(TOC(1)-TOC)/TOC(1)*100;

    T=table(t,Fe_II,Fe_III,H2O2,R,M,MX1,MX2,O2,TOC,conversio);
    display(T)
    writetable(T, filename, 'Sheet', sheet, 'Range', 'C1')    
end