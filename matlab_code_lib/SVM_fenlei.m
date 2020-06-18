function [ solution ] = SVM_fenlei( b0,dd0,group)
%   �����ݽ��ж����࣬���ݿ����Ƕ�ά�ġ�Ҳ���Բ��Է��������
%   ���룺 b0-ѵ��������
%         dd0-���Լ�����
%         group-ѵ������ǩ�����
%   ����� solution-������

    [b,ps]=mapstd(b0); %�ѷ������ݵı�׼��
    dd=mapstd('apply',dd0,ps); %���������ݵı�׼��
    s=svmtrain(b',group); %ѵ��֧��������������
%     check=svmclassify(s,b')  %��֤��֪������
%     err_rate=1-sum(group==check)/length(group) %������֪������Ĵ�����
    solution=svmclassify(s,dd'); %�Դ�����������з���
end


%% Ӧ��ʵ��(ע�������������б任)
% clc, clear
% a0=load('SVM_fenlei.txt'); %�ѱ���x1...x8���������ݱ����ڴ��ı��ļ�fenlei.txt��
% a=a0'; b0=a(:,1:27); dd0=a(:,28:end); %��ȡ�ѷ���ʹ����������
% group=[ones(20,1); 2*ones(7,1)]; %��֪������������
% s = SVM_fenlei( b0,dd0,group)