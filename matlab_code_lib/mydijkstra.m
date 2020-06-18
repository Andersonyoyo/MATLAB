function [ mydistance, mypath ] = mydijkstra( a,sb,db )
%	���ͼ��һ�㵽��һ�����С·����̰���㷨�����ܱ�֤���Ž�
%   ���룺a-�ٽӾ��󣨿���������ͼ��
%         sb-���ı�ţ�db-�յ�ı��
%   �����mydistance-���·�ľ��룬mypath-��̵�·��

n = size(a,1); visited(1:n) = 0;
distance(1:n) = inf;                    % ������㵽���������̾���
distance(sb) = 0; parent(1:n) = 0;
for i = 1: n-1
    temp=distance;
    id1=find(visited==1);               %�����Ѿ���ŵĵ�
    temp(id1)=inf;                      %�ѱ�ŵ�ľ��뻻������
    [t, u] = min(temp);                 %�ұ��ֵ��С�Ķ���
    visited(u) = 1;                     %����Ѿ���ŵĶ���
    id2=find(visited==0);               %����δ��ŵĶ���
    for v = id2
        if a(u, v) + distance(u) < distance(v)
            distance(v) = distance(u) + a(u, v); %�޸ı��ֵ
            parent(v) = u;
        end
    end
end
mypath = [];
if parent(db) ~= 0                      %�������·!
    t = db; mypath = [db];
    while t ~= sb
        p = parent(t);
        mypath = [p mypath];
        t = p;
    end
end
mydistance = distance(db);
return
end

