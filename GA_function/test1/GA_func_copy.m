% �����Ŵ��㷨�����TSP����ģ��
tic
clc,clear
% ����Ϊ����ľ�γ�ȣ�����������Ϊx��ż����Ϊy��
% ���ݴ���
sj = load('datta_copy.txt'); %���صз�100 ��Ŀ�������
x=sj(:,1:2:8);          % ��ȡ1357��
x=x(:);                 % ������Ϊһ��
y=sj(:,2:2:8);          % ��ȡ2468��
y=y(:);                 % ������Ϊһ��
sj=[x y];               % ��Ϊ����

% figure(1);
% plot(x,y);              % ���ҵ��˶��켣
d1=[30,30];   % �����㣬�������������ص����
                        % �������������еģ�������������ɾ����ͬʱ������ͷβ��Ӹ�����
sj0=[d1;sj;d1];         % ��ͷ��β�������
len = length(sj0);
%�������d
% ���ǵ�������
sj=sj0*pi/180;          % ��λ���ɻ���
d=zeros(102);
for i=1:101
    for j=i+1:102
        temp=cos(sj(i,1)-sj(j,1))*cos(sj(i,2))*cos(sj(j,2))+sin(sj(i,2))*sin(sj(j,2));  % ��γ��ת��Ϊ����������
        d(i,j)=6370*acos(temp);                                                         % 6370Ϊ����뾶����λKm
    end
end
d=d+d';L=102;
% dΪ����õľ������d+d'�����Ϊ�ڽӾ���
w=50;dai=100;
% wΪ��Ⱥ������daiΪ��������
%ͨ������Ȧ�㷨ѡȡ��������A
for k=1:w
    c=randperm(100);
    c1=[1,c+1,102];         % ���ɳ�ʼ��
    flag=1;                 
    while flag>0            % �ж���Ӧ��
        flag=0;
        for m=1:L-3
            for n=m+2:L-1
                if d(c1(m),c1(n)) + d(c1(m+1),c1(n+1)) < d(c1(m),c1(m+1)) + d(c1(n),c1(n+1))
                    flag=1;
                    c1(m+1:n)=c1(n:-1:m+1);
                end
            end
        end
    end
    J(k,c1)=1:102;
end
J=J/102;
J(:,1)=0;J(:,102)=1;
rand('state',sum(clock));
%�Ŵ��㷨ʵ�ֹ���
A=J;
for k=1:dai %����0��1 ��������н��б���
    B=A;
    c=randperm(w);
    %��������Ӵ�B
    for i=1:2:w
        F=2+floor(100*rand(1));
        temp=B(c(i),F:102);
        B(c(i),F:102)=B(c(i+1),F:102);
        B(c(i+1),F:102)=temp;
    end
    %��������Ӵ�C
    by=find(rand(1,w)<0.1);
    if isempty(by)
        by=floor(w*rand(1))+1;
    end
    C=A(by,:);
    L3=length(by);
    for j=1:L3
        bw=2+floor(100*rand(1,3));
        bw=sort(bw);
        C(j,:)=C(j,[1:bw(1)-1,bw(2)+1:bw(3),bw(1):bw(2),bw(3)+1:102]);
    end
    G=[A;B;C];
    TL=size(G,1);
    %�ڸ������Ӵ���ѡ������Ʒ����Ϊ�µĸ���
    [~,IX]=sort(G,2);temp(1:TL)=0;
    for j=1:TL
        for i=1:101
            temp(j)=temp(j)+d(IX(j,i),IX(j,i+1));
        end
    end
    [DZ,IZ]=sort(temp);
    A=G(IZ(1:w),:);
end
path=IX(IZ(1),:);                % ����·������sj0�е�����
long=DZ(1);                      % ����·���ľ���
xx=sj0(path,1);yy=sj0(path,2); % ����·��������
figure
plot(xx, yy, '-o')
long
