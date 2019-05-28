%SnipTimeStamp (goes from 1-64)+SnipTimeStamp1(1-32)=>ML
%SnipTimeStamp1 (goes from 33-128)=>AL
fs=24414.0625;
path='D:\SpikeSortingPipeline\Tanks\Sly-180823\Block-2\Sly-180823_Block-2_xpz5_ch66.sev';
[TrigA,TrigB]=getting_triggers(path);
warning('off','MATLAB:interp1:UsePCHIP')
sprfile='C:\work\STRF\Moving_ripple\Moving_Ripple_generation\DNR_Cortex_96k5min.spr';
%savepath='H:\DataTanks\SAM-180417\Block-1\';
savepath='C:\work\SLY-180823\NMSTRF\';
s_bin=0.08;
cs=1;
%Getting spet from kilosort result
load('C:\work\SLY-180823\xpz2b2f\rez_nm.mat');
spikes=rez_nomerge.st3;
index_clusters=unique(spikes(:,4));

for s=1:length(index_clusters) 
    index_temp=find(spikes(:,4)==index_clusters(s));
    spet=spikes(index_temp,1);
    
        if length(index_temp)>500
            
      %   [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdbint(sprfile,0,s_bin,spet',TrigA,fs,80,30,'dB','MR',1700,5,'float');
      %   [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdbint(sprfile,0,s_bin,spet',TrigB,fs,80,30,'dB','MR',1700,5,'float');
          [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdb(sprfile,0,s_bin,spet',TrigA,fs,80,30,'dB','MR',1700,'float');
        [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdb(sprfile,0,s_bin,spet',TrigB,fs,80,30,'dB','MR',1700,'float');
        
        STRF1=(STRF1A+STRF1B)/2;
        STRF2=(STRF2A+STRF2B)/2;
        No1=No1A+No1B;
        Wo1=(Wo1A+Wo1B)/2;
        No2=No2A+No2B;
        Wo2=(Wo2A+Wo2B)/2;
        STRFData(s) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
        figure;%subplot(1,2,1)
        taxis=(taxis)*1e3;faxis=(faxis)*1e3;
        pcolor(taxis,log2(faxis/faxis(1)),(STRF1A+STRF1B)/2);
        colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
        print([savepath '\STRF_' num2str(s)],'-djpeg');
        close all

        [STRF1s,Tresh1]=wstrfstat(((STRF1A+STRF1B)/2),0.00001,No1,Wo1,PP,30,'dB','MR','dB');    
        figure;%subplot(1,2,1)
        pcolor(taxis,log2(faxis/faxis(1)),STRF1s);
        imagesc(taxis,log2(faxis/faxis(1)),STRF1s*sqrt(PP))
        colormap jet;
        set(gca,'YDir','normal'); 
        shading flat;
        caxis([0 2])
        %axis([0 100 0 8]);colorbar
        print(['C:\work\SLY-180823\NMSRTFth\STRF' num2str(s)],'-djpeg');
        STRFTH(s) = struct('STRF1',STRF1s,'taxis',taxis,'faxis',faxis,'PP',PP);
        
        end



end
    save('C:\work\SLY-180823\NMSTRFth\STRFth.mat','STRFTH');
     save('C:\work\SLY-180823\NMSTRF\STRF.mat','STRFData');
     





