% After getting the gradient through gradient_1.m, this model is to find
% the edge of gradient.Firstly with the data in first 2 seconds to build
% the criterion to detektiv the edge

datagroup= [701 5000
    6600 9240
    10656 11656
    16983 18981];


multiplier = 2;

peak = max(gradient(101:700));
for i1 = 1:1:4   
    for j1 = datagroup(i1,1):100:datagroup(i1,2)
        max_gradient = max(gradient(j1:(j1+99)));
        if max_gradient>multiplier*peak
            figure
            plot(data(1, datagroup(i1,1):datagroup(i1,2)),data4(datagroup(i1,1):datagroup(i1,2)),'g',...
                data(1,j1+99),data4(j1+99),'*r');
            break
        end
        
    end
end

      
        
            