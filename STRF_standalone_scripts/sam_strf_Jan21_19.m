%Sam AL(1-64)xpz5, A1(1-64), ML(65-128)xpz2

warning('off', 'MATLAB:interp1:UsePCHIP')
%Opening master list
%[~,~,raw]   =   xlsread('c:\work\code_fr\SLY_short_master_list.xlsx');
s_bin=0.15;


block=3;
task        =   'STRF';
if strcmp(task(1),'S') && (length(task)>4) 
    %sprfile='C:\work\STRF\Moving_ripple\slower_DMR\DNR_Cortex_96k_RD2_FM5_5min.spr';
    sprfile='C:\work\STRF\Moving_ripple\Moving_Ripple_generation\DNR_Cortex_96k5min.spr';
elseif strcmp(task(1),'S') && (length(task)<5) 
    sprfile='C:\work\STRF\Moving_ripple\Moving_Ripple_generation\DNR_Cortex_96k5min.spr';
end
conta=1;
for chi=1:128
       
    [Data] = readtank_sdk_v2('D:\SpikeSortingPipeline\Tanks\SAM-190121',2,chi,'XPZ2');  
    TrigTimes=round(Data.Fs*Data.Trig);
    [TrigA,TrigB]=trigfixstrf2(TrigTimes',400,899);
    spet=(Data.snips.eeN1.ts)*Data.Fs;
    sortcode=Data.snips.eeN1.sortcode;
    if ~isempty(sortcode)
    index=unique(sortcode);
    index=find(sortcode==index(1));
    spet=spet(index);
    else 
        spet=[];
    end
    fs=Data.Fs;
  try
    %[taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=  rtwstrfdb(sprfile,0,s_bin,spet',TrigA,fs,80,30,'dB','MR',100,'float');
    [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdbint(sprfile,0,s_bin,spet',TrigA,fs,80,30,'dB','MR',1700,5,'float');
  catch me
      STRF1A=[];STRF2A=[];No1A=[];Wo1A=[];No1A=[];Wo1A=[];
  end
  
  try
    %[taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=  rtwstrfdb(sprfile,0,s_bin,spet',TrigB,fs,80,30,'dB','MR',100,'float');
     [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdbint(sprfile,0,s_bin,spet',TrigB,fs,80,30,'dB','MR',1700,5,'float');
  catch
     STRF1B=[];STRF2B=[];No1B=[];Wo1B=[];No1B=[];Wo1B=[]; 
  end
  if ~isempty(STRF1A) && ~isempty(STRF1B)
      
    STRF1 = (STRF1A+STRF1B)/2;
    STRF2 = (STRF2A+STRF2B)/2;
    No1   =  No1A+No1B;
    Wo1   =  (Wo1A+Wo1B)/2;
    No2   =  No2A+No2B;
    Wo2   =  (Wo2A+Wo2B)/2;
  elseif isempty(STRF1A) && ~isempty(STRF1B)
    STRF1 = STRF1B;
    STRF2 = STRF2B;
    No1   =  No1B;
    Wo1   =  Wo1B;
    No2   =  No2B;
    Wo2   =  Wo2B;
  elseif isempty(STRF1B) && ~isempty(STRF1A)
    STRF1 = STRF1A;
    STRF2 = STRF2A;
    No1   =  No1A;
    Wo1   =  Wo1A;
    No2   =  No2A;
    Wo2   =  Wo2A;
    elseif isempty(STRF1B) && isempty(STRF1A)
      
    STRF1 = [];
    STRF2 = [];
    No1   =  [];
    Wo1   =  [];
    No2   =  [];
    Wo2   =  [];
  end
STRFDataxpz2(conta) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
figure;
taxis = (taxis)*1e3;
faxis = (faxis)*1e3;
%subplot(2,1,1)
if ~isempty(STRF1)
pcolor(taxis,log2(faxis/faxis(1)),STRF1);
colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
%subplot(2,1,2)
%pcolor(taxis,log2(faxis/faxis(1)),STRF2);
%colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;

save_strf=['C:\work\STRF_tdt\SAM-190121\Block-' num2str(block) '\xpz2\'];
if ~exist(save_strf,'dir')
    mkdir(save_strf)
end
print([save_strf 'STRF_Ch' num2str(conta)],'-djpeg');
close all
conta=conta+1;
end
end
save(save_strf,'STRFDataxpz2');

conta=1;
for chi=1:64
       
    [Data] = readtank_sdk_v2('D:\SpikeSortingPipeline\Tanks\SAM-190121',2,chi,'XPZ5');  
    TrigTimes=round(Data.Fs*Data.Trig);
    [TrigA,TrigB]=trigfixstrf2(TrigTimes',400,899);
    %error here
    spet=(Data.snips.eeNu.ts)*Data.Fs;
    sortcode=Data.snips.eeNu.sortcode;
    if ~isempty(sortcode)
    index=unique(sortcode);
    index=find(sortcode==index(1));
    spet=spet(index);
    else 
        spet=[];
    end
    fs=Data.Fs;
  try
    %[taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=  rtwstrfdb(sprfile,0,s_bin,spet',TrigA,fs,80,30,'dB','MR',100,'float');
    [taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdbint(sprfile,0,s_bin,spet',TrigA,fs,80,30,'dB','MR',1700,5,'float');
  catch me
      STRF1A=[];STRF2A=[];No1A=[];Wo1A=[];No1A=[];Wo1A=[];
  end
  
  try
    %[taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=  rtwstrfdb(sprfile,0,s_bin,spet',TrigB,fs,80,30,'dB','MR',100,'float');
     [taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdbint(sprfile,0,s_bin,spet',TrigB,fs,80,30,'dB','MR',1700,5,'float');
  catch
     STRF1B=[];STRF2B=[];No1B=[];Wo1B=[];No1B=[];Wo1B=[]; 
  end
  if ~isempty(STRF1A) && ~isempty(STRF1B)
      
    STRF1 = (STRF1A+STRF1B)/2;
    STRF2 = (STRF2A+STRF2B)/2;
    No1   =  No1A+No1B;
    Wo1   =  (Wo1A+Wo1B)/2;
    No2   =  No2A+No2B;
    Wo2   =  (Wo2A+Wo2B)/2;
  elseif isempty(STRF1A) && ~isempty(STRF1B)
    STRF1 = STRF1B;
    STRF2 = STRF2B;
    No1   =  No1B;
    Wo1   =  Wo1B;
    No2   =  No2B;
    Wo2   =  Wo2B;
  elseif isempty(STRF1B) && ~isempty(STRF1A)
    STRF1 = STRF1A;
    STRF2 = STRF2A;
    No1   =  No1A;
    Wo1   =  Wo1A;
    No2   =  No2A;
    Wo2   =  Wo2A;
    elseif isempty(STRF1B) && isempty(STRF1A)
      
    STRF1 = [];
    STRF2 = [];
    No1   =  [];
    Wo1   =  [];
    No2   =  [];
    Wo2   =  [];
  end
STRFDataxpz5(conta) = struct('No1',No1,'Wo1',Wo1,'No2',No2,'Wo2',Wo2,'STRF1',STRF1,'STRF2',STRF2,'taxis',taxis,'faxis',faxis,'PP',PP,'SPLN',SPLN);
figure;
taxis = (taxis)*1e3;
faxis = (faxis)*1e3;
%subplot(2,1,1)
if ~isempty(STRF1)
pcolor(taxis,log2(faxis/faxis(1)),STRF1);
colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;
%subplot(2,1,2)
%pcolor(taxis,log2(faxis/faxis(1)),STRF2);
%colormap jet;set(gca,'YDir','normal'); shading flat;colormap jet;

save_strf=['C:\work\STRF_tdt\SAM-190121\Block-' num2str(block) '\xpz5\'];
if ~exist(save_strf,'dir')
    mkdir(save_strf)
end
print([save_strf 'STRF_Ch' num2str(conta)],'-djpeg');
close all
conta=conta+1;
end
end
save(save_strf,'STRFDataxpz5');

