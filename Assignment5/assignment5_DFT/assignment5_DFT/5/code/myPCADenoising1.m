function RMSE = myPCADenoising1
im  = imread('../data/barbara256.png');
im1 = double(im) + randn(size(im))*20;

m = size(im,1);
N = (m-6)^2;
P = zeros(49,N);
xlist(:,1) = 1:(m-6);
xylist(2,:) = reshape(repmat(xlist,1,(m-6)),[1,N]);
xylist(1,:) = reshape(repmat(xlist',(m-6),1),[1,N]);


% To create P
for i = 1:N
        r = xylist(1,i);
        c = xylist(2,i);
        P(:,i) = reshape(im1(r:r+6,c:c+6),49,1);
end

[V,D] = eig(P*P');
alpha = V'*P;
%  i in column j in row
% that is alpha[ij] = alpha(j,i)

mat = ((sum((alpha.^2),2))./N)-400;
mat(mat<0) = 0;
filt = repmat(mat./(mat + 400),1,N);

new_alpha = filt.*alpha;
new_P = V*new_alpha;

im2 = zeros(m,m);
count = zeros(m,m);

for i = 1:N
    patch = zeros(m,m);
    cpatch = zeros(m,m);
    r = xylist(1,i);
    c = xylist(2,i);
    patch(r:r+6,c:c+6) = reshape(new_P(:,i),7,7);
    cpatch(r:r+6,c:c+6) = ones(7,7);
    im2 = im2 + patch;
    count = count + cpatch;
end

im2 = im2./count;
RMSE = sqrt(sum(sum((im2-double(im)).^2)))/sqrt(sum(sum((double(im)).^2)));

% figure(1),imshow(im,[]);
% figure(2),imshow(im1,[]);
figure(3),imshow(im2,[]);
end
