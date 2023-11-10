% data = rand([30, 3]);
% k = 5;
% 
% [M, N] = size(data);
% 
% index = zeros(M, 1);
% center = zeros(k, N);
% 
% u = zeros(k, N);
% c = zeros(k, N);
% 
% for i = 1:k
%     u(i, :) = data(i, :);
% end
% 
% while true
%     for i = 1:M
%         dist = zeros(k, 1);
%         for j = 1:k
%             sum_dist = 0;
%             for p = 1:N
%                 sum_dist = sum_dist + (u(j, p) - data(i,p))^2;
%             end
%             dist(j) = sqrt(sum_dist);
%         end
%         [v, idx] = sort(dist);
%         index(i, 1:3) = data(i, :);
%         index(i, 4) = idx(1);
%     end
% 
%     for i = 1:k
%         tol_dist = zeros(1, N);
%         num = 0;
%         for j = 1:M
%             if index(j, 3) == i
%                 for p = 1:N
%                     tol_dist(1, p) = tol_dist(1, p) + data(j, p);
%                 end
%                 num = num + 1;
%             end
%         end
%         c(i, :) = tol_dist(1, :) / num;
%     end
% end

clear; clc;
data = rand([100, 2]) * 10;
K = 2;
z1 = data(1,:);
z2 = data(2,:);
while true
    center1=[data(1,:)];
    center2=[data(2,:)];
    for i = 2:length(data)
        x = data(i,:);
        r1 =sum( (z1-x).^2);
        r2 =sum( (z2-x).^2);
        if r1<r2
            center1=[center1; x];
        else
            center2 = [center2; x];
        end
    end
    z11 = mean(center1,1);
    z22 = mean(center2,1);
    if  z11== z1 & z22 == z2
        break;
    end
    z1 = z11;
    z2 = z22;
end

scatter(center1(:,1), center1(:,2), 'r')
hold on
scatter(center2(:,1), center2(:,2), 'b')
hold on 
scatter(z1(1), z1(2), 'rx')
scatter(z2(1), z2(2), 'bx')

