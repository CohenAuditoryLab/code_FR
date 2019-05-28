%making all meta files
folders=dir('D:\SpikeSortingPipeline\Tanks\LabView\SamNew');
folders=folders(3:end);
for n=1:length(folders)
    dday=num2str(folders(n).date(1:2));
    mmonth=month(folders(n).date);
    yyear=num2str(year(folders(n).date));
    yyear=num2str(yyear(3:4));
    
   tankname=['SAM-' yyear mmonth dday] ;
   [meta,lv_file] = tankMetaData_v2('D:\SpikeSortingPipeline\Tanks\SAM-180705', 1, 'Textures', 96, 'D:\SpikeSortingPipeline\Tanks\LabVIEW\Jul5_2018.mat');
save('h:\meta\SAM-180705_meta.mat', 'meta','lv_file');




end
%