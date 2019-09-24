function flag=isobstacle(m,obstacle)
for i=1:length(obstacle(:,1))
    if isequal(m(1:2),obstacle(i,:))
        flag=true;
        return;
    end
end
flag=false;
end

