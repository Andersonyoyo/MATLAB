% �ٽӾ���400*400��ÿһ�ж��ǵ�i���㵽����400���㣨�����Լ������ٽӾ��룬1/1.41�����ٽ�Ϊ0
function D=G2D(G) 
l=size(G,1); 
D=zeros(l*l,l*l); 
for i=1:l 
    for j=1:l 
        if G(i,j)==0 
            for m=1:l 
                for n=1:l 
                    if G(m,n)==0 
                        im=abs(i-m);jn=abs(j-n); 
                        % һ����ӻ��߶Խ����
                        if im+jn==1||(im==1&&jn==1) 
                            D((i-1)*l+j,(m-1)*l+n)=(im+jn)^0.5; 
                        end 
                    end 
                end 
            end 
        end 
    end 
end