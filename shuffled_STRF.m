STRF_from_kS2_sam_190507
s=102;
index_temp=find(sp.clu==index_clusters(s));
spet=sp.st(index_temp)*fs;
cluster_number=index_clusters(s);
%%
s=102;
index_temp=find(sp.clu==index_clusters(s));
spet=sp.st(index_temp)*fs;
cluster_number=index_clusters(s);

%%
%Shufling
SpetA=spet(spet<=(max(TrgA)));
SpetB=spet(spet>(max(TrigA)));
%%
spetAshuf=shufflespet(SpetA);
spetBshuf=shufflespet(SpetB);
%%
[taxis,faxis,STRF1A,STRF2A,PP,Wo1A,Wo2A,No1A,No2A,SPLN]=rtwstrfdbintboot(sprfile,0,s_bin,spetAshuf',TrigA,fs,80,30,'dB','MR',100,10,'float',8);



[taxis,faxis,STRF1B,STRF2B,PP,Wo1B,Wo2B,No1B,No2B,SPLN]=rtwstrfdbintboot(sprfile,0,s_bin,spetBshuf',TrigB,fs,80,30,'dB','MR',100,10,'float',8);