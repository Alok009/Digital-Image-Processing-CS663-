function RMSE = myPCADenoising2
im  = imread('../data/barbara256.png');
im1 = double(im) + randn(size(im))*20;
% imshow(im1,[]);
m = size(im,1);
N = (m-6)^2;
P = zeros(49,N);
new_P = zeros(49,N);
xlist(:,1) = 1:(m-6);
xylist(2,:) = reshape(repmat(xlist,1,(m-6)),[1,N]);
xylist(1,:) = reshape(repmat(xlist',(m-6),1),[1,N]);

% To create P
for i = 1:N
    r = xylist(1,i);
    c = xylist(2,i);
    P(:,i) = reshape(im1(r:r+6,c:c+6),49,1);
end
%%

for i = 1:N
    r = xylist(1,i);
    c = xylist(2,i);
    W = P(:,abs(xylist(1,:)-r)<16 & abs(xylist(2,:)-c)<16);
    
    ID = knnsearch(W',P(:,i)','K',200,'IncludeTies',true);
    Q = W(:,ID{1});
    [V,D] = eig(Q*Q');
    alpha = V'*Q;
    %  i in column j in row
    % that is alpha[ij] = alpha(j,i)

    mat = ((sum((alpha.^2),2))./200)-400;
    mat(mat<0) = 0;
    filt = mat./(mat + 400);
%     filt = ones(49,1);

    new_alpha = filt.*alpha(:,1);
    new_P(:,i) = V*new_alpha;
end
%%
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
