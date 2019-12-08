% ================ Part 1: �淶�� ================
clear ; close all; clc
fprintf('�������� ...\n');

%��������
data = load('data.txt');
X = data(:,1);
y = data(:,2);
m = length(y);

% ��ʾһЩ�������
fprintf('�����е������������: \n');
fprintf(' x = %.0f , y = %.0f \n', [X(1:5,:) y(1:5,:)]');%����ʾС��������
fprintf('������ͣ. ��������.\n');
pause;
% ���������������ֵ
fprintf('�淶������ ...\n');
[X, jun, sigma] = featurenormalize(X);
plotdata(X,y);
% �����
X = [ones(m, 1) X];
% ================ Part 2: �ݶ��½����� ================

fprintf('�����ݶ��½�...\n');
% ѡȡһЩ����ֵ
alpha = 0.05;
iterations = 100;

%��ʼ��Theta 
theta = zeros(2, 1);

[theta, J] = gradientdescent(X, y, theta, alpha, iterations);

%�������Իع鷽��
hold on
plot(X(:,2),X*theta)
legend('��������','һԪ���Իع�');

%��������ͼ
figure;

plot(1:numel(J), J, '-b', 'LineWidth', 2);
xlabel('��������');
ylabel('��ʧ J');

% �ݶ��½����
fprintf('���ݶ��½������theta: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% ����160ƽ��Ӣ�߷��ݵļ۸�
d = 149;
d = (d - jun)./sigma;%�淶��
d = [ones(1, 1) d];
price = d * theta; 

fprintf(['160ƽ����סլ��Ԥ��۸� ' ...
         '(�ݶ��½���):\n $%f\n'], price);

 