function rmsd = myPatchBasedFiltering(img,imgOrig,sigma)
% load('../data/barbara.mat')
% load('../data/grassNoisy.mat')
% 
% load('../data/honeyCombReal_Noisy.mat')

% img = imgCorrupt;
% imgOrig = imread('../data/grass.png');
% sigma = 0.35;
% img = myShrinkImageByFactorD(img1,2);

m = size(img,1);
n = size(img,2);
o = zeros(m,n,'double');
o = double(imgOrig);
o = o./max(o(:));
img = img./max(img(:));
patch_size = 9;
p = (patch_size-1)/2;
mask = fspecial('gaussian',patch_size,3);
mask = 81*mask;

window_size = 25;
w = (window_size-1)/2;

m=m+p+p;
n=n+p+p;
paddedimg = zeros(m,n);
paddedimg(1+p:m-p,1+p:n-p) = img(:,:);
paddedimg(1:p,:) = paddedimg(1+p:p+p,:);
paddedimg(m-p+1:m,:) = paddedimg(m-p-p+1:m-p,:);
paddedimg(:,1:p) = paddedimg(:,1+p:p+p);
paddedimg(:,n-p+1:n) = paddedimg(:,n-p-p+1:n-p);

%%

newimg = img;

for r = 1+p:m-p
    for c = 1+p:n-p
        mypatch = paddedimg(r-p:r+p,c-p:c+p);
        mypatch = mypatch.*mask;
        wrmin = max(1+p,r-w);
        wrmax = min(m-p,r+w);
        wcmin = max(1+p,c-w);
        wcmax = min(n-p,c+w);

        distmat = zeros(wrmax-wrmin+1,wcmin-wcmax+1);
        for i = wrmin:wrmax
        for j = wcmin:wcmax
            newpatch = paddedimg(i-p:i+p,j-p:j+p);
            newpatch = newpatch.*mask;
            distmat(i-wrmin+1,j-wcmin+1) = sqrt(sumsqr(mypatch-newpatch));
        end
        end
        weights = gaussmf(distmat,[sigma,0]);
        sum_weights = sum(weights(:));
        weights = weights/sum_weights;
        
        newimg(r-p,c-p) = sum(sum((paddedimg(wrmin:wrmax,wcmin:wcmax).*weights(:,:))));      
    end
end
%%
newimg = newimg./max(newimg(:));
o = o./max(o(:));
sd = ((newimg-o).^2);
rmsd = sqrt(mean(sd(:)));
%%
figure(1),imshow(o,[]);
title('Original Image');
colorbar('southoutside');
figure(2),imshow(img,[]);
title('Noisy Image');
colorbar('southoutside');
figure(3),imshow(newimg,[]);
title('Output Image');
colorbar('southoutside');
end