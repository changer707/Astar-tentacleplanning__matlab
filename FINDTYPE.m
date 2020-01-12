function [typeflag,inc]=FINDTYPE(m,open,close)
typeflag=0;
inc=0;
%假如open为空
if isempty(open)
    typeflag=2;
end

%检查是否在close中(close不为空）
for i=1:length(close(:,1))
    if isequal( m(1:2) , close(i,1:2) )
        typeflag=1;
        return;
    end
end

%检查是否在open中
for j=1:length(open(:,1))
    if isequal( m(1:2) , open(j,1:2) )
        typeflag=3;%在open中
        inc=j;
        return;
    else
        typeflag=2;%不在open中
    end    
end
end

