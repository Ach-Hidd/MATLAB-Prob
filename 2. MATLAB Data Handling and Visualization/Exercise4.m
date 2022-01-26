%% 1
RGB= imread('melbourne_circuit.jpg'); 
h= figure('Name','circult');
p= gobjects(2,2);
for piter = 1:numel(p)
    p(piter) = subplot(2,2,piter);
end

%% 2
melbourne= imread('melbourne_circuit.jpg');
axes(p(1)); imshow(melbourne);axis off

%% 3
blue(:,:,1)=0; blue(:,:,2)=0;blue(:,:,3)=255;
white(:,:,1)=255;white(:,:,2)=255;white(:,:,3)=255;
for m=1:240
    for n=1:320                   
        if melbourne(m,n,1)~= 0 || melbourne(m,n,2)~= 0 || melbourne(m,n,3)>255 || melbourne(m,n,3)<250
            melbourne(m,n,:)=white;
        end
    end
end
axes(p(2)); imshow(melbourne);axis off

array = logical(zeros(240,320)); 
array(:,:,2)=array; array(:,:,3)=array(:,:,1);
array(:,:,1)= (melbourne(:,:,1)==0);
array(:,:,2)= (melbourne(:,:,2)==0);
array(:,:,3)= ((melbourne(:,:,3)>249) & (melbourne(:,:,3)<256));
axes(p(3)); spy(array(:,:,2)); axis off

%% 4
[row,col,v] = find(melbourne);
csvwrite('god.csv',melbourne,row,col);
