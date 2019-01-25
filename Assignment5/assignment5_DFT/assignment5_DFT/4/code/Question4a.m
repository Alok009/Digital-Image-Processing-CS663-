function Question4a

A = "../data/barbara256.png";
f = imread(A);
figure(1),imshow(f,[]);

[rows,colm] = size(f);

f_desh = padarray(f,[rows/2,colm/2],0,'both');
F_desh = fftshift(fft2(f_desh));

logMag = log(abs(F_desh));
figure(2),imshow(logMag,[]);

H = ones(2*rows,2*colm);
thres = 40^2+80^2;

for i=1:2*rows
    for j = 1:2*colm
        if((rows-i)^2 + (colm-j)^2 >thres);
            H(i,j) = 0;
        end
    end
end

prod = H.*F_desh;
logMag2 = log(abs(prod));
figure(3),imshow(logMag2,[]);

Y = ifftshift(prod);
G = ifft2(Y);
G = G((rows/2+1):3*rows/2,(colm/2+1):3*colm/2);
figure(4),imshow(real(G),[])
end


