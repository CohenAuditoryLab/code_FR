
function merging_meta_spikes_data(meta_file,data_path)
% %Get meta file
% load('H:\meta\SLY-180823_meta.mat')
% data = TDTbin2mat('D:\SpikeSortingPipeline\Tanks_192ch\Sly-180823\Block-3',...
%     'TYPE', {'epocs', 'snips', 'scalars'}, 'SORTNAME', 'TankSort',...
%     'CHANNEL', 0, 'NODATA', 1);

%load('H:\meta\SLY-180817_meta.mat')
load(meta_file); %#ok<LOAD>
data = TDTbin2mat(data_path,...
    'TYPE', {'epocs', 'snips', 'scalars'}, 'SORTNAME', 'TankSort',...
    'CHANNEL', 0, 'NODATA', 1);

% data = TDTbin2mat('D:\SpikeSortingPipeline\Tanks_192ch\Sly-180817\Block-1',...
%     'TYPE', {'epocs', 'snips', 'scalars'}, 'SORTNAME', 'TankSort',...
%     'CHANNEL', 0, 'NODATA', 1);
%load tank all channels
data.Fs=data(1).snips.eeNu.fs;
Fs=data.Fs;
%creating array per preamp each 96 channels
%for 'XPZ2'
    index_ch=find(data.snips.eeN1.chan>32); %channels 33-128 xpz2
    dataxpz2=data.snips.eeN1.ts(index_ch);
    dataxpz2_ch=data.snips.eeN1.chan(index_ch)-32;
%for 'XPZ5;    
    dataxpz5=data.snips.eeNu.ts;
    dataxpz5_ch=data.snips.eeNu.chan;
    index_ch=find(data.snips.eeN1.chan<33); %channels 1-32 xpz2
    dataxpz5_ch2=data.snips.eeN1.chan(index_ch)+64;
    dataxpz5_2=data.snips.eeN1.ts(index_ch);
    
dataxpz5=[dataxpz5; dataxpz5_2];
dataxpz5_ch=[dataxpz5_ch; dataxpz5_ch2];
clear index_ch dataxpz5_2 dataxpz5_ch2 

%%
conta=1;
for n=1:length(meta.trial)
    clc;disp(n)
    %creating sound identifier
       %need to split param here and asign a value
%     Normal Sound 1-20 NS
%     Texture 1-20 TS
%     Left 1-10 L.NS
%     right 1-10 R.NS
%     big room 1-10 C.Tx
%     small room 1-10 c.Ty
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
 channels=unique(dataxpz5_ch);
    %finding spikes during sound of trial per cluster
    for m=1:length(channels)
        index_ch=find(dataxpz5_ch==m);
        ts_temp=dataxpz5(index_ch)*Fs; %time sec changed to samples?
        index=find(ts_temp>meta.sound(n,1) & ts_temp<meta.sound(n,2)); 
        
    if ~isempty(index)    
    %Getting spikes per cluster or cell
        spiketemp=(ts_temp(index)'-meta.sound(n,1))/Fs;%aligning to beginning of sound and converting to time
        counting_w=((meta.sound(n,2)-meta.sound(n,1))/Fs)*1000;
        if counting_w<3000
            spikecount=nan;
            spikerate=nan;
            spikevar=nan;
        else
        spikecount=length(spiketemp);
        spikerate=length(spiketemp)/4000; %spike rate
        spikevar=var(spiketemp);
        end
        %trial, sound ID, unit, spikerate
        spikesxpz2(conta,:)=[n soundid m spikerate spikecount spikevar];
        spikes_raw_xpz2{conta,:}=spiketemp;
    else
         spikesxpz2(conta,:)=[n soundid m nan nan nan];
         spikes_raw_xpz2{conta,:}=nan;
    end
    conta=conta+1;
    end
        %spikes{n}=temp; clear temp

end
%%
conta=1;
for n=1:length(meta.trial)
    clc;disp(n)
    %creating sound identifier
       %need to split param here and asign a value
%     Normal Sound 1-20 NS
%     Texture 1-20 TS
%     Left 1-10 L.NS
%     right 1-10 R.NS
%     big room 1-10 C.Tx
%     small room 1-10 c.Ty
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
 channels=unique(dataxpz2_ch);
    %finding spikes during sound of trial per cluster
    for m=1:length(channels)
        index_ch=find(dataxpz2_ch==m);
        ts_temp=dataxpz2(index_ch)*Fs; %time sec changed to samples?
        index=find(ts_temp>meta.sound(n,1) & ts_temp<meta.sound(n,2)); 
        
    if ~isempty(index)    
    %Getting spikes per cluster or cell
        spiketemp=(ts_temp(index)'-meta.sound(n,1))/Fs;%aligning to beginning of sound and converting to time
        counting_w=((meta.sound(n,2)-meta.sound(n,1))/Fs)*1000;
        if counting_w<3000
            spikecount=nan;
            spikerate=nan;
            spikevar=nan;
        else
        spikecount=length(spiketemp);
        spikerate=length(spiketemp)/4000; %spike rate
        spikevar=var(spiketemp);
        end
        %trial, sound ID, unit, spikerate spikecount spikevar]
        spikesxpz5(conta,:)=[n soundid m spikerate spikecount spikevar];
        spikes_raw_xpz5{conta,:}=spiketemp;
    else
         spikesxpz5(conta,:)=[n soundid m NaN NaN NaN];
         spikes_raw_xpz5{conta,:}=NaN;
    end
    conta=conta+1;
    end
        %spikes{n}=temp; clear temp

end
%%


save([meta_file(end-18:end-9) '_spikes'],'spikesxpz5','spikesxpz2','spikes_raw_xpz5','spikes_raw_xpz2');
%!c:\work\libsvm\windows\svm-scale -l -1 -u 1 -s range C:\work\code_Fr\classifier\sp_sparse.txt > C:\work\code_Fr\classifier\sp_sparse_scaled.txt


