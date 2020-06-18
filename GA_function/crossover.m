%交叉变换
%输入变量：pop：二进制的父代种群数，pc：交叉的概率
%输出变量：newpop：交叉后的种群数
function [newpop] = crossover(pop,pc)
[px,py] = size(pop);
newpop = ones(size(pop));
for i = 1:2:px-1    % 相邻两个数做交叉变换
    if(rand<pc)     % 是否交叉变换
        cpoint = round(rand*py);    % 交叉变换点随机
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)];   % 交叉变换，行变换
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)]; % 交叉变换，行变换，列变换需要对pop转置，并将中间的逗号改为分号
    else
        newpop(i,:) = pop(i,:);     % 不变换，保留
        newpop(i+1,:) = pop(i+1,:); % 不变换，保留
    end
end