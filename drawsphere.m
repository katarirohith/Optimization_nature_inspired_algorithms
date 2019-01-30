function drawsphere()
x = [-30:0.5:30];
y = x;
[X,Y]=meshgrid(x,y);
[row,col]=size(X);
    for l=1:col
    for h = 1:row
        z(h,l) = sphere([X(h,l),Y(h,l)]);
    end
    end
    disp(z)
   surfc(X,Y,z);
   shading interp