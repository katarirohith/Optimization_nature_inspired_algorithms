function val=cigar(x)
val=x(1)^2;
n=size(x,2);
for i=2:n
    val=val+(10^6)*x(i)^2;
end
%x from [-5 5]
