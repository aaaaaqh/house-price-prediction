function [theta, J] = gradientdescent(X, y, theta, alpha, iterations)
m = length(y); % 数据集的长度
J = zeros(iterations, 1);

for iter = 1:iterations
    theta = theta - (alpha/m)*(((X*theta) - y)'*X)';
    J(iter) = computeloss(X, y, theta);%存储每一次迭代的J
     
end

end
