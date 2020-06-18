function [ mydistance, mypath ] = myfloyd( a,sb,db );
%	求解图中一点到另一点的最小路径，可以是负权图
%   输入：a-临接矩阵
%         sb-起点的标号，db-终点的标号
%   输出：mydistance-最短路的距离，mypath-最短的路径

n = size(a,1); path = zeros(n);
for k = 1:n
    for i = 1:n
        for j = 1:n
            if a(i,j) > a(i,k)+a(k,j)
                a(i,j) = a(i,k)+a(k,j);
                path(i,j) = k;
            end
        end
    end
end
% 直接返回a(i,j)也行，是每个点到其他点的最短距离（注意将0-0设置为inf）
% path矩阵是其他点到该点最短路径的前驱节点
mydistance = a(sb,db);
parent = path(sb,:); % 从起点sb到终点db的最短路径上各点的前驱点
parent(parent == 0) = sb; % path中的分量为0，表示该顶点的前驱是起点
mypath = db; t = db;
while t~=sb
    p = parent(t); mypath=[p,mypath];
    t = p;
end
end

%% 调用示例
% clc,clear
% a=zeros(5); %邻接矩阵初始化
% a(1,2)=4;a(1,4)=2;
% a(2,3)=4;a(2,4)=1;
% a(3,4)=1;a(3,5)=3;
% a(4,5)=7;
% a=a+a'; % 矩阵转置构成对称阵
% a(a==0)=inf;
% n = 5;
% a([1:n+1:n^2]) = 0; % 将0-0这种点给0值
% path = zeros(n);
% [dis, path] = myfloyd(a, 1, 4)

