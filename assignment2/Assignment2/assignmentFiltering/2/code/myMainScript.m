%% MyMainScript
tic;
%% Q2. Barbara
myBilateralFiltering(load('../data/barbara.mat'),6.55,2.2,6);
%% Q2. Grass
myBilateralFiltering(load('../data/grassNoisy.mat'),0.5,0.5,3);
%% Q2. HoneyComb
myBilateralFiltering(load('../data/honeyCombReal_Noisy.mat'),0.2,0.5,3);
%% Q2. Gaussian Mask
figure(5),imshow((fspecial('gaussian',150,70)),[]);
%%
toc;