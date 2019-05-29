x = zeros(100,200);
for j=1:100
    if rand(1) > 0.5
        x(j,1) = 1;
    else
        x(j,1) = -1;
    end
end
for j=1:100
    for i=2:200
        r = rand(1);
        if x(j,i-1) == 1
            if r < 0.1
                x(j,i) = -1;
            else
                x(j,i) = 1;
            end
        else
            if r < 0.1
                x(j,i) = 1;
            else
                x(j,i) = -1;
            end
        end
    end
end
figure(1)
plot(x);

% time averaging
Rx = zeros(100,1);
for i=1:100
   temp = 0;
   for j=1:100
       temp = temp + x(1,j)*x(1,i + j);
   end
   Rx(i) = temp/100;
end
figure(2);
plot(Rx);

% ensemble averaging
Rx = zeros(100,1);
for i=1:100
   temp = 0;
   for j=1:100
       temp = temp + x(j,100)*x(j,i + 100);
   end
   Rx(i) = temp/100;
end
hold on
plot(Rx);
legend('Time averaging','Ensemble averaging');
hold off







