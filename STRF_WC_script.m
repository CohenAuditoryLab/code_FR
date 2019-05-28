function STRFData=STRF_WC(folder_files)
files_st=dir('times*.mat');
%STRF, need to check second session part
%load('F:\Sly-180416ml\Sly-180416\Block-1wav\times_Sly-180416_Block-1_xpz5_ch44.mat')
for n=70:96
    load(['H:\SAM-180501ml\SAM-180501\Block-2wav\' files_st(n).name]);
    index=find(cluster_class(:,1)==1);
    spet=cluster_class(index,2);
    fs=24414.0625;
    spet=((spet/1e3)*fs);%spet is in ms, needs to be changed to samples
%%
%Running both sessions STRF will be in A
%add to check for index
[taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdb('C:\work\STRF\Moving_ripple\Moving_Ripple_generation\DNR_Cortex_96k5min.spr',...
    0,0.05,spet',TrigA,fs,80,10,'dB','MR',3000,'float');
[taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdb('C:\work\STRF\Moving_ripple\Moving_Ripple_generation\DNR_Cortex_96k5min.spr',0,...
    0.05,spet',TrigB,fs,80,30,'dB','MR',3000,'float');
        STRF1=(STRF1A+STRF1B)/2;
        STRF2=(STRF2A+STRF2B)/2;
        No1=No1A+No1B;
        Wo1=(Wo1A+Wo1B)/2;
        No2=No2A+No2B;
        Wo2=(Wo2A+Wo2B)/2;
        STRFDataML(n) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
        disp(n)
     figure;
     subplot(1,2,1)
        taxis=(taxis)*1e3;
        faxis=(faxis)*1e3;
        pcolor(taxis,log2(faxis/faxis(1)),(STRF1A+STRF1B)/2);
        colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
%      subplot(1,2,2);
%         taxis=(taxis)*1e3;
%         faxis=(faxis)*1e3;
%         pcolor(taxis,log2(faxis/faxis(1)),(STRF2A+STRF2B)/2);
%         colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;

if ~exist([folder_files '\STRF\CH_' num2str(n)], 'dir')
    mkdir(fpath); 
end
print([folder_files '\STRF\CH_' num2str(n)],'-djpeg');
%pause
%close all
clear Data taxis faxis STRF1 STRF2 PP Wo1 Wo2 No1 No2 SPLN

% clear STRFDataAL spikes

end
save([folder_files '\STRF.mat'],'STRFDataML');


files_st=dir('H:\SAM-180501al\SAM-180501\Block-2wav\times*.mat');

for n=1:96
    load(['H:\SAM-180501al\SAM-180501\Block-2wav\' files_st(n).name]);
    index=find(cluster_class(:,1)==1);
    spet=cluster_class(index,2);
    fs=24414.0625;
    spet=((spet/1e3)*fs);%spet is in ms, ned to be changed to samples
%%
%Running both sessions STRF will be in A

[taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdb('C:\work\STRF\Moving_ripple\Moving_Ripple_generation\DNR_Cortex_96k5min.spr',0,0.05,spet',TrigA,fs,80,30,'dB','MR',3000,'float');
[taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdb('C:\work\STRF\Moving_ripple\Moving_Ripple_generation\DNR_Cortex_96k5min.spr',0,0.05,spet',TrigB,fs,80,30,'dB','MR',3000,'float');

        STRF1=(STRF1A+STRF1B)/2;
        STRF2=(STRF2A+STRF2B)/2;
        No1=No1A+No1B;
        Wo1=(Wo1A+Wo1B)/2;
        No2=No2A+No2B;
        Wo2=(Wo2A+Wo2B)/2;
        STRFDataaL(n) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
        disp(n)
     figure;
     %subplot(1,2,1)
        taxis=(taxis)*1e3;
        faxis=(faxis)*1e3;
        pcolor(taxis,log2(faxis/faxis(1)),(STRF1A+STRF1B)/2);
        colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
%      subplot(1,2,2);
%         taxis=(taxis)*1e3;
%         faxis=(faxis)*1e3;
%         pcolor(taxis,log2(faxis/faxis(1)),(STRF2A+STRF2B)/2);
%         colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;

print(['H:\SAM-180501al\SAM-180501\Block-2wav\STRF\CH_' num2str(n)],'-djpeg');
%pause
%close all
    clear Data taxis faxis STRF1 STRF2 PP Wo1 Wo2 No1 No2 SPLN
 %save('C:\work\rasters\ML_STRF_171107','STRFDataML');
% clear STRFDataAL spikes
end