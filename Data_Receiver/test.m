u = [6;-127;1;2;3;4;5];


for i = 1:7
    if u(i) == -127
        u=[u(i:7);u(1:(i-1))];
        break
    end
end