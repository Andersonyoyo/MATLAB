%如何选择新的个体
%输入变量：pop二进制种群，fitvalue：适应度值
%输出变量：newpop选择以后的二进制种群
function [newpop] = selection(pop,fitvalue)
%构造轮盘
[px,py] = size(pop);
totalfit = sum(fitvalue);
p_fitvalue = fitvalue/totalfit;
p_fitvalue = cumsum(p_fitvalue);%概率求和排序
ms = sort(rand(px,1));%生成px个随机数从小到大排列
fitin = 1;
newin = 1;
% 此处模拟轮盘法选取有较高适应度的值
% 可能会出现一个适应度高的值被选中多次，因为要满足总数100
% 被淘汰的值需要填补，所以适应度高的值就会被多选
% 因为使用轮盘赌法，适应度高的值只是被选中的概率高而已
while newin<=px
    if(ms(newin))<p_fitvalue(fitin)  % 判断适应度
        newpop(newin,:)=pop(fitin,:);% 适应度高就保留 
        newin = newin+1;             
    else                             % 适应度低就看下一个值的适应度
        fitin=fitin+1;
    end
end