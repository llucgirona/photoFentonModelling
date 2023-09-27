function concentration = findC(t,t_vec,C_vec)
    concentration= interp1(t_vec,C_vec,t,'spline');
end