function [k,flaglist]=FINDLIST(m,open,close)
k=[];
flaglist=0;
if isempty(open)
    flaglist=2;   %不在openlist中
else
    for j=1:length(close(:,1))
        if isequal(m(1:2),close(j,1:2))
            flaglist=1;         %相邻节点use在closelist中
            return;
        end
    end
    
    for io=1:length(open(:,1))
        if isequal(m(1:2),open(io,1:2))
            flaglist=3;        %相邻节点use在openlist中
            k=io;            %记录下此时的openlist的行号
            return;
        end
    end
    
    if ~flaglist
        flaglist=2;
    end
end
end




