%SnipTimeStamp (goes from 1-64)+SnipTimeStamp1(1-32)=>ML
%SnipTimeStamp1 (goes from 33-128)=>AL
warning('off','MATLAB:interp1:UsePCHIP')
%sprfile='C:\work\STRF\Moving_ripple\slower_DMR\DNR_Cortex_96k_RD2_FM5_5min.spr';
sprfile='C:\work\STRF\Moving_ripple\DMR_50HZ\DNR_Cortex_96k5min_4_50.spr';
%savepath='H:\DataTanks\SAM-180521\Block-2\';
savepath='C:\work\STRF_tdt\SAM-190401\Block-2\';
cs=1;
contaML=1;
contaML2=65;
contaAL=1;
for s=1:96 
    disp(s)
%    [Data] = readtank_mwa_input('SAM-180521',1,s,'local');
    %[Data] = readtank_mwa_input('SAM-180521',2,s,'local');
    %[Data] = readtank_mwa_input('SLY-180815',3,s,'local');
    %[Data] = readtank_mwa_input('SLY-180820',3,s,'local');
    %[Data] = readtank_mwa_input('SAM-190401',2,s,'local');
    [Data] = readtank_sdk_new_tanks('D:\SpikeSortingPipeline\Tanks_192ch\SAM-190401',2,s,'XPZ2');
     TrigTimes=round(Data.Fs*Data.Trig);
     [TrigA,TrigB]=trigfixstrf2(TrigTimes',400,899);
%      spet=(Data.SnipTimeStamp*Data.Fs);
%      spet1=(Data.SnipTimeStamp1*Data.Fs1);
     %looking for SortCode with Data
     
     spet=(Data.snips.eNe2.ts*Data.Fs);
     
     fs=Data.snips.eNe2.fs;
     %ML
     if s<=64
        if length(spet)>100
        [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdbint(sprfile,0,0.15,spet',TrigA,fs,80,30,'dB','MR',100,5,'float');
        [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdbint(sprfile,0,0.15,spet',TrigB,fs,80,30,'dB','MR',100,5,'float');
        STRF1=(STRF1A+STRF1B)/2;
        STRF2=(STRF2A+STRF2B)/2;
        No1=No1A+No1B;
        Wo1=(Wo1A+Wo1B)/2;
        No2=No2A+No2B;
        Wo2=(Wo2A+Wo2B)/2;
        STRFDataML(contaML) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
        figure;%subplot(1,2,1)
        taxis=(taxis)*1e3;faxis=(faxis)*1e3;
        pcolor(taxis,log2(faxis/faxis(1)),(STRF1A+STRF1B)/2);
        colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
        if ~exist([savepath '\ML'], 'dir')
            mkdir([savepath '\ML']); 
        end
        print([savepath 'ML\ML_' num2str(contaML)],'-djpeg');
        end
        contaML=contaML+1;   
        close all
        
     if s<=32
         if length(spet)>100
        [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdbint(sprfile,0,0.15,spet',TrigA,fs,80,30,'dB','MR',100,5,'float');
        [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdbint(sprfile,0,0.15,spet',TrigB,fs,80,30,'dB','MR',100,5,'float');
        STRF1=(STRF1A+STRF1B)/2;
        STRF2=(STRF2A+STRF2B)/2;
        No1=No1A+No1B;
        Wo1=(Wo1A+Wo1B)/2;
        No2=No2A+No2B;
        Wo2=(Wo2A+Wo2B)/2;
        STRFDataML(contaML2) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
        figure;%subplot(1,2,1)
        taxis=(taxis)*1e3;faxis=(faxis)*1e3;
        pcolor(taxis,log2(faxis/faxis(1)),(STRF1A+STRF1B)/2);
        colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
        if ~exist([savepath '\ML'], 'dir')
            mkdir([savepath '\ML']); 
        end
        print([savepath 'ML\ML_' num2str(contaML2)],'-djpeg');
        close all
        end
        contaML2=contaML2+1;
         
     end
     end
     %AL
     if s>32
         if length(spet1)>100
        [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdbint(sprfile,0,0.15,spet',TrigA,fs,80,30,'dB','MR',1300,5,'float');
        [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdbint(sprfile,0,0.15,spet',TrigB,fs,80,30,'dB','MR',1300,5,'float');
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
        if ~exist([savepath '\AL'], 'dir')
            mkdir([savepath '\AL']); 
        end
  print([savepath 'AL\AL_' num2str(contaAL)],'-djpeg');
     close all
         end
       contaAL=contaAL+1;  
     end
     
end




