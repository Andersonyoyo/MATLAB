% 临接矩阵，400*400中每一行都是第i个点到其他400个点（包括自己）的临接距离，1/1.41。不临接为0
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
                        % 一边相接或者对角相接
                        if im+jn==1||(im==1&&jn==1) 
                            D((i-1)*l+j,(m-1)*l+n)=(im+jn)^0.5; 
                        end 
                    end 
                end 
            end 
        end 
    end 
end