function plot_conversion(t,TOC)
    figure()
    conversio=(TOC(1)-TOC)/TOC(1)*100;
    plot(t,conversio)
    xlabel("temps (h)");
    ylabel("Conversió (%)");
end