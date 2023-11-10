clear; clc;

data = load("USPS.mat");

data = data.A;
mean_A = mean(data);
A = data - mean_A;

[U, S, V] = svd(A);

% for p = [10 50 100 200]
for p = 200
    P = V(1:p, :);
    de_data = data * P';
    rec_data = de_data * P + mean_A;
    err = immse(data, rec_data);
    rec_img = reshape(rec_data(1,:), 16, 16);
    imshow(rec_img')
    imwrite(rec_img', '200-1.png')
    rec_img = reshape(rec_data(2,:), 16, 16);
    imshow(rec_img')
    imwrite(rec_img', '200-2.png')
end

