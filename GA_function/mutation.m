%���ڱ���
%����˵��
%���������pop����������Ⱥ��pm���������
%���������newpop�����Ժ����Ⱥ
function [newpop] = mutation(pop,pm) % pm�������
[px,py] = size(pop);
newpop = ones(size(pop));
for i = 1:px
    if(rand<pm)                     % ����
        mpoint = round(rand*py);    % ����ĵڼ����������
        if mpoint <= 0;             % ��ֹ����0
            mpoint = 1;             % ��Ϊ������a(i,0)
        end
        newpop(i,:) = pop(i,:);     % ����ѡ�񡢽���任��������Ⱥ
        if newpop(i,mpoint) == 0    % ��ѡȡ�ı������죬0��1,1��0
            newpop(i,mpoint) = 1;
        elseif newpop(i,mpoint) == 1
            newpop(i,mpoint) = 0;
        end
    else newpop(i,:) = pop(i,:);    % ������
    end
end