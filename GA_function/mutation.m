%关于编译
%函数说明
%输入变量：pop：二进制种群，pm：变异概率
%输出变量：newpop变异以后的种群
function [newpop] = mutation(pop,pm) % pm变异概率
[px,py] = size(pop);
newpop = ones(size(pop));
for i = 1:px
    if(rand<pm)                     % 变异
        mpoint = round(rand*py);    % 个体的第几个基因变异
        if mpoint <= 0;             % 防止出现0
            mpoint = 1;             % 因为不存在a(i,0)
        end
        newpop(i,:) = pop(i,:);     % 载入选择、交叉变换处理后的种群
        if newpop(i,mpoint) == 0    % 对选取的变异点变异，0变1,1变0
            newpop(i,mpoint) = 1;
        elseif newpop(i,mpoint) == 1
            newpop(i,mpoint) = 0;
        end
    else newpop(i,:) = pop(i,:);    % 不变异
    end
end