%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% st: first column is the spike time in samples
%     second column is the spike template 
%     third column is the extracted amplitude
%     fifth column is the post auto-merge cluster (if you run the auto-merger).
% meta = 
%        trial: [823x10 double] first 2 are trial time
%        sound: [823x3 double]
%         info: [1x1 struct]
%        param: {1x823 cell}
%        error: [823x2 double]
%     joystick: [823x10 double]
conta=1;
%Possible clusters

%Getting times from meta.sound all in samples
load('F:\SpikeSortingPipeline\Sorted\SAM-170818_Block-1meta.mat');
%load('F:\SpikeSortingPipeline\Sorted\SAM-170818_Block-1\KiloSort_AL\rez_AL.mat')
load('F:\SpikeSortingPipeline\Sorted\SAM-170818_Block-1\KiloSort_ML\rez_ML.mat');
meta_files={'F:\SpikeSortingPipeline\Sorted\SAM-170807_Block-1meta.mat',...
    'F:\SpikeSortingPipeline\Sorted\SAM-170809_Block-1meta.mat',...
'F:\SpikeSortingPipeline\Sorted\SAM-170811_Block-1meta.mat',...
'F:\SpikeSortingPipeline\Sorted\SAM-170817_Block-1meta.mat'};


rez_files={'F:\SpikeSortingPipeline\Sorted\SAM-170807_Block-1\KiloSort_AL\rez_AL.mat',...
    'F:\SpikeSortingPipeline\Sorted\SAM-170809_Block-1\KiloSort_AL\rez_AL.mat',...
    'F:\SpikeSortingPipeline\Sorted\SAM-170811_Block-1\KiloSort_AL\rez_AL.mat',...
    'F:\SpikeSortingPipeline\Sorted\SAM-170817_Block-1\KiloSort_AL\rez_AL.mat'};

rez_files2={'F:\SpikeSortingPipeline\Sorted\SAM-170807_Block-1\KiloSort_ML\rez_ML.mat',...
    'F:\SpikeSortingPipeline\Sorted\SAM-170809_Block-1\KiloSort_ML\rez_ML.mat',...
    'F:\SpikeSortingPipeline\Sorted\SAM-170811_Block-1\KiloSort_ML\rez_ML.mat',...
    'F:\SpikeSortingPipeline\Sorted\SAM-170817_Block-1\KiloSort_ML\rez_ML.mat'};

save_filesml={'SAM-170807_ML.mat',...
    'SAM-170809_ML.mat',...
    'SAM-170811_ML.mat',...
    'SAM-170817_ML.mat'};
save_filesal={'SAM-170807_AL.mat',...
    'SAM-170809_AL.mat',...
    'SAM-170811_AL.mat',...
    'SAM-170817_AL.mat'};


for z=1:length(meta_files)
load(meta_files{z});
load(rez_files{z});

cluster=unique(rez_merged.st3(:,5));
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
 
    %finding spikes during sound of trial per cluster
    for m=1:length(cluster)
        index=find(rez_merged.st3(:,1)>meta.sound(n,1) & rez_merged.st3(:,1)<meta.sound(n,2) & rez_merged.st3(:,5)==cluster(m));
    if ~isempty(index)    
    %Getting spikes per cluster or cell
        spiketemp=(rez_merged.st3(index)'-meta.sound(n,1))/rez_merged.ops.fs;%aligning to beginning of sound and converting to time
        spiketemp=length(spiketemp)/4000;
        %trial, sound ID, unit, spikerate
        spikes(conta,:)=[n soundid cluster(m) spiketemp];
    else
         spikes(conta,:)=[n soundid cluster(m) nan];
    end
    conta=conta+1;
    end
        %spikes{n}=temp; clear temp

end
%save('SAM-170818_AL.mat','spikes');
save(save_filesal{z},'spikes');


load(rez_files2{z});
cluster=unique(rez_merged.st3(:,5));
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
 
    %finding spikes during sound of trial per cluster
    for m=1:length(cluster)
        index=find(rez_merged.st3(:,1)>meta.sound(n,1) & rez_merged.st3(:,1)<meta.sound(n,2) & rez_merged.st3(:,5)==cluster(m));
    if ~isempty(index)    
    %Getting spikes per cluster or cell
        spiketemp=(rez_merged.st3(index)'-meta.sound(n,1))/rez_merged.ops.fs;%aligning to beginning of sound and converting to time
        spiketemp=length(spiketemp)/4000;
        %trial, sound ID, unit, spikerate
        spikes(conta,:)=[n soundid cluster(m) spiketemp];
    else
         spikes(conta,:)=[n soundid cluster(m) nan];
    end
    conta=conta+1;
    end
        %spikes{n}=temp; clear temp

end
%save('SAM-170818_AL.mat','spikes');
save(save_filesml{z},'spikes');

end