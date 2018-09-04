%% MyMainScript

tic;
%% Your code here
%% Mask used to make images isotropic:
figure(1),imshow(fspecial('gaussian',9,3),[]);
title('Isotropic Mask');

%%  Barbara image
load('../data/barbara.mat');
Orig = myShrinkImageByFactorD(imageOrig,2);
Orig = double(Orig);
i_diff = (max(Orig(:))-min(Orig(:)))*0.05;
img = Orig + i_diff*randn(size(Orig));
RMSD = myPatchBasedFiltering(img,Orig,0.45);
% Optimum value of sigma = 0.45 : RMSD = 0.033
% 0.9*sigma = 0.405 : RMSD = 0.037
% 1.1*sigma = 0.495 : RMSD = 0.035

%%  Grass image
load('../data/grassNoisy.mat');
imgOrig = imread('../data/grass.png');
RMSD = myPatchBasedFiltering(imgCorrupt,imgOrig,0.35);
% Optimum value of sigma = 0.35 : RMSD = 0.0392
% 0.9*sigma = 0.315 : RMSD = 0.0398
% 1.1*sigma = 0.385 : RMSD = 0.0408

%%  Honey comb image
load('../data/honeyCombReal_Noisy.mat');
imgOrig = imread('../data/honeyCombReal.png');
RMSD = myPatchBasedFiltering(imgCorrupt,imgOrig,0.32);
% Optimum value of sigma = 0.32 : RMSD = 0.043
% 0.9*sigma = 0.288 : RMSD = 0.0444
% 1.1*sigma = 0.352 : RMSD = 0.045

%%
toc;
