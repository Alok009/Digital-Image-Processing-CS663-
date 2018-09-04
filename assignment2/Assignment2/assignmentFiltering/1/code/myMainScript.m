%% MyMainScript
myUnsharpMasking("..\data\lionCrop.mat",9,2,0.7)
%Value of Parameters 
%standard deviation = 2,
%size of kernal = 11 ,
%weighting factor = 0.7.
%%
myUnsharpMasking("..\data\superMoonCrop.mat",11,2.5,0.08)
%Value of Parameters 
%standard deviation = 2.5,
%size of kernal = 11 ,
%weighting factor = 0.08.
tic;
%% Your code here

toc;
