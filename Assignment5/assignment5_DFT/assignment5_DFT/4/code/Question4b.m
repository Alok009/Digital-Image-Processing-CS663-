function Question4b

A = "../data/barbara256.png";
f = imread(A);
figure(1),imshow(f,[]);

[rows,colm] = size(f);

f_desh = padarray(f,[rows/2,colm/2],0,'both');
F_desh = fftshift(fft2(f_desh));

logMag = log(abs(F_desh));
figure(2),imshow(logMag,[]);

%Gaussian filter----------------------------
H_Gauss = ones(2*rows,2*colm);
thres = 40^2+80^2;

i = 0;
j = 0;

for i=1:2*rows
    for j = 1:2*colm
            H_Gauss(i,j) = exp(-((rows-i)^2 + (colm-j)^2)/(2*thres));
    end
end

G_prod = H_Gauss.*F_desh;

logMagG = log(abs(G_prod));
figure(3),imshow(logMagG,[]);

G_Y = ifftshift(G_prod);
GG = ifft2(G_Y);
GG = GG((rows/2+1):3*rows/2,(colm/2+1):3*colm/2);
figure(4),imshow(real(GG),[])

end







