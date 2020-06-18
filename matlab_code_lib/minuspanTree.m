function [ result ] = minuspanTree(a, fp, al)
%	求解最小生成树（无向带权图）
%   输入：a-邻接矩阵； 
%       fp-最小生成树起点,当al选择'kruskal'时，fp填入任意数或者[]；  
%       al-算法选择,'prim'和'kruskal'算法，输入对应字符串。注意：选择不同算法时，矩阵初始化不同
%   输出：result-三行，第一第二行为连接的两点，第三行为边的权值
%   
%   对于有起点要求的生成树应使用‘prim’，无起点要求的选用'kruskal'
if strcmp(al, 'prim')
    result=[];  
    p=fp;   
    tb=1:length(a);                     % a个点
    tb(p)=[];                           % 去除起点
    while length(result)~=length(a)-1
        temp=a(p,tb);
        temp=temp(:);
        d=min(temp);
        [jb,kb]=find(a(p,tb)==d);
        j=p(jb(1));k=tb(kb(1));
        result=[result,[j;k;d]];
        p=[p,k];
        tb(find(tb==k))=[];
    end

else if strcmp(al, 'kruskal')
    [i,j,b]=find(a);
    data=[i';j';b'];index=data(1:2,:);
    loop=max(size(a))-1;
    result=[];
    while length(result)<loop
        temp=min(data(3,:));
        flag=find(data(3,:)==temp);
        flag=flag(1);
        v1=index(1,flag);v2=index(2,flag);
        if v1~=v2
            result=[result,data(:,flag)];
        end
        index(find(index==v2))=v1;
        data(:,flag)=[];
        index(:,flag)=[];
    end
    end
end
end

% 调用示例1
% clc;clear;
% a=zeros(7);
% a(1,2)=50; a(1,3)=60;
% a(2,4)=65; a(2,5)=40;
% a(3,4)=52;a(3,7)=45;
% a(4,5)=50; a(4,6)=30;a(4,7)=42;
% a(5,6)=70;
% a=a+a';a(find(a==0))=inf;
% result = minuspanTree(a, 4,'prim');
% result

% 调用示例2
% clc;clear;
% a=zeros(7);
% a(1,2)=50; a(1,3)=60;
% a(2,4)=65; a(2,5)=40;
% a(3,4)=52;a(3,7)=45;
% a(4,5)=50; a(4,6)=30;a(4,7)=42;
% a(5,6)=70;
% result = minuspanTree(a, 1, 'kruskal')
