function raster_per_sound_wc(metafile,datafile,rasterpath)
%load(sorted_data); 
%load('D:\processed_data_from_h\meta\SAM-180705_meta.mat');
load(metafile)

for z=1:96
load([datafile  num2str(z) '.mat'],'cluster_class');
%load(['D:\processed_data_from_h\SAM-180705al\SAM-180705\Block-1wav\Results\Times\times_SAM-180705_Block-1_ch' num2str(z) '.mat'],'cluster_class');
%load(['D:\processed_data_from_h\SAM-180705al\SAM-180705\Block-1wav\Results\Times\times_SAM-180705_Block-1_ch' num2str(z) '.mat'],'cluster_class');
index= cluster_class(:,1)==1; %#ok<NODEF>
spet=  cluster_class(index,2);
fs=24414.0625;
spet=((spet/1e3)*fs); %samples
for n=1:length(meta.trial)
 %progressbar(n/length(meta.trial),[]);
 %creating sound identifier
%need to split param here and asign a value
%     Normal Sound 1-10 NS   1-10
%     Texture 1-10 TS             11-20
%     Left 1-10 L.NS               21-30
%     right 1-10 R.NS             31-40
%     big room 1-10 C.Tx        41-50
%     small room 1-10 c.Ty      51-60
    tempsoundid=meta.param{n};
    [tt,~]=split(tempsoundid,'.');
    if strcmp(tt(3),'C') && strcmp(tt(4),'NS')
            soundid(n)=str2double(tt{5});
    elseif strcmp(tt(3),'C') && strcmp(tt(4),'TS')
            soundid(n)=str2double(tt{5})+10;
    elseif strcmp(tt(3),'L') && strcmp(tt(4),'NS')
            soundid(n)=str2double(tt{5})+20;
    elseif strcmp(tt(3),'R') && strcmp(tt(4),'NS')
            soundid(n)=str2double(tt{5})+30;
    elseif strcmp(tt(3),'C') && strcmp(tt(4),'TX')
            soundid(n)=str2double(tt{5})+40;
    elseif  strcmp(tt(3),'C') && strcmp(tt(4),'TY')
            soundid(n)=str2double(tt{5})+50;
    end
end
 
for n=1:length(unique(soundid))%will go throgh all the sounds60
    index=find(soundid==n);
    count=0;
    for m=1:length(index) %trials of each sound
        index_sp=find(spet>(meta.trial(index(m),1)-(1*fs)) & spet<meta.trial(index(m),2));
        if ~isempty(index_sp)    
            spiketemp=(spet(index_sp)-meta.sound(index(m),1))/fs;%aligning to beginning of sound and converting to time
            spikecell{n,m}=spiketemp';
            count=count+1;
            trials(n)=count;
        end
     end
    
end
%Plotting Raster and histogram
Savepath=[rasterpath  num2str(z)];
%Savepath=['C:\work\raster_results\channel_' num2str(z)];
 if ~exist(Savepath, 'dir')
           mkdir(Savepath); 
 end
          


for n=1:size(spikecell,1)
    if trials(n)>3
        plotSpikeRasterAndHistogram({spikecell{n,:}}, 0, 2000, 5000, 100,n);
        print([Savepath '\sound_' num2str(n)],'-djpeg');
        close
    end
end

end