 clear all
clc

ff = 'sphere';
dim = 2; 
c1 = 0.01;
c2 = 0.2;
C = 1;
maxiter = 200;
popsize = 500;
pop = rand(popsize,dim);
vel = rand(popsize,dim);
cost = feval(ff,pop);
pbcost = cost;
pb = pop;
z = min(cost);
globalmin = min(cost);
[pgcost,indx] = min(cost);
pg = pop(indx,:);

i = 0;
while i < maxiter
    i = i+1;
    w=(maxiter-i)/maxiter;
    r1 = rand(popsize,dim); 
    r2 = rand(popsize,dim); 
    vel = C*w*vel + c1 *r1.*(pb-pop) + c2*r2.*(ones(popsize,1)*pg-pop);
    pop = pop + vel;
    overlimit=pop<=5;
    underlimit=pop>=-5;
    pop=pop.*overlimit+not(overlimit);
    pop=pop.*underlimit;
    
    cost = feval(ff,pop);
    bettercost = cost < pbcost;
    pbcost = pbcost.*not(bettercost) + cost.*bettercost;
    pb(bettercost,:) = pop(bettercost,:);
    [temp, t] = min(pbcost);
   
    if temp<pgcost
        pg=pop(t,:); 
        indx=t;
        pgcost=temp;
    end
    
    [i pg pgcost]
    z(i+1)= min(cost);
    globalmin(i+1)=pgcost;
    
end
%disp(z)
disp(globalmin)
%figure(24)
i=0:length(z)-1;
plot(i,z,i,globalmin);
xlabel('generation');ylabel('cost');

