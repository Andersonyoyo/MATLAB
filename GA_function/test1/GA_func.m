% 利用遗传算法，解决TSP问题模板
tic
clc,clear
% 数据为地球的经纬度，数据奇数列为x，偶数列为y。
% 数据处理
sj = load('datta.txt'); %加载敌方100 个目标的数据
x=sj(:,1:2:8);          % 读取1357列
x=x(:);                 % 将矩阵并为一列
y=sj(:,2:2:8);          % 读取2468列
y=y(:);                 % 将矩阵并为一列
sj=[x y];               % 并为两列

figure(1);
plot(x,y);              % 杂乱的运动轨迹
d1=[0 0];   % 添加起点，从起点出发，最后回到起点
                        % 如果起点在坐标中的，将数组中坐标删除，同时在数组头尾添加该坐标
sj0=[d1;sj;d1];         % 开头结尾加上起点
len = length(sj0);
sj=sj0;
d=zeros(len);
for i=1:len-1
    for j=i+1:len
        temp=((sj(i,1)-sj(j,1))^2 + (sj(i,2)-sj(j,2))^2)^0.5;  % 经纬度转换为地球表面距离
        d(i,j)=(temp);                                                         % 6370为地球半径，单位Km
    end
end
d=d+d';L=len;
% d为处理好的距离矩阵，d+d'将其变为邻接矩阵
w=50;dai=100;
% w为种群个数，dai为迭代次数
%通过改良圈算法选取优良父代A
for k=1:w
    c=randperm(len-2);
    c1=[1,c+1,len];         % 生成初始解
    flag=1;                 
    while flag>0            % 判断适应度
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
    J(k,c1)=1:len;
end
J=J/len;
J(:,1)=0;J(:,len)=1;
rand('state',sum(clock));
%遗传算法实现过程
A=J;
for k=1:dai %产生0～1 间随机数列进行编码
    B=A;
    c=randperm(w);
    %交配产生子代B
    for i=1:2:w
        F=2+floor((len-2)*rand(1));
        temp=B(c(i),F:len);
        B(c(i),F:len)=B(c(i+1),F:len);
        B(c(i+1),F:len)=temp;
    end
    %变异产生子代C
    by=find(rand(1,w)<0.1);
    if isempty(by)
        by=floor(w*rand(1))+1;
    end
    C=A(by,:);
    L3=length(by);
    for j=1:L3
        bw=2+floor((len-2)*rand(1,3));
        bw=sort(bw);
        C(j,:)=C(j,[1:bw(1)-1,bw(2)+1:bw(3),bw(1):bw(2),bw(3)+1:len]);
    end
    G=[A;B;C];
    TL=size(G,1);
    %在父代和子代中选择优良品种作为新的父代
    [dd,IX]=sort(G,2);temp(1:TL)=0;
    for j=1:TL
        for i=1:len-1
            temp(j)=temp(j)+d(IX(j,i),IX(j,i+1));
        end
    end
    [DZ,IZ]=sort(temp);
    A=G(IZ(1:w),:);
end

path=IX(IZ(1),:)                % 最优路径的在sj0中的索引
long=DZ(1)                      % 最优路径的距离
toc
xx=sj0(path,1);yy=sj0(path,2); % 最优路径的坐标
xxyy = [xx yy]
figure(2);
plot(xx,yy,'-o')