function [X_norm, jun, sigma] = featurenormalize(X)
X_norm = X;
jun = zeros(1, size(X, 2));%size��x��2)���ؾ�������
sigma = zeros(1, size(X, 2));
%���ȣ�����ÿ������ά������������ֵ����������ݼ��м�ȥ��
%����ֵ�洢��mu�С� ������������ÿ�������ı�׼ƫ�
%����ÿ���������Ա�׼ƫ�Ȼ�󽫱�׼ƫ��洢��sigma�С�
%��ע�⣬X��һ����������ÿһ�ж���������
%ÿһ�ж���һ��ʾ���� ��Ҫ�ֱ�Ϊÿ������ִ�б�׼����
jun = sum(X) / length(X);
sigma = std(X);
	
	for i=1:length(X)
		X_norm(i,:) = (X(i,:) - jun) ./ sigma;
    end
end
