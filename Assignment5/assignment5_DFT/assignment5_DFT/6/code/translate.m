
i = zeros(300,300);
j = i;
i(50:99,50:119) = ones(50,70);
i = i*255;
j(20:69,120:189) = ones(50,70);
j = j*255;
figure(1),imshow(i);
figure(2),imshow(j);

fi = fft2(i);
fj = fft2(j);

figure(3),imshow(fi);
figure(4),imshow(fj);


x = (fi.*conj(fj));
m = abs(fi.*(fj));
y  = x./m;
shift = ifft2(x);
