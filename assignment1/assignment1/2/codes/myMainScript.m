%% MyMainScript

tic;
%% 

%% Q2. a) Linear stretching
%   Formula used:
%   ratio = 1/double(maxa-mina);
%   img(:,:,n) = double((temp(:,:)-mina))*ratio;
myLinearContrastStretching(imread('../data/barbara.png','png'));
%%
myLinearContrastStretching(imread('../data/TEM.png','png'));
%%
myLinearContrastStretching(imread('../data/canyon.png','png'));
%%
myLinearContrastStretching(imread('../data/church.png','png'));

%   inspite of having a large range of intensities, the intensities are 
%    grouped together. To improve the contrast a
%   non linear stretching is required here. If a linear stretching is used,
%   the intensities are still grouped together, and there is not much
%   effective increase in contrast.
%% Q2. b) Histogram equalisation
myHE(imread('../data/barbara.png','png'));
%%
myHE(imread('../data/canyon.png','png'));
%%
myHE(imread('../data/TEM.png','png'));
%%
myHE(imread('../data/church.png','png'));
%  Here the cdf and hence the transformation function rises sharply
%  wherever the intensities are grouped together. Hence highly clustered
%  intensities get stretched more. This non linear stretching produces much
%  greater contrast where it is required

%% Q2 c) Histogram Matching
myHM;
%   As the name suggests, the HM produces an output image which has a
%   contrast very similar to the reference image provided. This is achieved
%   by matching the histogram and hence the cdf of the output image with
%   the reference image. That is, the distribution of intensities in the 
%   output is made to be similar to that of the reference image. The
%   difference in contrast is seen because of a discrete CDF and 
%   discretisation of intensites.

%% Q2 d)AHE with window size 251
myAHE(251, imread('../data/barbara.png','png'));
%%
myAHE(251, imread('../data/TEM.png','png'));
%%
myAHE(251, imread('../data/canyon.png','png'));
%% Window size = 31, noisy
myAHE(31, imread('../data/barbara.png','png'));
%% Window size = 1001, less contrast
myAHE(1001, imread('../data/barbara.png','png'));
%% Q2 e)CLAHE with window size = 31, threshold = 10
myCLAHE(10, imread('../data/barbara.png','png'));
%%
myCLAHE(10, imread('../data/TEM.png','png'));
%% 
myCLAHE(10, imread('../data/canyon.png','png'));
%% threshold = 5
myCLAHE(5, imread('../data/canyon.png','png'));
toc;
