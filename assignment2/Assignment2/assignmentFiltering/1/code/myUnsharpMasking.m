function myUnsharpMasking(A,hsize,sigma,amount)
%A = "..\data\superMoonCrop.mat";
B = load(A);
X=struct2array(B);

%------------stretching--------------
% [rows,colm] = size(X);
% low = min(X);
% lowest = min(low);  %minimum intensity
% high = max(X);   
% highest = max(high);   %maximum intensity
% Z = 255/double(highest-lowest);
% C  = zeros(rows,colm);
% C(1:rows,1:colm) = double(X(1:rows,1:colm) - lowest)*(Z);
% figure(1),imshow(C,[]);
% title('Original Image');
% colorbar('southoutside');
%-------------blurring-----------------
G = fspecial('gaussian',hsize,sigma);
blur = imfilter(X,G);
%figure(2),imshow(blur,[]);
%unsharpMask = original_img +K*(original-blur)
%k(weighing factor)
%-----------------UNSHARP MASKING-----------
Y = X-blur;
M = X + amount*Y;
%------------------------------stretching part-----------
orgImg = contrastStretching(X);
figure(1),imshow(orgImg,[])
title('Linearly Stretched Original Image');
colorbar('southoutside');

finImage = contrastStretching(M);
figure(2),imshow(finImage,[]);
title('Linearly Stretched Sharpen Image');
colorbar('southoutside');

end






