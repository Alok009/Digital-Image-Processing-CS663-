function myAHE(window_size,a)
% a = imread('../data/barbara.png','png');
% a = imread('../data/TEM.png','png');
% a = imread('../data/canyon.png','png');

m = size(a,1);
n = size(a,2);
l = size(a,3);

%window_size = 101;
d = (window_size-1)/2;

for i = 1:l
for r = 1:m
    for c = 1:n
        rmin = max(1,r-d);
        rmax = min(m,r+d);
        cmin = max(1,c-d);
        cmax = min(n,c+d);
        [hista,x] = imhist(a(rmin:rmax, cmin:cmax, i));
        scale = (rmax-rmin+1)*(cmax-cmin+1);
        cdfa = cumsum(hista)/scale;
        img(r,c,i) = (cdfa(a(r,c,i) + 1));
    end
end
    
end


% figure(1),histogram(a,256);
% figure(2),histogram(img,256);

figure(3),imshow(a);
colorbar('southoutside');
title('Original Image');
figure(4),imshow(img);
colorbar('southoutside');
title('AHE Output');

end
