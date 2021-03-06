
for n=1:96
    [STRF1s,Tresh1]=wstrfstat(STRF(n).STRF1,0.00001,STRF(n).No1,STRF(n).Wo1,STRF(n).PP,30,'dB','MR','dB');    
    figure;%subplot(1,2,1)
        taxis=(STRF(n).taxis)*1e3;
        faxis=(STRF(n).faxis)*1e3;
        pcolor(taxis,log2(faxis/faxis(1)),STRF1s);
        imagesc(taxis,log2(faxis/faxis(1)),STRF1s*sqrt(STRF(n).PP))
        colormap jet;
        set(gca,'YDir','normal'); 
        shading flat;
        print(['c:\work\th_STRF\TH1_' num2str(n)],'-djpeg');
        STRFTH(n) = struct('STRF1',STRF1s,'taxis',taxis,'faxis',faxis,'PP',STRF(n).PP);
        close
end


for n=1:96
    [STRF1s,Tresh1]=wstrfstat(STRF(n).STRF1,0.001,STRF(n).No1,STRF(n).Wo1,STRF(n).PP,30,'dB','MR','dB');    
    figure;%subplot(1,2,1)
        taxis=(STRF(n).taxis)*1e3;
        faxis=(STRF(n).faxis)*1e3;
        pcolor(taxis,log2(faxis/faxis(1)),STRF1s);
        imagesc(taxis,log2(faxis/faxis(1)),STRF1s*sqrt(STRF(n).PP))
        colormap jet;
        set(gca,'YDir','normal'); 
        shading flat;
        print(['c:\work\th_STRF\TH2_' num2str(n)],'-djpeg');
        STRFTH2(n) = struct('STRF1',STRF1s,'taxis',taxis,'faxis',faxis,'PP',STRF(n).PP);
        close
end

for n=1:96
    [STRF1s,Tresh1]=wstrfstat(STRF(n).STRF1,0.01,STRF(n).No1,STRF(n).Wo1,STRF(n).PP,30,'dB','MR','dB');    
    figure;%subplot(1,2,1)
        taxis=(STRF(n).taxis)*1e3;
        faxis=(STRF(n).faxis)*1e3;
        pcolor(taxis,log2(faxis/faxis(1)),STRF1s);
        imagesc(taxis,log2(faxis/faxis(1)),STRF1s*sqrt(STRF(n).PP))
        colormap jet;
        set(gca,'YDir','normal'); 
        shading flat;
        print(['c:\work\th_STRF\TH3_' num2str(n)],'-djpeg');
        STRFTH3(n) = struct('STRF1',STRF1s,'taxis',taxis,'faxis',faxis,'PP',STRF(n).PP);
        close
end

for n=1:96
    [STRF1s,Tresh1]=wstrfstat(STRF(n).STRF1,0.1,STRF(n).No1,STRF(n).Wo1,STRF(n).PP,30,'dB','MR','dB');    
    figure;%subplot(1,2,1)
        taxis=(STRF(n).taxis)*1e3;
        faxis=(STRF(n).faxis)*1e3;
        pcolor(taxis,log2(faxis/faxis(1)),STRF1s);
        imagesc(taxis,log2(faxis/faxis(1)),STRF1s*sqrt(STRF(n).PP))
        colormap jet;
        set(gca,'YDir','normal'); 
        shading flat;
        print(['c:\work\th_STRF\TH4_' num2str(n)],'-djpeg');
        STRFTH4(n) = struct('STRF1',STRF1s,'taxis',taxis,'faxis',faxis,'PP',STRF(n).PP);
        close
end
