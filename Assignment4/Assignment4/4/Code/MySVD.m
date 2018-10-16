%% SVD Computation
% 
%  For an arbitrary matrix A
%  
% 
A = [-2,1,3,8;7,5,-5,16];


%%
% 
%  The following program will find out U, S and V
%  It also verifies that USV' gives back matrix A
% 

[u,d_left] = eig(A*A');
[v,d_right] = eig(A'*A);

u
s = u' * A * v
v

my_A = u * s * v'
