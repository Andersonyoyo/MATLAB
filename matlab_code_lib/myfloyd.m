function [ mydistance, mypath ] = myfloyd( a,sb,db );
%	���ͼ��һ�㵽��һ�����С·���������Ǹ�Ȩͼ
%   ���룺a-�ٽӾ���
%         sb-���ı�ţ�db-�յ�ı��
%   �����mydistance-���·�ľ��룬mypath-��̵�·��

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
% ֱ�ӷ���a(i,j)Ҳ�У���ÿ���㵽���������̾��루ע�⽫0-0����Ϊinf��
% path�����������㵽�õ����·����ǰ���ڵ�
mydistance = a(sb,db);
parent = path(sb,:); % �����sb���յ�db�����·���ϸ����ǰ����
parent(parent == 0) = sb; % path�еķ���Ϊ0����ʾ�ö����ǰ�������
mypath = db; t = db;
while t~=sb
    p = parent(t); mypath=[p,mypath];
    t = p;
end
end

%% ����ʾ��
% clc,clear
% a=zeros(5); %�ڽӾ����ʼ��
% a(1,2)=4;a(1,4)=2;
% a(2,3)=4;a(2,4)=1;
% a(3,4)=1;a(3,5)=3;
% a(4,5)=7;
% a=a+a'; % ����ת�ù��ɶԳ���
% a(a==0)=inf;
% n = 5;
% a([1:n+1:n^2]) = 0; % ��0-0���ֵ��0ֵ
% path = zeros(n);
% [dis, path] = myfloyd(a, 1, 4)

