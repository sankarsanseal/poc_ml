data=dlmread('Iris.txt',',');
X=data(:,1:4);
y=data(:,5);
data=dlmread('Iris_test.txt',',');
Xtest=data(:,1:4);
ytest=data(:,5);
k=7;
n=size(y,1);
ytest_actual=zeros(n,1);
for i = 1:size(Xtest,1)
count=zeros(3,1);
temp=Xtest(i,:);

temp1=repmat(temp,n,1);
diff=sum((X-temp1).^2,2);

[list,ind]=sort(diff);

ylist=y(ind(1:k),1);
	for j = 1:size(ylist,1)
	count(ylist(j),1)=count(ylist(j),1)+1;	

	end
[dummy, class]=max(count);
%fprintf("\n\n***Class of \n");
%temp
%fprintf("is%d\n",class);
ytest_actual(i,1)=class;
end

accu=sum(ytest==ytest_actual)/size(ytest,1)
