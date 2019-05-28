 num_channels=96;
 save_path='F:\SpikeSortingPipeline\Sorted\';
 fpath='D:\SpikeSortingPipeline\Tanks\';
 % path to xls file containing background info for each experiment/block pair
xls_path = 'D:\SpikeSortingPipeline\Tanks\SAM_master_list.xlsx';
%exps=[26,27,28,29,30,31,32,33,34,35,36,37,38,39];
exps=[26, 28,29];
%exps=flip(exps);
%done 38 39 36 35 34 31 30
%out 32,33 37
%bad ,27, Tank is bad
% read master lists
[~,~,raw] = xlsread(xls_path);
% go through all experiments using the correlative from master list
for exp = 1:length(exps)
    indice =  find(cell2mat(raw(:,1))==exps(exp) & strcmp(raw(:,7),'Textures')); % get block indices for experiment
            tic; % start clock
            tankfile = char(cell2mat(raw(indice,4)));
            block = cell2mat(raw(indice,6));
            chan_num = cell2mat(raw(indice,8));
            forigin = fullfile(fpath,tankfile);
            fdest = [fullfile(save_path,tankfile) '_Block-' num2str(block)];
            disp('Getting meta data... ');
            [meta,lv_file] = tankMetaData_v2(forigin, block, cell2mat(raw(indice,7)), ...
                chan_num, fullfile(fpath,'LabVIEW',[cell2mat(raw(indice,32)) '.mat'])); %#ok<NASGU>
            save([fdest 'meta.mat'],'meta','lv_file');
  disp(['Extraction took ' num2str(toc/60) ]);
end
