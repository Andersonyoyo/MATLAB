% ������
function main() 
clear;
clc;
%��Ⱥ��С
popsize=100;
%�����Ʊ��볤��
chromlength=10;
%�������
pc = 0.5;
%�������
pm = 0.01;
%��ʼ��Ⱥ
pop = initpop(popsize,chromlength);

for i = 1:200
    %������Ӧ��ֵ������ֵ��
    objvalue = cal_objvalue(pop);
    fitvalue = objvalue;
    %ѡ�����
    newpop = selection(pop,fitvalue);
    %�������
    newpop = crossover(newpop,pc);
    %�������
    newpop = mutation(newpop,pm);
    %������Ⱥ
    pop = newpop;
    %Ѱ�����Ž�
    [bestindividual,bestfit] = best(pop,fitvalue);
    x2 = binary2decimal(bestindividual);
%     x1 = binary2decimal(newpop);
%     y1 = cal_objvalue(newpop);
%     if mod(i,10) == 0     % ��ͼ
%         figure;
%         fplot(@(x)10*sin(5*x)+7*abs(x-5)+10,[0 10]);
%         hold on;
%         plot(x1,y1,'*');
%         title(['��������Ϊn=' num2str(i)]);
%         plot(x1,y1,'*');
%     end
end
fprintf('The best X is --->>%5.2f\n',x2);
fprintf('The best Y is --->>%5.2f\n',bestfit);