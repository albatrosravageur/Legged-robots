% You can set any hyper parameters of the control function here; you may or
% may not want to use the step_number as the input of the function. 
function parameters = control_hyper_parameters(step_number)
w_st2sw = 1;
w_sw2st = 1;
ta = 1;
tr = 1;
alpha = 10.4*pi/180;
Si = 1;

parameters = [w_st2sw, w_sw2st, ta, tr, alpha, Si]';

end