function  [inopenflag,inline]=ISINOPEN(array,open)
inopenflag=false;
inline=0;

if isempty(open)
    inopenflag=false;
end

 for i=1:length(open(:,1))
     if isequal(array(1:2),open(i,1:2))
         inopenflag=true;
         inline=i;
         return;
     end
 end
end