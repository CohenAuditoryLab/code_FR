%%
myKsDir='Z:\Francisco\ToSort_Sly\SLy-180823_b3_A1';
[spikeTimes, spikeAmps, spikeDepths] =ksDriftmap(myKsDir);
plotDriftmap(spikeTimes, spikeAmps, spikeDepths);
title('SLy-180823 b3 A1');
%%
myKsDir='Z:\Francisco\ToSort_Sly\SLy-180823_b3_AL';
[spikeTimes, spikeAmps, spikeDepths] =ksDriftmap(myKsDir);
figure;plotDriftmap(spikeTimes, spikeAmps, spikeDepths);
title('SLy-180823 b3 AL');



%%
%creating trial sound code
load('H:\meta\SLY-180823_meta.mat')
for n=1:length(meta.param)
tempsoundid=meta.param{n};
    [tt,~]=split(tempsoundid,'.');
    if strcmp(tt(3),'C') && strcmp(tt(4),'NS')
            soundid=str2double(tt{5});
    elseif strcmp(tt(3),'C') && strcmp(tt(4),'TS')
            soundid=str2double(tt{5})+20;
    elseif strcmp(tt(3),'L') && strcmp(tt(4),'NS')
            soundid=str2double(tt{5})+40;
    elseif strcmp(tt(3),'R') && strcmp(tt(4),'NS')
            soundid=str2double(tt{5})+50;
    elseif strcmp(tt(3),'C') && strcmp(tt(4),'TX')
            soundid=str2double(tt{5})+60;
    elseif  strcmp(tt(3),'C') && strcmp(tt(4),'TY')
            soundid=str2double(tt{5})+70;
    end
   sound_code(n)=soundid; 
    
end

%%
%%
myKsDir='Z:\Francisco\ToSort_Sly\SLy-180823_b3_AL';
sp = loadKSdir(myKsDir);

%load('H:\meta\SLY-180823_meta.mat')
%%
myKsDir='Z:\Francisco\ToSort_Sly\SLy-180823_b3_A1';
sp = loadKSdir(myKsDir);



%%
eventTimes=meta.trial(:,1)'/24410;
soundTimes=meta.sound(:,1:2)'/24410;
psthViewer(sp.st, sp.clu, soundTimes, [-0.75 4], sound_code);

