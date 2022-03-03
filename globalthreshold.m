% Akuisisi image
img=imread('Rgb/anthurium1.jpg');
subplot(2,2,1), imshow(img), title('Original image') 

% Konversi image
imgresize=imresize(img,[320 480]);

% BW
bw=im2bw(imgresize)

% Konversi ke double
double_bw = double(bw);
subplot(2,2,2), imshow(double_bw), title('Global Threshold') ;

% Ground Truth
gt=imread('gt/gt1.jpg');
gtresize=imresize(gt,[320 480]);
gtgray=rgb2gray(gtresize);
double_gt = double(gtgray);

% Menghitung MSE fungsi Matlab
error_immse = immse(double_gt, double_bw);
fprintf('\n The mean-squared error is %0.4f\n', error_immse);

% Menghitung MSE
[rowsize, colsize] = size(double_gt);
MSE=zeros(rowsize,colsize);
for baris=1:rowsize
    for kolom=1:colsize
      MSE(baris,kolom)=(double_gt(baris,kolom)- double_bw(baris,kolom))^2;
    end
end
error_global = sum(sum(MSE))/(rowsize*colsize);
fprintf('\n The mean-squared error is %0.4f\n', error_global);