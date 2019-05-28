function raster_ks_v2(rez)
%%
fs =  2.4414e+04;
if isstruct(rez)
    spikes=rez.st3;
else
    spikes=rez;
end

spikes=sortrows(spikes,5);
%index= spikes(:,5)>=0;
%sp1=sp(index,:);



APsS=[spikes(:,5) spikes(:,1)];
clear spikes
cluster=1;
index_cluster=unique(APsS(:,1));
for n=1:length(index_cluster)
    index_c= APsS(:,1)==index_cluster(n);
    APsS(index_c,1)=cluster;
    cluster=cluster+1;
end
plot(APsS(:,2)/fs,APsS(:,1),'k.','markersize',3)
npnts=max(max(APsS))/fs;
timevec = 1:npnts;
set(gca,'xlim',timevec([1 end]))