#pkg load symbolic
#syms x y
#result = solve(x^2 + y -1 == 0, x, y);
#result

#function y = f (x)
#  y = 2*x(1)^2 + x(1)*x(2) + x(2)^2;
#endfunction

#[x, fval, info ] = fsolve(@f, [1;2])


pkg load symbolic
syms x y real

# 0710310542 
# After replacing 0 by 3 -> 3713313542

polynomial = 3*x^3 - 7*(x^2)*y + x*y^2 - 3*y^3 + 3*x^2 - x*y + 3*y^2 - 5*x + 4*y - 2

function _pol = pol_f (x,y)
  _pol = 3*x^3 - 7*(x^2)*y + x*y^2 - 3*y^3 + 3*x^2 - x*y + 3*y^2 - 5*x + 4*y - 2;
endfunction


#dx = diff(polynomial, x)
dx = 9*x^2 - 14*x*y + y^2 + 6*x - y -5
#dy = diff(polynomial, y)
dy = -7*x^2 + 2*x*y -9*y^2 -x +6*y + 4


d = solve(dx == 0, dy == 0, x, y)

x(1) = double(d{1}.x), y(1) = double(d{1}.y), z(1) = double(pol_f(double(d{1}.x), double(d{1}.y)));
x(2) = double(d{2}.x), y(2) = double(d{2}.y), z(2) = double(pol_f(double(d{2}.x), double(d{1}.y)));
x(3) = double(d{3}.x), y(3) = double(d{3}.y), z(3) = double(pol_f(double(d{3}.x), double(d{2}.y)));
x(4) = double(d{4}.x), y(4) = double(d{4}.y), z(4) = double(pol_f(double(d{4}.x), double(d{3}.y)));


printf("Critical Points: \n");
printf("x1: %d, y1= %d, z1 = %d \n", double(d{1}.x), double(d{1}.y), double(pol_f(double(d{1}.x), double(d{1}.y))));
printf("x2: %d, y2= %d, z2 = %d \n", double(d{2}.x), double(d{2}.y), double(pol_f(double(d{2}.x), double(d{1}.y))));
printf("x3: %d, y3= %d, z3 = %d \n", double(d{3}.x), double(d{3}.y), double(pol_f(double(d{3}.x), double(d{2}.y))));
printf("x4: %d, y4= %d, z4 = %d \n", double(d{4}.x), double(d{4}.y), double(pol_f(double(d{4}.x), double(d{3}.y))));


# Second order derivatives
dxx = 18*x - 14*y + 6
dyy = 2*x - 18*y +6
dxy = -14*x +2*y -1
dyx = -14*x +2*y -1

function res = dxx (x,y)
  res = 18*x - 14*y + 6;
endfunction

function res = dxy (x,y)
  res = -14*x +2*y -1;
endfunction

function res = dyx (x,y)
  res = -14*x +2*y -1;
endfunction

function res = dyy (x,y)
  res = 2*x - 18*y +6;
endfunction



# Determine whether critical points correspond to a maximum,minimum or a saddle point.
for i = 1:4,
  # Hessian matrix
  H = [dxx(x(i),y(i)) dxy(x(i),y(i)); dyx(x(i),y(i)) dyy(x(i),y(i))];
  # Eigen values of Hessian matrix
  eig_H = eig(H);

  printf("x: %d, y= %d, z = %d \n", double(x(i)) ,double(y(i)) ,double(z(i)));
  if eig_H(1) > 0 && eig_H(2) > 0,
    disp("Local minimum point\n");
  elseif eig_H(1) < 0 && eig_H(2) < 0,
    disp("Local Maximum point\n");
  else
    disp("Saddle point\n");
  end;
end;