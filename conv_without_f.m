function z = conv_without_f(a,b)
    a1=length(a);
    a2=length(b);
    x=[a, zeros(1,a2)];
    y=[b, zeros(1,a1)];
    for i=1: (a1+a2-1)
        z(i)=0;
        for i1=1:a1
            if(i-i1+1)>0;
                z(i)=z(i)+x(i1)*y(i-i1+1);
            end
        end
    end