function [circle,long]=modifycircle(c1,L);
% 改良圈算法，求解TSP问题，得出的很可能不是最优解
% 输入：cl-初始圈，在调用时可多设置几个初始圈选最好的，弥补算法缺点
%       L-矩阵宽
% 输出：circle-路径， long-距离
global a
flag=1;
while flag>0
    flag=0;
    for m=1:L-3
        for n=m+2:L-1
            if a(c1(m),c1(n))+a(c1(m+1),c1(n+1))<...
                a(c1(m),c1(m+1))+a(c1(n),c1(n+1))
                flag=1;
                c1(m+1:n)=c1(n:-1:m+1);
            end
        end
    end
end
long=a(c1(1),c1(L));
for i=1:L-1
    long=long+a(c1(i),c1(i+1));
end
circle=c1;

% 调用示例
% clc,clear
% global a
% a=zeros(6);
% a(1,2)=56;a(1,3)=35;a(1,4)=21;a(1,5)=51;a(1,6)=60;
% a(2,3)=21;a(2,4)=57;a(2,5)=78;a(2,6)=70;
% a(3,4)=36;a(3,5)=68;a(3,6)=68; a(4,5)=51;a(4,6)=61;
% a(5,6)=13; a=a+a'; L=size(a,1);
% cir = 50;
% jiec = factorial(L);
% circle = zeros(cir,L);
% long = zeros(1,cir);
% minlong = inf;
% recode = 0;
% b = perms(1:L);   // 该函数L不能太大，求全排列运算量巨大，当城市较多时，随便设计几十个初始圈即可
% b(randperm(jiec, cir),:); // 选初始圈
% for i = 1:cir             // 不同初始圈得出的结果中选择最小的，弥补改良圈算法中得不到最优解的缺点
%     [circle(i,:), long(i)]=modifycircle(b(i,:),L);
%     if(long(i) <= minlong) 
%         minlong = long(i);
%         recode = i;
%     end
% end
% minlong, circle(recode,:)

