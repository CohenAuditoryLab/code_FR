function [TrigA,TrigB]=getting_triggers(filename)
%%
%triggers are at channel 66 xp5
fid=fopen(filename);
fseek(fid,0,'eof'); %running out of RAM so need to look at the length of
%file for the cases were there is only one block STRF+Task
%if thats the case only read 15min of data
filelen=ftell(fid);
frewind(fid);
fread(fid,10,'single');
if filelen<((15*60)*24414.0625) 
triggers=fread(fid,inf,'single');
else 
    triggers=fread(fid,((15*60)*24414.0625),'single');
end
Y=resample(double(triggers),10,1);
[pks,locs,w,p] =findpeaks(diff(Y),'MinPeakHeight',.3);
[T1,T2]=trigfixstrf2(locs',400,899);
TrigA=round(T1/10);
TrigB=round(T2/10);
fclose(fid);
fclose all;
