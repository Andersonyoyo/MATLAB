function [ result ] = minuspanTree(a, fp, al)
%	�����С�������������Ȩͼ��
%   ���룺a-�ڽӾ��� 
%       fp-��С���������,��alѡ��'kruskal'ʱ��fp��������������[]��  
%       al-�㷨ѡ��,'prim'��'kruskal'�㷨�������Ӧ�ַ�����ע�⣺ѡ��ͬ�㷨ʱ�������ʼ����ͬ
%   �����result-���У���һ�ڶ���Ϊ���ӵ����㣬������Ϊ�ߵ�Ȩֵ
%   
%   ���������Ҫ���������Ӧʹ�á�prim���������Ҫ���ѡ��'kruskal'
if strcmp(al, 'prim')
    result=[];  
    p=fp;   
    tb=1:length(a);                     % a����
    tb(p)=[];                           % ȥ�����
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

% ����ʾ��1
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

% ����ʾ��2
% clc;clear;
% a=zeros(7);
% a(1,2)=50; a(1,3)=60;
% a(2,4)=65; a(2,5)=40;
% a(3,4)=52;a(3,7)=45;
% a(4,5)=50; a(4,6)=30;a(4,7)=42;
% a(5,6)=70;
% result = minuspanTree(a, 1, 'kruskal')
