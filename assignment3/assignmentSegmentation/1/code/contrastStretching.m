%------------stretching--------------
function C = contrastStretching(X)
[rows,colm] = size(X);
low = min(X);
lowest = min(low);  %minimum intensity
high = max(X);   
highest = max(high);   %maximum intensity
Z = 1/double(highest-lowest);
C  = zeros(rows,colm);
C(1:rows,1:colm) = double(X(1:rows,1:colm) - lowest)*(Z);
end

