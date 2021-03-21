function [sys,x0,str,ts] = chap2_1plant(t,x,u,flag)
switch flag
    case 0
        [sys,x0,str,ts] = mdlInitializeSizes;
    case 1
        sys = mdlDeratives(t,x,u);
    case 3
        sys = mdlOutputs(t,x,u);
    case {2,4,9}
        sys = [];
    otherwise
        error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts] = mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates =2;
sizes.NumDiscStates =0;
sizes.NumOutputs = 2;
sizes.NumInputs = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [0.5 1.0];
str = [];
ts = [];

function sys = mdlDeratives(t,x,u)
% 状态方程 一阶导数
J=10;
sys(1) = x(2);   %dot_x1 = x2
sys(2) = 1/J*u;  %dot_x2 = ..

function sys = mdlOutputs(t,x,u)
sys(1) = x(1);  %th
sys(2) = x(2);  %dth
