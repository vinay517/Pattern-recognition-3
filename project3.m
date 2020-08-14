BankNoteData
feature1 = BankNoteData(:,1,1,1,1)
feature2 = BankNoteData(:,2,1,1,1)
feature3 = BankNoteData(:,3,1,1,1)
feature4 = BankNoteData(:,4,1,1,1)
data = [feature1 feature2 feature3 feature4]
sum1 = 0;
sum2 = 0;
sum3 = 0;
sum4 = 0;
for i = 1:1372
    sum1 = sum1 + feature1(i);
    sum2 = sum2 + feature2(i);
    sum3 = sum3 + feature3(i);
    sum4 = sum4 + feature4(i);
end
mean1 = sum1/1372;
mean2 = sum2/1372;
mean3 = sum3/1372;
mean4 = sum4/1372;



means = [mean1 mean2 mean3 mean4]

var1 = var(feature1);
var2 = var(feature2);
var3 = var(feature3);
var4 = var(feature4);


deviation1 = sqrt(var1);
deviation2 = sqrt(var2);
deviation3 = sqrt(var3);
deviation4 = sqrt(var4);

deviations = [deviation1 deviation2 deviation3 deviation4]
norm1 = (feature1 - mean1)/deviation1;
norm2 = (feature2 - mean2)/deviation2;
norm3 = (feature3 - mean3)/deviation3;    
norm4 = (feature4 - mean4)/deviation4;
Normalization1 = [norm1 norm2 norm3 norm4]
Class = BankNoteData(:,5,1,1,1)
Normalization = [norm1 norm2 norm3 norm4 Class]
reducednorm = Normalization(:,1)>3;
Normalization(reducednorm,:) = [];
reducednorm = Normalization(:,2)>3;
Normalization(reducednorm,:) = [];
reducednorm = Normalization(:,3)>3;
Normalization(reducednorm,:) = [];
reducednorm = Normalization(:,4)>3
Normalization(reducednorm,:) = [];
reducednorm = Normalization(:,1)<-3
Normalization(reducednorm,:) = [];
reducednorm = Normalization(:,2)<-3
Normalization(reducednorm,:) = []
reducednorm = Normalization(:,3)<-3
Normalization(reducednorm,:) = [];
reducednorm = Normalization(:,4)<-3;
Normalization(reducednorm,:) = []
sznorm=size(Normalization)
one=Normalization(:,1)
two=Normalization(:,2)
three=Normalization(:,3)
four=Normalization(:,4)
Classf = Normalization(:,5)
 
prompt = 'select 2 features ';
features = input(prompt)
switch(features)
    case(12)
     
               % for 1 and 2
               figure(1);
            scatter(one(Classf == 1), two(Classf == 1), 25, 'g', '*')
            hold on
            scatter(one(Classf == 0), two(Classf == 0), 25, 'r', '*')
            title('Graph for First and Second Feature')
            xlabel('First Feature')
            ylabel('Second Feature')
            legend('Class 1','Class 0')
    case(13)
            % for 1 and 3
             figure(2);
            scatter(one(Classf == 1), three(Classf == 1), 25, 'g', '*')
            hold on
            scatter(one(Classf == 0), three(Classf == 0), 25, 'r', '*')
            title('Graph for First and Third Feature')
            xlabel('First Feature')
            ylabel('Third Feature')
            legend('Class 1','Class 0')
    case(14)
            % for 1 and 4
            figure(3);
            scatter(one(Classf == 1), four(Classf == 1), 25, 'g', '*')
            hold on
            scatter(one(Classf == 0), four(Classf == 0), 25, 'r', '*')
            title('Graph for First and Fourth Feature')
            xlabel('First Feature')
            ylabel('Fourth Feature')
            legend('Class 1','Class 0')
    
    case(23)
            % for 2 and 3
            figure(4);
            scatter(two(Classf == 1), three(Classf == 1), 25, 'g', '*')
            hold on
            scatter(two(Classf == 0), three(Classf == 0), 25, 'r', '*')
            title('Graph for Second and Third Feature')
            xlabel('Second Feature')
            ylabel('Third Feature')
            legend('Class 1','Class 0')
    case(24)
            figure(5);
            scatter(two(Classf == 1), four(Classf == 1), 25, 'g', '*')
            hold on
            scatter(two(Classf == 0), four(Classf == 0), 25, 'r', '*')
            title('Graph for Second and Fourth Feature')
            xlabel('Second Feature')
            ylabel('Fourth Feature')
            legend('Class 1','Class 0')
       
    case(34)
            figure(6);
            scatter(three(Classf == 1), four(Classf == 1), 25, 'g', '*')
            hold on
            scatter(three(Classf == 0), four(Classf == 0), 25, 'r', '*')
            title('Graph for Third and Fourth Feature')
            xlabel('Third Feature')
            ylabel('Fourth Feature')
            legend('Class 1','Class 0')
