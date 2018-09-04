A = 'C:\Users\User\Desktop\5thSEM\csassin\assignment1\2\data\retina.png';
B = 'C:\Users\User\Desktop\5thSEM\csassin\assignment1\2\data\retinaRef.png';
C = imread(A,'png');
D = imread(B,'png');
CR= C(:,:,1); % Red channel
CG = C(:,:,2); % Green channel
CB = C(:,:,3); % Blue channel

[CRrow,CRcolm] = size(CR);
[CGrow,CGcolm] = size(CG);
[CBrow,CBcolm] = size(CB);

[CRcounts,x] = imhist(CR);
[CGcounts,y] = imhist(CR);
[CBcounts,z] = imhist(CB);

CRPROB = CRcounts/(CRrow*CRcolm);
CGPROB = CGcounts/(CGrow*CGcolm);
CBPROB = CBcounts/(CBrow*CBcolm);

CRcdf = cumsum(CRPROB);
CGcdf = cumsum(CGPROB);
CBcdf = cumsum(CBPROB);

CRcdf2  = CRcdf*2;
CGcdf2  = CGcdf*2;
CBcdf2  = CBcdf*2;
%------------------------------------------
DR = D(:,:,1); % Red channel
DG = D(:,:,2); % Green channel
DB = D(:,:,3); % Blue channel

[DRrow,DRcolm] = size(DR);
[DGrow,DGcolm] = size(DG);
[DBrow,DBcolm] = size(DB);

[DRcounts,xr] = imhist(DR);
[DGcounts,yr] = imhist(DR);
[DBcounts,zr] = imhist(DB);

DRPROB = DRcounts/(DRrow*DRcolm);
DGPROB = DGcounts/(DGrow*DGcolm);
DBPROB = DBcounts/(DBrow*DBcolm);

DRcdf = cumsum(DRPROB);
DGcdf = cumsum(DGPROB);
DBcdf = cumsum(DBPROB);

DRcdf2  = DRcdf*2;
DGcdf2  = DGcdf*2;
DBcdf2  = DBcdf*2;
