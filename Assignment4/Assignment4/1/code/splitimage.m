function [X_train,y_train] = splitimage()
dirPath = '../../att_faces';
X_train = [];
y_train = [];
for i = 1:32
    dir = strcat(dirPath,"/","s",num2str(i),"/");
    for j = 1:10
        image = strcat(dir,num2str(j),".pgm");
        A = double(imread(image,'pgm'));
        B = A(:);
        if(j<7)
            X_train = [X_train,B];
        else
            y_train = [y_train,B];
        end
  
    end
end
end