end






FinalMatrix=[one two three four]
%to print the covariance of the matrix of the final matrix
Covar=cov(Normalization1)
%to print the eigen values
[EigenVectors,EigenValues]=eig(Covar)
 
%to print the largest two values of the eigen values
Nlargest=EigenVectors(:,3)
Largest=EigenVectors(:,4)

NewFeature1 = Normalization1*Largest;
NewFeature2 = Normalization1*Nlargest;

ReducedFeature = [NewFeature1, NewFeature2]
figure(7);
scatter(NewFeature1(Classf == 1), NewFeature2(Classf == 1), 125, 'g', '*')
axis([-3 3 -3 3])
hold on
scatter(NewFeature1(Classf == 0), NewFeature2(Classf == 0), 125, 'r', '*')
axis([-3 3 -3 3])
title('Graph for 2 reduced features')
xlabel('First Feature')
ylabel('Second Feature')
legend('Class 1','Class 0')

 
a=EigenValues(:,1)
b=EigenValues(:,2)
c=EigenValues(:,3)
d=EigenValues(:,4)
 
 
SquaredError=a+b
 
PercentError=((a+b)/(a+b+c+d))*100 
 
 % project 3rd part to classify a new point into any of the two classes
 
 % to find the mean and standard deviation of 2 new features obtained and
 

tmean1 = mean(NewFeature1);
tmean2 = mean(NewFeature2);
 
tvar1 = var(NewFeature1);
tvar2 = var(NewFeature2);
tdeviation1 = sqrt(tvar1);
tdeviation2 = sqrt(tvar2);

tdeviations = [tdeviation1 tdeviation2];
% normalize the features

tnorm1 = (NewFeature1 - tmean1)/tdeviation1;
tnorm2 = (NewFeature2 - tmean2)/tdeviation2;

% to find the mean of each class

C01Features = NewFeature1(1:762);

C02Features = NewFeature2(1:762);

C11Features = NewFeature1(763:1372);

C12Features = NewFeature2(763:1372);

C0Features = [C01Features C02Features]
C1Features = [C11Features C12Features]
%mean of features in class0
MC0Feature = mean(C0Features);
MC1Feature = mean(C1Features);

MC0Feature1 = MC0Feature(:,1); 
MC0Feature2 = MC0Feature(:,2);

MC1Feature1 = MC1Feature(:,1); 
MC1Feature2 = MC1Feature(:,2);


observation = input('point ');
pnorm1 = (observation(1) - mean1)/deviation1;
pnorm2 = (observation(2) - mean2)/deviation2;
pnorm3 = (observation(3) - mean3)/deviation3;    
pnorm4 = (observation(4) - mean4)/deviation4;

pFinal =[pnorm1 pnorm2 pnorm3 pnorm4];

pNewFeature2=pFinal*Nlargest;

pNewFeature1=pFinal*Largest;

ptnorm1 = (pNewFeature1)/tdeviation1;
ptnorm2 = (pNewFeature2)/tdeviation2;

pointS = [ptnorm1 ptnorm2];
distance0 = pdist2(pointS, MC0Feature);
distance1 = pdist2(pointS, MC1Feature);

if (distance0<distance1)
    
    fprintf('the class of observation is 0');
    
else
     fprintf('the class of observation is 1');
     
end

figure(8);
scatter(NewFeature1(Classf == 1), NewFeature2(Classf == 1), 125, 'g', '*')
axis([-3 3 -3 3])
hold on
scatter(NewFeature1(Classf == 0), NewFeature2(Classf == 0), 125, 'r', '*')
axis([-3 3 -3 3])
scatter(ptnorm1, ptnorm2, 300, 'b', '*')
axis([-3 3 -3 3])
title('Graph for 2 reduced features with new input point')
xlabel('First Feature')
ylabel('Second Feature')
legend('Class 1','Class 0')

    
% to find the recognition rate

Recognition0=0;
Recognition1=0;
for x = 1:1:1372
 l = data(x,:);
qFinal = (l-means)./deviations; 

r1 = qFinal*Largest; r2 = qFinal*Nlargest;
rFinal = [r1, r2];
s1 = r1./tdeviation1;
s2 = r2./tdeviation2;
sFinal = (rFinal)./tdeviations;

d1 = pdist2(sFinal,MC0Feature); d2 = pdist2(sFinal,MC1Feature);


if (d1 < d2)
    N1=0;
   
    if(Class(x) == N1)
        Recognition0=Recognition0+1;
    end
    
else
    N2=1;
    
    
    if(Class(x) == N2)
        Recognition1=Recognition1+1;
    end
end
x = x+1;
end

Recognitionrate1 = ((Recognition0 + Recognition1) / (x-1))*100;

  
