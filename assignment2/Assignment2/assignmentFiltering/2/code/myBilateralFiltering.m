function myBilateralFiltering(input_img,sigma_intensity,sigma_space,hws)
%input_img = load('../data/barbara.mat');
%input_img =  load('../data/grassNoisy.mat');
%input_img = load('../data/honeyCombReal_Noisy.mat');

c = cell2mat(struct2cell(input_img));
Intensity_diff = (max(c(:)) - min(c(:)))*0.05;
a = c + Intensity_diff*randn(size(c));

window_size = 2*(hws) + 1;

pad_a = padarray(a,[hws,hws],0,'both');

space_gauss = fspecial('gaussian',window_size,sigma_space);

m = size(a,1);
n = size(a,2);
l = size(a,3);

for r = 1:l
temp(:,:) = pad_a(:,:,r);
for i = hws+1:hws+m
    for j = hws+1:hws+n
        
        intensity_mask = temp((i-hws):(i+hws),(j-hws):(j+hws));
        intensity_gauss = normpdf(intensity_mask,temp(i,j),sigma_intensity);
        
        x = (intensity_gauss).*(space_gauss);
        y = x.*(intensity_mask);
        
        p = sum(x(:));
        q = sum(y(:));
        
        temp(i,j) = q/p;
    end    
end
filtered_img(:,:,r) = temp((hws+1):(hws+m),(hws+1):(hws+n));
end

sd = ((filtered_img - c).^2);
rmsd = sqrt(mean(sd(:)));

figure(1),imshow(c,[]);
title('Original');
colorbar('southoutside');
figure(2),imshow(a,[]);
title('Noisy Input');
colorbar('southoutside');
figure(3),imshow(filtered_img,[]);
title('Bilateral Filtering');
colorbar('southoutside');