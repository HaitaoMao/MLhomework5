clear; clc;
data = rand([100, 2]) * 10;
n = 100;
m = 2;

sigma = 1;
W = zeros(n,n);
for i = 1:n
    for j = i+1:n
        W(i,j) = exp(-norm(data(i,:)-data(j,:))^2/(2*sigma^2));
        W(j,i) = W(i,j);
    end
end

D = diag(sum(W));
L = D - W;
[U, Lambda] = eig(L, D);
U = normr(U);
k = 2;
[idx, C] = kmeans(U(:,1:k), k);

scatter(data(:, 1), data(:, 2), 'ro');
hold on
scatter(C(:, 1), C(:, 2), 'kx');

