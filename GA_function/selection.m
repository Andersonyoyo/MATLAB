%���ѡ���µĸ���
%���������pop��������Ⱥ��fitvalue����Ӧ��ֵ
%���������newpopѡ���Ժ�Ķ�������Ⱥ
function [newpop] = selection(pop,fitvalue)
%��������
[px,py] = size(pop);
totalfit = sum(fitvalue);
p_fitvalue = fitvalue/totalfit;
p_fitvalue = cumsum(p_fitvalue);%�����������
ms = sort(rand(px,1));%����px���������С��������
fitin = 1;
newin = 1;
% �˴�ģ�����̷�ѡȡ�нϸ���Ӧ�ȵ�ֵ
% ���ܻ����һ����Ӧ�ȸߵ�ֵ��ѡ�ж�Σ���ΪҪ��������100
% ����̭��ֵ��Ҫ���������Ӧ�ȸߵ�ֵ�ͻᱻ��ѡ
% ��Ϊʹ�����̶ķ�����Ӧ�ȸߵ�ֵֻ�Ǳ�ѡ�еĸ��ʸ߶���
while newin<=px
    if(ms(newin))<p_fitvalue(fitin)  % �ж���Ӧ��
        newpop(newin,:)=pop(fitin,:);% ��Ӧ�ȸ߾ͱ��� 
        newin = newin+1;             
    else                             % ��Ӧ�ȵ;Ϳ���һ��ֵ����Ӧ��
        fitin=fitin+1;
    end
end