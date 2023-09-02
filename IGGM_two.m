%%Determine the optimal value of each parameter

%The program needs to add two loops to select multiple parameters simultaneously. It is being corrected....
clear;clc;
G=6.672*10^-8;%gravitational constant
PI=3.1416;
D= ? ;
%Input control points used to  iteratively calculate optimal parameters (white points in the paper).
X_Y=load("  ");

depth0=X_Y(:,3); % shipborned bathymetry from NCEI.
g_i=X_Y(:,4); %gravity anomaly

p=2;%Density contrast.
kk=[0.5:0.5:7]; %The index of the weight
R=2;%%Calculated radius

parfor m=1:length(kk) 
%%Enter the long-wave gravity anomaly after GMT processing
FileName= strcat('E:\PHS_10deg_grid\phs_120-130_5-15\process\IGGM\p_',num2str(p),'\R_',num2str(R),'/grd',num2str(m),'.xyz');
Grid=GetGrid(FileName);
    %Read the grid data!
    Lon=Grid(1,:);Lat=Grid(:,1);Lon(1)=[];Lat(1)=[];
    Grid(1,:)=[];Grid(:,1)=[];gg=Grid;
    g_i_long=interp2(Lon,Lat,gg,X_Y(:,1),X_Y(:,2),'spline');
    g_i_short=g_i-g_i_long;
    depth1(:,m)=D-(g_i_short./(2*PI*G*p*10^5));
    depth_cha(:,m)=depth0-depth1(:,m);
    STD(m)=std(depth_cha(:,m));
    RMS(m)=rms(depth_cha(:,m));
    corr(m)=corr(depth0,depth1(:,m),'type','Pearson');
    Mean(m)=mean(depth_cha(:,m));
    Max(m)=max(depth_cha(:,m));
    Min(m)=min(depth_cha(:,m));
    MAE(m)=mean(abs(depth_cha(:,m)));
end
%Find the minimum value for each row in the STD matrix and return the location 
[min_STD,index]=min(STD,[],2);
%Find the maximum value of each row in the correlation coefficient and return the location
[min_corr,index]=min(corr,[],2);

   
