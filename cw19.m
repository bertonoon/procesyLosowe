temp = randi([0 1]);
X = zeros(1,100);


if (temp == 0) 
    X(1) = 1;
else
    X(1) = -1;
end

for i=2:1:100
    randi([0 100]);
end