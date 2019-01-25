A = "../data/image_low_frequency_noise.mat";
B = load(A);
f=struct2array(B);
figure(1),imshow(f,[]);

[rows,colm] = size(f);
f_desh = padarray(f,[rows/2,colm/2],0,'both');

F_desh = fftshift(fft2(f_desh));
logMag = log(abs(F_desh));
figure(2),imshow(logMag,[]);
%[x,y] = ginput(2);
H = ones(512,512);

H(236,246) = 0;
H(237,246) = 0;
H(238,246) = 0;

H(236,247) = 0;
H(237,247) = 0;
H(238,247) = 0;

H(236,248) = 0;
H(237,248) = 0;
H(238,248) = 0;


H(276,266) = 0;
H(277,266) = 0;
H(278,266) = 0;

H(276,267) = 0;
H(277,267) = 0;
H(278,267) = 0;

H(276,268) = 0;
H(277,268) = 0;
H(278,268) = 0;


prod = H.*F_desh;
logMag2 = log(abs(prod));
figure(3),imshow(logMag2,[]);


Y = ifftshift(prod);
G = ifft2(Y);
figure(4),imshow(G,[])


