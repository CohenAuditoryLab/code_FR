%calculating STRF with tdt output
%Trig times and spet in samples
%load('C:\work\Sorted\meta_171018_B2.mat')
%temp=SEV2mat('F:\SAM-171013\BLock-5','Channel',66,'EVENTNAME','xpz5');
% triggers=temp.xpz5.data;
% % fs=temp.xpz5.fs;
% triggers=meta.triggers;
% fs=meta.fs;
% 
% [b,a]=butter(6,1000/(fs/2));
% trf=filter(b,a,triggers);
% [pks,locs]=findpeaks(trf/max(trf),'MinPeakHeight',.9);
% %%
% %there are 917 triggers on the file
%  [TrigA,TrigB]=trigfixstrf2(locs,400,917);

%%
%SnipTimeStamp (goes from 1-64)+SnipTimeStamp1(1-32)=>ML
%SnipTimeStamp1 (goes from 33-128)=>AL
cs=1;
contaML=52;
contaML2=93;
contaAL=9;
for s=51:64 
    [Data] = readtank_mwa_input('SLy-171107',1,s,'local');
     TrigTimes=round(Data.Fs*Data.Trig);
     [TrigA,TrigB]=trigfixstrf2(TrigTimes,400,917);
     spet=(Data.SnipTimeStamp*Data.Fs);
    spet1=(Data.SnipTimeStamp1*Data.Fs1);
     fs=Data.Fs;
     %ML
     if s<64
        %[taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdb('C:\work\Penn\DNR_updated\DNR_Cortex_100k5min.spr',0,0.3,spet,TrigA,fs,80,30,'dB','MR',1300,'float');
        [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdb('C:\work\Penn\Moving_Ripple_generation\DNR_Cortex_96k5min.spr',0,0.3,spet,TrigA,fs,80,30,'dB','MR',300,'float');
        
        %[taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdb('C:\work\Penn\DNR_updated\DNR_Cortex_100k5min.spr',0,0.3,spet,TrigB,fs,80,30,'dB','MR',1300,'float');
        [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdb('C:\work\Penn\Moving_Ripple_generation\DNR_Cortex_96k5min.spr',0,0.3,spet,TrigB,fs,80,30,'dB','MR',300,'float');
        STRF1=(STRF1A+STRF1B)/2;
        STRF2=(STRF2A+STRF2B)/2;
        No1=No1A+No1B;
        Wo1=(Wo1A+Wo1B)/2;
        No2=No2A+No2B;
        Wo2=(Wo2A+Wo2B)/2;
        STRFDataML(contaML) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
        figure;%subplot(1,2,1)
taxis=(taxis)*1e3;
faxis=(faxis)*1e3;
pcolor(taxis,log2(faxis/faxis(1)),(STRF1A+STRF1B)/2);
colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
  print(['C:\work\STRF_tdt\ML\ML_' num2str(contaML)],'-djpeg');
  contaML=contaML+1;   
  close all
     if s<32 
     [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdb('C:\work\Penn\DNR_updated\DNR_Cortex_100k5min.spr',0,0.3,spet1,TrigA,fs,80,1300,'dB','MR',300,'float');
        [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdb('C:\work\Penn\DNR_updated\DNR_Cortex_100k5min.spr',0,0.3,spet1,TrigB,fs,80,1300,'dB','MR',300,'float');
        STRF1=(STRF1A+STRF1B)/2;
        STRF2=(STRF2A+STRF2B)/2;
        No1=No1A+No1B;
        Wo1=(Wo1A+Wo1B)/2;
        No2=No2A+No2B;
        Wo2=(Wo2A+Wo2B)/2;
        STRFDataML(contaML2) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
        figure;%subplot(1,2,1)
taxis=(taxis)*1e3;
faxis=(faxis)*1e3;
pcolor(taxis,log2(faxis/faxis(1)),(STRF1A+STRF1B)/2);
colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
  print(['C:\work\STRF_tdt\ML\ML_' num2str(contaML2)],'-djpeg');
     close all
     contaML2=contaML2+1;
     end
     end
     %AL
     if s>32
     [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdb('C:\work\Penn\DNR_updated\DNR_Cortex_100k5min.spr',0,0.3,spet1,TrigA,fs,80,1300,'dB','MR',1300,'float');
        [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdb('C:\work\Penn\DNR_updated\DNR_Cortex_100k5min.spr',0,0.3,spet1,TrigB,fs,80,1300,'dB','MR',1300,'float');
        STRF1=(STRF1A+STRF1B)/2;
        STRF2=(STRF2A+STRF2B)/2;
        No1=No1A+No1B;
        Wo1=(Wo1A+Wo1B)/2;
        No2=No2A+No2B;
        Wo2=(Wo2A+Wo2B)/2;
        STRFDataAL(contaAL) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
        figure;%subplot(1,2,1)
taxis=(taxis)*1e3;
faxis=(faxis)*1e3;
pcolor(taxis,log2(faxis/faxis(1)),(STRF1A+STRF1B)/2);
colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
  print(['C:\work\STRF_tdt\AL\AL_' num2str(contaAL)],'-djpeg');
     close all
       contaAL=contaAL+1;  
     end
     
end




