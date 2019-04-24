x = -1:0.1:12;
F = zeros(length(x),1);
p3 = 0;
p5 = 0;
p7 = 0;

for i=1:length(x)
   if x(i) > 0 && x(i) <= 5
       F(i) = 0.04*x(i);
   end
   if x(i) > 5 && x(i) <= 10
       F(i) = 0.6 + 0.04*x(i);
   end
   if x(i) > 10
       F(i) = 1;
   end
    
   if x(i) == 5
       p5 = F(i);
   end
   
    if x(i) == 3
       p3 = F(i);
   end
    if x(i) == 7
       p7 = F(i);
   end
    
end
plot(x,F);

1 - p5
p5
p7 - p3

(p7 - p5)/p7
