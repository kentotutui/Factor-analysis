% ランダムなテストデータの生成（整数値）
% 各教科の平均点と標準偏差を設定（例として仮定）
mean_scores = [70, 65, 75, 60, 80]; % 数学, 理科, 社会, 英語, 国語
std_devs = [10, 15, 10, 20, 5];

% 100人分のデータを生成
num_students = 100;
data = zeros(num_students, length(mean_scores));

for i = 1:length(mean_scores)
    data(:, i) = round(mean_scores(i) + std_devs(i) * randn(num_students, 1));
end

% データを表示（最初の5行を確認）
disp('Test Data:');
disp(data(1:5, :));

% 因子数の指定
numFactors = 2;

% 因子分析の実行
[Loadings, Psi, T, stats, F] = factoran(data, numFactors);

% 結果の表示
disp('Factor Loadings:');% 因子負荷量
disp(Loadings);
disp('Unique Variances (Psi):');
disp(Psi);
disp('Factor Scores:');% 因子得点
disp(F);

% 因子負荷量のプロット
figure;
biplot(Loadings, 'scores', F, 'varlabels', {'Math', 'Science', 'Social Studies', 'English', 'Japanese'});
title('Factor Loadings and Scores');
xlabel('Factor 1');
ylabel('Factor 2');
