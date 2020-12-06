function fun_g = g
    g1 = load('g1.mat');
    g2 = load('g2.mat');
    display = 0;

    p = polyfit(linspace(0,2*pi,length(g1.u1)),g1.u1,10);
    fun_g.g1 = @(teta) max(-30,min(30,polyval(p,max(0,min(2*pi,teta)))));
    
    p = polyder(p);
    fun_g.dg1 = @(teta) polyval(p,teta);

    p = polyfit(linspace(0,2*pi,length(g1.u1)),g2.u2,10);
    fun_g.g2 = @(teta) max(-30,min(30,polyval(p,max(0,min(2*pi,teta)))));

    p = polyder(p);
    fun_g.dg2 = @(teta) polyval(p,teta);
    
    if display
        x = 1:length(g1);
        figure
        subplot(2,1,1)
        plot(x, g1, x, fun_g.g1(x));
        subplot(2,1,2)
        plot(x, g2, x, fun_g.g2(x));
    end

end