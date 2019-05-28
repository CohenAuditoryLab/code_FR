function [sr,lts,channels]=get_tnk_info_waveclus(tank)
%get Tank info for waveclus
fid=fopen(tank ,'r');
fread(fid,10,'single');
data=fread(fid,inf,'single');
lts=length(data);
sr=24414.0625;
channels=1;
end

