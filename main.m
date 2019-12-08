% ================ Part 1: 规范化 ================
clear ; close all; clc
fprintf('加载数据 ...\n');

%加载数据
data = load('data.txt');
X = data(:,1);
y = data(:,2);
m = length(y);

% 显示一些样本情况
fprintf('数据中的最先五个样本: \n');
fprintf(' x = %.0f , y = %.0f \n', [X(1:5,:) y(1:5,:)]');%不显示小数点后的数
fprintf('程序暂停. 按动继续.\n');
pause;
% 缩放特征并求零均值
fprintf('规范化特征 ...\n');
[X, jun, sigma] = featurenormalize(X);
plotdata(X,y);
% 添加项
X = [ones(m, 1) X];
% ================ Part 2: 梯度下降计算 ================

fprintf('运行梯度下降...\n');
% 选取一些参数值
alpha = 0.05;
iterations = 100;

%初始化Theta 
theta = zeros(2, 1);

[theta, J] = gradientdescent(X, y, theta, alpha, iterations);

%绘制线性回归方程
hold on
plot(X(:,2),X*theta)
legend('样本数据','一元线性回归');

%绘制收敛图
figure;

plot(1:numel(J), J, '-b', 'LineWidth', 2);
xlabel('迭代次数');
ylabel('损失 J');

% 梯度下降结果
fprintf('由梯度下降计算的theta: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% 估算160平方英尺房屋的价格
d = 149;
d = (d - jun)./sigma;%规范化
d = [ones(1, 1) d];
price = d * theta; 

fprintf(['160平方的住宅的预测价格 ' ...
         '(梯度下降法):\n $%f\n'], price);

 