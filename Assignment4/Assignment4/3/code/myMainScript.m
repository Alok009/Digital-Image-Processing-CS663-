%% MyMainScript

tic;
%%
%  If the same algorithm is used on people not part of the training set, the algorithm will return the label that most closely matches the new face based on mean squared distance
% 
% 
%  We plotted the min square difference for each image in the testing dataset.
%  As expected the min square difference is seen to be larger for those images that are new and have no matching identity.
%  Hence we used a threshold to identify whether the image is unseen(new) or seen in training, for a fixed value of K (we used 60).
%  
%  Question3(1) plots the min square difference for the 128 (=32x4) imagesthat are old or seen
%  Question3(2) plots the min square difference for the 32 (=8x4) images that are new or unseen
%
%  Threshold used is 5.5x10^6 for which we got:
%  i) 23 false negatives (out of 128 images)
%  ii) 5 false positives (out of 32 images)
%%
Question3(1);
%%
Question3(2);
%%
toc;
