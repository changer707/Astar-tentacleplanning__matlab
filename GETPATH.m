% function globalpath=GETPATH(close,start)
% %从终点往回追溯父节点，直至到达起点
% ind=1;
% globalpath=[];
% flagbacktostart=false;
% while ~flagbacktostart 
%     if isequal( close(ind,1:2) , start )
%         flagbacktostart=true;
%         
%     else
%         for i=1:length(close(:,1))
%             if isequal( close(ind,1:2) , close(i,5:6) )
%                ind=i;
%                globalpath=[close(ind,1:2);globalpath];
%                break;
%             end
%         end
%     end
% end
% end
function path=GETPATH(close,start)

ind=1;
path=[];
while 1
    path=[path; close(ind,1:2)];
    if isequal(close(ind,1:2),start)   
        break;
    end
    for io=1:length(close(:,1))
        if isequal(close(io,1:2),close(ind,5:6))
            ind=io;
            break;
        end
    end
end
end