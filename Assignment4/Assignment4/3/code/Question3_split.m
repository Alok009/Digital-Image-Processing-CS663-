function [X_test,y_test] = Question3_split()
dirPath = '../../att_faces';
X_test = [];
y_test = [];
for i = 33:40
    dir = strcat(dirPath,"/","s",num2str(i),"/");
    for j = 1:10
        image = strcat(dir,num2str(j),".pgm");
        A = double(imread(image,'pgm'));
        B = A(:);
        if(j<7)
            X_test = [X_test,B];
        else
            y_test = [y_test,B];
        end
  
    end
end
end
