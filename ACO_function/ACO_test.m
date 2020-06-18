ant = 300;          % ��������
times = 80;         % �ƶ�����
rou = 0.9;          % ��Ϣ�ػӷ�ϵ��
p_transf = 0.2;     % ת�Ƹ��ʳ���
x_l = -1;           % X,Y�ķ�Χ
x_h = 1;
y_l = -1;
y_h = 1;

% pos����Ϣ��
for i = 1:ant
    X(i, 1) = (x_l + (x_h - x_l)*rand);
    X(i, 2) = (y_l + (y_h - y_l)*rand);
    pos(i) = F(X(i, 1), X(i, 2));
end
 
step = 0.05;
f = '-(x.^4 + 3*y.^4 - 0.2*cos(3*pi*x) - 0.4*cos(4*pi*y) + 0.6)';

[x,y] = meshgrid(x_l:step:x_h, y_l:step:y_h);
z = eval(f);
figure;
subplot(1,2,1);
mesh(x,y,z);
hold on;
plot3(X(:, 1), X(:, 2), pos, 'k*');
text(0.1, 0.8, -0.1, '���ϵĳ�ʼ�ֲ�λ��');
xlabel('x');ylabel('y');zlabel('f(x,y)');

for t = 1:times
    lamda = 1/t;
    [pos_best(t), best_index] = max(pos);
    for i = 1:ant
        p(t, i) = (pos(best_index)-pos(i))/pos(best_index);
    end
    for i = 1:ant
        % �ֲ���������������Խ�ߣ��ֲ�������ΧԽС
        if p(t, i) < p_transf
            temp1 = X(i, 1) + (2*rand - 1)*lamda;
            temp2 = X(i, 2) + (2*rand - 1)*lamda;
        % ȫ����������ͬ��Χ���ǲ�ͬ�ķŴ����
        else 
            temp1 = X(i, 1) + (x_h - x_l)*(rand - 0.5);
            temp2 = X(i, 2) + (y_h - y_l)*(rand - 0.5);
        end
        if temp1 < x_l
            temp1 = x_l;
        end
        if temp1 > x_h
            temp1 = x_h;
        end
        if temp2 < y_l
            temp2 = y_l;
        end
        if temp2 > y_h
            temp2 = y_h;
        end
        
        if F(temp1, temp2) > F(X(i,1), X(i,2))
            X(i,1) = temp1;
            X(i,2) = temp2;
        end
    end
    for i = 1:ant
        pos(i) = (1 - rou)*pos(i) + F(X(i,1), X(i,2));
    end
end

subplot(1,2,2);
mesh(x,y,z);
hold on;
x = X(:,1);
y = X(:,2);
plot3(x,y,eval(f),'k*');
hold on;
text(0.1, 0.8 ,-0.1,'���ϵ����շֲ�λ��');
xlabel('x');ylabel('y');zlabel('f(x,y)');

[max_value, max_index] = max(pos);
maxX = X(max_index,1);
maxY = X(max_index,2);
maxvalue = F(X(max_index,1), X(max_index,2));
        
        
        
        
        
        
        
        