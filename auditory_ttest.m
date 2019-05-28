

trials=size(data.params);
allspikes=data.spikes;

if isequal(size(data.spikes,1),1)
    spikesfortrial=allspikes{1};
    q=3;
else
    spikesfortrial=allspikes;
    q=4;
end

semitonecount=[];
%%%%row 1=semitone diff; all subsequent rows=spike times
for b=1:trials(1)
    trialname=char(data.params(b));
    underscore=strfind(trialname, '_');
    semitone=str2num(trialname(underscore+6:underscore+7));
    semitonecount=[semitonecount, semitone];
end

trialspoint5=sum(semitonecount==1);
trials3=sum(semitonecount==3);
trials5=sum(semitonecount==5);
trials12=sum(semitonecount==12);

trialtypes={('allA');('trialspoint5');('trials3');('trials5');('trials12')};

start1=1;
start2=trialspoint5+1;
start3=start2+trials3+1;
start4=start3+trials5+1;
startA=1;
empty=[];


spikerate=[];
spikeratebaseline=[];


behavioralfile=[filename(3:end-4)];


for a=1:trials(1)
    if isequal(size(spikesfortrial,2), 1)
        behavioralfile
        continue
    elseif isequal(q, 3)
        sortedspikes=spikesfortrial{a,2};
    else
        sortedspikes=spikesfortrial{a,2}';
    end
    trialname=char(data.params(a));
    underscore=strfind(trialname, '_');
    frequency=str2num(trialname(underscore+1:underscore+5));
    semitone=str2num(trialname(underscore+6:underscore+7));
    rate=str2num(trialname(underscore+8:underscore+9));
    repeat=str2num(trialname(underscore+10));
    starttime=data.codes.data(a,3);
    starttimeplus=starttime-.200;

    durationbaseline=.200;
    durationwindowstim=.200;
    
    stoptime=starttime+.2;
    

    
    
    spikeduringstim_logical=sortedspikes; 
    
    stimspikes=sortedspikes; %%(spikeduringstim_logical);
    %     fromstimstart=stimspikes-starttime;
    
    
    baselinestart=stimspikes-starttimeplus;
    
    if ~isempty(stimspikes)
        
         x=[baselinestart];
               
         numberofspikesbaseline=sum(le(x, .2)&ge(x,0));
         spikeratebase=numberofspikesbaseline/.2;
         spikeratebaseline=[spikeratebaseline; spikeratebase];
         
        
        
           x=[baselinestart];
               
         numberofspikes=sum(le(x, .4)&ge(x,.2));
         spikeratestim=numberofspikes/.2;
         spikerate=[spikerate; spikeratestim];
         
         
         
         
    else
        empty=[empty, a];
        continue
    end
    
end
[h p]=ttest2(spikerate, spikeratebaseline, 'Alpha', .05);

tstats=[tstats, h];