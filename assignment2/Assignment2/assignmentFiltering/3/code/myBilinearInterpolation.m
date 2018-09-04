function bigimg =  myBilinearInterpolation(b,k)
% load('../data/honeyCombReal_Noisy.mat')
% b = imgCorrupt;
% k = 2;

m = size(b,1);
n = size(b,2);

i = zeros(k*m-k+1,k*n-k+1,'double');
img = im2double(i);

for r = 0:(k*m-k+1)
    for c = 0:(k*n-k+1)
        fr = floor(r/k);
        fc = floor(c/k);
        cr = ceil(r/k);
        cc = ceil(c/k);
        if cc == n
            cc = n-1;
        end
        if cr == m
            cr = m-1;
        end

        d2r = (k*cr-r);
        d2c = (k*cc-c);
        d1r = (r - k*fr);
        d1c = (c - k*fc);

        if d1r == 0
            d1r = k;
        end
        if d1c == 0
            d1c = k;
        end

        x = (d2r)*(d2c)*double(b(fr+1,fc+1)) + (d1r)*(d2c)*double(b(cr+1,fc+1)) + (d2r)*(d1c)*double(b(fr+1,cc+1)) + (d1r)*(d1c)*double(b(cr+1,cc+1));
        i(r+1,c+1) = double(x/k*k);
        img(r+1,c+1) = double(x/k*k);
     end
end

bigimg = img;
% % 
% figure(3),imshow(b,[]);
% title('Original Image');
% colorbar('southoutside');
% figure(4),imshow(img, []);
% title('Bilinear Interpolation');
% colorbar('southoutside');
end
