%����任
%���������pop�������Ƶĸ�����Ⱥ����pc������ĸ���
%���������newpop����������Ⱥ��
function [newpop] = crossover(pop,pc)
[px,py] = size(pop);
newpop = ones(size(pop));
for i = 1:2:px-1    % ����������������任
    if(rand<pc)     % �Ƿ񽻲�任
        cpoint = round(rand*py);    % ����任�����
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)];   % ����任���б任
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)]; % ����任���б任���б任��Ҫ��popת�ã������м�Ķ��Ÿ�Ϊ�ֺ�
    else
        newpop(i,:) = pop(i,:);     % ���任������
        newpop(i+1,:) = pop(i+1,:); % ���任������
    end
end