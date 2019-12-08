function [X_norm, jun, sigma] = featurenormalize(X)
X_norm = X;
jun = zeros(1, size(X, 2));%size（x，2)返回矩阵列数
sigma = zeros(1, size(X, 2));
%首先，对于每个特征维，计算特征均值并将其从数据集中减去，
%将均值存储在mu中。 接下来，计算每个特征的标准偏差，
%并将每个特征除以标准偏差，然后将标准偏差存储在sigma中。
%请注意，X是一个矩阵，其中每一列都有特征，
%每一行都是一个示例。 需要分别为每个功能执行标准化。
jun = sum(X) / length(X);
sigma = std(X);
	
	for i=1:length(X)
		X_norm(i,:) = (X(i,:) - jun) ./ sigma;
    end
end
