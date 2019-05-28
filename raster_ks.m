function raster_ks(rez)
%%
fs =  2.4414e+04;
if isstruct(rez)
    spikes=rez.st3;
else
    spikes=rez;
end

sp=sortrows(spikes,5);
index= sp(:,5)>=0;
sp1=sp(index,:);
APsS=[sp1(:,5) sp1(:,1)];;
plot(APsS(:,2)/fs,APsS(:,1),'k.','markersize',3)
npnts=max(max(APsS))/fs;
timevec = 1:npnts;
set(gca,'xlim',timevec([1 end]))