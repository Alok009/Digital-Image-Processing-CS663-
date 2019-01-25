function translate1
i = zeros(300,300);
j = i;
i(50:99,50:119) = ones(50,70);
i = i*255;
j(20:69,120:189) = ones(50,70);
j = j*255;

i1 = double(i) + randn(size(i))*20;
j1 = double(j) + randn(size(j))*20;

fi = fftshift(fft2(i1));
fj = fftshift(fft2(j1));
m = abs(fi.*(fj));  
x = (fj.*conj(fi))./abs(fi.*(fj));
x(m==0) = 1;
z = log(abs(x));
shift = ifft2(ifftshift(x));
y = max(max(shift));            %
shift(shift==y) = 1;            % Done to see the maxima in the image 

figure(2),imshow(z,[]);
figure(3),imshow(shift,[]);
% [r,c] = ginput(1);
end