function [ solution ] = SVM_fenlei( b0,dd0,group)
%   对数据进行二分类，数据可以是多维的。也可以测试分类成立。
%   输入： b0-训练集矩阵
%         dd0-测试集矩阵
%         group-训练集标签（类别）
%   输出： solution-分类结果

    [b,ps]=mapstd(b0); %已分类数据的标准化
    dd=mapstd('apply',dd0,ps); %待分类数据的标准化
    s=svmtrain(b',group); %训练支持向量机分类器
%     check=svmclassify(s,b')  %验证已知样本点
%     err_rate=1-sum(group==check)/length(group) %计算已知样本点的错判率
    solution=svmclassify(s,dd'); %对待判样本点进行分类
end


%% 应用实例(注意特征矩阵行列变换)
% clc, clear
% a0=load('SVM_fenlei.txt'); %把表中x1...x8的所有数据保存在纯文本文件fenlei.txt中
% a=a0'; b0=a(:,1:27); dd0=a(:,28:end); %提取已分类和待分类的数据
% group=[ones(20,1); 2*ones(7,1)]; %已知样本点的类别标号
% s = SVM_fenlei( b0,dd0,group)