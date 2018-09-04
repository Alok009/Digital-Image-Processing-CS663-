function myCLAHE(threshold,a)
% a = imread('../data/barbara.png','png');
% a = imread('../data/TEM.png','png');
 %a = imread('../data/canyon.png','png');

m = size(a,1);
n = size(a,2);
l = size(a,3);
img1 = zeros(m,n,l,'double');

window_size = 31;
%threshold = 100;

new_hist = zeros(256,1,'double');
d = (window_size-1)/2;

for i = 1:l
for r = 1:m
    for c = 1:n
        rmin = max(1,r-d);
        rmax = min(m,r+d);
        cmin = max(1,c-d);
        cmax = min(n,c+d);
        scale = (rmax-rmin+1)*(cmax-cmin+1);
        [hista,x] = imhist(a(rmin:rmax, cmin:cmax,i));
        new_hist(:) = hista(:) + (sum(hista(hista(:)>threshold) - threshold)/256);
        new_hist((hista(:)>threshold)) = new_hist((hista(:)>threshold)) - hista((hista(:)>threshold)) + threshold;
        new_cdf = cumsum(new_hist)/scale;
        img1(r,c,i) = (new_cdf(a(r,c,i) + 1));
    end
end
end


% figure(1),histogram(a,256);
% figure(2),histogram(img,256);

figure(3),imshow(a);
colorbar('southoutside');
title('Input Image');
figure(5),imshow(img1);
colorbar('southoutside');
title('CLAHE Output');
end
