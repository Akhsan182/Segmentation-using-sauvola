% Akuisisi image
img=imread('Rgb/anthurium1.jpg');

% Konversi image
imgresize=imresize(img,[320 480]);
subplot(2,2,1), imshow(img), title('Image Resize') 

% Konversi image RGB ke Grayscale
imggray=rgb2gray(imgresize);
subplot(2,2,2), imshow(imggray), title('Konversi Grayscale') 

% Konversi image ke doublel
double_img = double(imggray);

% Mencari Mean
mean=mean2(double_img);

% Mencari Standar Deviasi
standar_deviasi = std2(double_img);

% Menghitung Thresholding
k=0.2;
R=128;
threshold_value = mean*(1 - k * (1 - standar_deviasi/R));
sauvola_image = threshold(double_img, threshold_value);

subplot(2,2,3), imshow(sauvola_image), title('Hasil Sauvola') 

% Citra Ground Truth
gt=imread('gt/gt1.jpg');
gtresize=imresize(gt,[320 480]);
gtgray=rgb2gray(gtresize);
double_gt = double(gtgray);

% Menghitung MSE dengan fungsi Matlab
error = immse(double_gt, sauvola_image);
fprintf('\n The mean-squared error is %0.4f\n', error);

% Menghitung MSE
[rowsize, colsize] = size(double_gt);
MSE=zeros(rowsize,colsize);
for baris=1:rowsize
    for kolom=1:colsize
      MSE(baris,kolom)=(double_gt(baris,kolom)- sauvola_image(baris,kolom))^2;
    end
end
error_local = sum(sum(MSE))/(rowsize*colsize);
fprintf('\n The mean-squared error is %0.4f\n', error_local);

