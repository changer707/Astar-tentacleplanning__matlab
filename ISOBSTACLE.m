function isobstacle=ISOBSTACLE(m,obstacle)
isobstacle=false;
for i=1:length(obstacle(:,1))
    if isequal(m(1:2),obstacle(i,1:2))
        isobstacle=true;
        return;
    end
end
end

    