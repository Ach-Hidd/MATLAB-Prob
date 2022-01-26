%% 1
doc magic;
%% 2
A=magic(3);
%% 3
b=(10:10:30)';
%% 4a
tic
x=inv(A)*b;
toc
%% 4b
tic
x=A\b;
toc %faster
%% 5
A= sort(reshape((A.^2),[numel(A),1]));
%% 6
B=zeros(3,3);
B(:)=2:2:2*numel(B);
%% 7
B_subs=B;B_lin=B;B_log=B;
[x,y]=size(B_subs);
for i=1:x
    for j=1:y
        if(mod(B_subs(i,j),4)==0)
            B_subs(i,j)=B_subs(i,j)/4;
        end
    end
end

for i=1:numel(B)
    if(mod(B_lin(i),4)==0)
        B_lin(i)=B_lin(i)/4;
    end
end

B_log((mod(B_log,4)==0))/4;
