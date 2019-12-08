function [theta, J] = gradientdescent(X, y, theta, alpha, iterations)
m = length(y); % ���ݼ��ĳ���
J = zeros(iterations, 1);

for iter = 1:iterations
    theta = theta - (alpha/m)*(((X*theta) - y)'*X)';
    J(iter) = computeloss(X, y, theta);%�洢ÿһ�ε�����J
     
end

end
