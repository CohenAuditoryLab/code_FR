num_channels=96;
BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180501\Block-1\';
SevSavePath='H:\SAM-180501al\Block-1sc\';
amp_var='xpz2';
[sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);

num_channels=96;
BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180501\Block-1\';
SevSavePath='H:\SAM-180501ml\Block-1sc\';
amp_var='xpz5';
[sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);

BlockPath='H:\SAM-180501al\Block-1sc\';
SevSavePath='H:\SAM-180501al\SAM-180501\Block-1\';
ch_group=4;
channels=96;
ndim_res=2;
amp_var='xpz2';
clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);

BlockPath='H:\SAM-180501ml\Block-1sc\';
SevSavePath='H:\SAM-180501ml\SAM-180501\Block-1\';
ch_group=4;
channels=96;
ndim_res=2;
amp_var='xpz5';
clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);

num_channels=96;

BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180501\Block-2\';
SevSavePath='H:\SAM-180501al\Block-2sc\';
amp_var='xpz2';
[sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);

num_channels=96;
BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180501\Block-2\';
SevSavePath='H:\SAM-180501ml\Block-2sc\';
amp_var='xpz5';
[sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);

BlockPath='H:\SAM-180501al\Block-2sc\';
SevSavePath='H:\SAM-180501al\SAM-180501\Block-2\';
ch_group=4;
channels=96;
ndim_res=2;
amp_var='xpz2';
clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);

BlockPath='H:\SAM-180501ml\Block-2sc\';
SevSavePath='H:\SAM-180501ml\SAM-180501\Block-2\';
ch_group=4;
channels=96;
ndim_res=2;
amp_var='xpz5';
clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
%%
param.stdmin = 4;
files_path='H:\SAM-180501ml\SAM-180501\Block-1wav\';
files=dir([files_path '*.mat']);
files_wav={files.name};
cd(files_path);

param.min_clus=60;
param.max_spk=50000;
par.matxtamp=0.251;
Get_spikes(files_wav,'parallel',true,'par',param); 

files=dir([files_path '*spikes.mat']);
files_spikes={files.name};
cd(files_path);
for i = 1:length(files_spikes)
    try
        Do_clustering(files_spikes{i}, 'parallel', true, 'par', param);
    catch ME
        if strcmp(ME.identifier,'MATLAB:unassignedOutputs')
            disp(['Not clustering ' files_spikes{i} ' because too few spikes were found.']);
        end
    end 
end
disp('DONE!');

files_path='H:\SAM-180501al\SAM-180501\Block-1wav\';
files=dir([files_path '*.mat']);
files_wav={files.name};
cd(files_path);

param.min_clus=60;
param.max_spk=50000;
par.matxtamp=0.251;
Get_spikes(files_wav,'parallel',true,'par',param); 

files=dir([files_path '*spikes.mat']);
files_spikes={files.name};
cd(files_path);
for i = 1:length(files_spikes)
    try
        Do_clustering(files_spikes{i}, 'parallel', true, 'par', param);
    catch ME
        if strcmp(ME.identifier,'MATLAB:unassignedOutputs')
            disp(['Not clustering ' files_spikes{i} ' because too few spikes were found.']);
        end
    end 
end
disp('DONE!');

param.stdmin = 4;
files_path='H:\SAM-180501ml\SAM-180501\Block-2wav\';
files=dir([files_path '*.mat']);
files_wav={files.name};
cd(files_path);

param.min_clus=60;
param.max_spk=50000;
par.matxtamp=0.251;
Get_spikes(files_wav,'parallel',true,'par',param); 

files=dir([files_path '*spikes.mat']);
files_spikes={files.name};
cd(files_path);
for i = 1:length(files_spikes)
    try
        Do_clustering(files_spikes{i}, 'parallel', true, 'par', param);
    catch ME
        if strcmp(ME.identifier,'MATLAB:unassignedOutputs')
            disp(['Not clustering ' files_spikes{i} ' because too few spikes were found.']);
        end
    end 
end
disp('DONE!');

files_path='H:\SAM-180501al\SAM-180501\Block-2wav\';
files=dir([files_path '*.mat']);
files_wav={files.name};
cd(files_path);

param.min_clus=60;
param.max_spk=50000;
par.matxtamp=0.251;
Get_spikes(files_wav,'parallel',true,'par',param); 

files=dir([files_path '*spikes.mat']);
files_spikes={files.name};
cd(files_path);
for i = 1:length(files_spikes)
    try
        Do_clustering(files_spikes{i}, 'parallel', true, 'par', param);
    catch ME
        if strcmp(ME.identifier,'MATLAB:unassignedOutputs')
            disp(['Not clustering ' files_spikes{i} ' because too few spikes were found.']);
        end
    end 
end
disp('DONE!');


%%
%getting_tank_data_binary('H:\SAM-180501al\SAM-180501', 1, 'xpz2', 96, 0, 0, 0, 'H:\SAM-180501_B1_AL');
%getting_tank_data_binary('H:\SAM-180501ml\SAM-180501', 1, 'xpz5', 96, 0, 0, 0, 'H:\SAM-180501_B1_ML');




% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-171205\Block-1\';
% SevSavePath='H:\SAM-171205al\Block-1sc\';
% amp_var='xpz2';
% [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% 
% num_channels=96;
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-171205\Block-1\';
% SevSavePath='H:\SAM-171205ml\Block-1sc\';
% amp_var='xpz5';
% [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\SAM-171205al\Block-1sc\';
% SevSavePath='H:\SAM-171205al\SAM-171205\Block-1\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz2';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% 
% BlockPath='H:\SAM-171205ml\Block-1sc\';
% SevSavePath='H:\SAM-171205ml\SAM-171205\Block-1\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz5';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% %%
% getting_tank_data_binary('H:\SAM-171205al\SAM-171205', 1, 'xpz2', 96, 0, 0, 0, 'H:\SAM-171205_B1_AL');
% getting_tank_data_binary('H:\SAM-171205ml\SAM-171205', 1, 'xpz5', 96, 0, 0, 0, 'H:\SAM-171205_B1_ML');

% matToKiloSort('H:\SAM-171205_B1_AL.dat', 'H:\SAM-171205_B1_AL\', 96);
% matToKiloSort('H:\SAM-171205_B1_ML.dat', 'H:\SAM-171205_B1_ML\', 96);
% 
% 
% num_channels=96;
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-171205\Block-2\';
% SevSavePath='H:\SAM-171205al\Block-2sc\';
% amp_var='xpz2';
% [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% 
% num_channels=96;
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-171205\Block-2\';
% SevSavePath='H:\SAM-171205ml\Block-2sc\';
% amp_var='xpz5';
% [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% 
% 
% 
% BlockPath='H:\SAM-171205al\Block-2sc\';
% SevSavePath='H:\SAM-171205al\SAM-171205\Block-2\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz2';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% 
% BlockPath='H:\SAM-171205ml\Block-2sc\';
% SevSavePath='H:\SAM-171205ml\SAM-171205\Block-2\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz5';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% % %%
% 
% getting_tank_data_binary('H:\SAM-171205al\SAM-171205', 2, 'xpz2', 96, 0, 0, 0, 'H:\SAM-171205_B2_AL');
% 
% getting_tank_data_binary('H:\SAM-171205ml\SAM-171205', 2, 'xpz5', 96, 0, 0, 0, 'H:\SAM-171205_B2_ML');
% 
% matToKiloSort('H:\SAM-171205_B2_AL.dat', 'H:\SAM-171205_B2_AL\', 96);
% matToKiloSort('H:\SAM-171205_B2_ML.dat', 'H:\SAM-171205_B2_ML\', 96);
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%
% % num_channels=96;
% % BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180416\Block-1\';
% % SevSavePath='H:\Sly-180416al\Block-1sc\';
% % amp_var='xpz2';
% % [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% % 
% % num_channels=96;
% % BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180416\Block-1\';
% % SevSavePath='H:\Sly-180416ml\Block-1sc\';
% % amp_var='xpz5';
% % [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% % 
% % 
% % 
% % BlockPath='H:\Sly-180416al\Block-1sc\';
% % SevSavePath='H:\Sly-180416al\Sly-180416\Block-1\';
% % ch_group=4;
% % channels=96;
% % ndim_res=2;
% % amp_var='xpz2';
% % clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% % 
% % BlockPath='H:\Sly-180416ml\Block-1sc\';
% % SevSavePath='H:\Sly-180416ml\Sly-180416\Block-1\';
% % ch_group=4;
% % channels=96;
% % ndim_res=2;
% % amp_var='xpz5';
% % clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% % % %%
%  getting_tank_data_binary('H:\Sly-180416al\Sly-180416', 1, 'xpz2', 96, 0, 0, 0, 'H:\Sly-180416_B1_AL');
% % 
%  getting_tank_data_binary('H:\Sly-180416ml\Sly-180416', 1, 'xpz5', 96, 0, 0, 0, 'H:\Sly-180416_B1_ML');
% % 
% % matToKiloSort('H:\Sly-180416_B1_AL.dat', 'H:\Sly-180416_B1_AL\', 96);
% % matToKiloSort('H:\Sly-180416_B1_ML.dat', 'H:\Sly-180416_B1_ML\', 96);
% % %%
% % num_channels=96;
% % BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180416\Block-2\';
% % SevSavePath='H:\Sly-180416al\Block-2sc\';
% % amp_var='xpz2';
% % [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% % 
% % num_channels=96;
% % BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180416\Block-2\';
% % SevSavePath='H:\Sly-180416ml\Block-2sc\';
% % amp_var='xpz5';
% % [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% % 
% % 
% % 
% % BlockPath='H:\Sly-180416al\Block-2sc\';
% % SevSavePath='H:\Sly-180416al\Sly-180416\Block-2\';
% % ch_group=4;
% % channels=96;
% % ndim_res=2;
% % amp_var='xpz2';
% % clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% % 
% % BlockPath='H:\Sly-180416ml\Block-2sc\';
% % SevSavePath='H:\Sly-180416ml\Sly-180416\Block-2\';
% % ch_group=4;
% % channels=96;
% % ndim_res=2;
% % amp_var='xpz5';
% % clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% % % %%
% % getting_tank_data_binary('H:\Sly-180416al\Sly-180416', 2, 'xpz2', 96, 0, 0, 0, 'H:\Sly-180416_B2_AL');
% % 
% % getting_tank_data_binary('H:\Sly-180416ml\Sly-180416', 2, 'xpz5', 96, 0, 0, 0, 'H:\Sly-180416_B2_ML');
% % %%
% % matToKiloSort('H:\Sly-180416_B2_AL.dat', 'H:\Sly-180416_B2_AL_test_2\', 4);
% % 
% % matToKiloSort('H:\Sly-180416_B2_ML.dat', 'H:\Sly-180416_B2_ML-test_2\', 4);
% 
% 
% 
% 
% % num_channels=96;
% % BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180417\Block-2\';
% % SevSavePath='H:\SAM-180417al\Block-2sc\';
% % amp_var='xpz2';
% % [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% % %%
% % num_channels=96;
% % BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180417\Block-2\';
% % SevSavePath='H:\SAM-180417ml\Block-2sc\';
% % amp_var='xpz5';
% % [sfml,sfal]=gettingscaling_factors(BlockPath,SevSavePath,amp_var);
% 
% % %%
% % 
% % BlockPath='H:\SAM-180417al\Block-2sc\';
% % SevSavePath='H:\SAM-180417al\SAM-180417\Block-2\';
% % ch_group=4;
% % channels=96;
% % ndim_res=2;
% % amp_var='xpz2';
% % clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% 
% BlockPath='H:\SAM-180417ml\Block-2sc\';
% SevSavePath='H:\SAM-180417ml\SAM-180417\Block-2\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz5';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% % %%
% getting_tank_data_binary('H:\SAM-180417al\SAM-180417', 2, 'xpz2', 96, 0, 0, 0, 'H:\SAM-180417_B2_AL');
% 
% getting_tank_data_binary('H:\SAM-180417ml\SAM-180417', 2, 'xpz5', 96, 0, 0, 0, 'H:\SAM-180417_B2_ML');
%%
% matToKiloSort('H:\SAM-180417_B2_AL.dat', 'H:\SAM-180417_B2_AL\', 96);
% 
% matToKiloSort('H:\SAM-180417_B2_ML.dat', 'H:\SAM-180417_B2_ML\', 96);

%%
% 
%  BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180416\Block-2\';
% SevSavePath='H:\Sly-180416al\Sly-180416\Block-2\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz2';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% 
% BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180416\Block-2\';
% SevSavePath='H:\Sly-180416ml\Sly-180416\Block-2\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz5';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% 
%  BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180416\Block-1\';
% SevSavePath='H:\Sly-180416al\Sly-180416\Block-1\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz2';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% 
% BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180416\Block-1\';
% SevSavePath='H:\Sly-180416ml\Sly-180416\Block-1\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz5';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% 

% 
% getting_tank_data_binary('H:\Sly-180416al\Sly-180416', 1, 'xpz2', 96, 0, 0, 0, 'H:\Sly-180416_B1_AL');
% matToKiloSort('H:\Sly-180416_B1_AL.dat', 'H:\Sly-180416_B1_AL\', 96);
% 
% getting_tank_data_binary('H:\Sly-180416ml\Sly-180416', 1, 'xpz5', 96, 0, 0, 0, 'H:\Sly-180416_B1_ML');
% matToKiloSort('H:\Sly-180416_B1_ML.dat', 'H:\Sly-180416_B1_ML\', 96);
% 
% 
% 
% getting_tank_data_binary('H:\Sly-180416al\Sly-180416', 2, 'xpz2', 96, 0, 0, 0, 'H:\Sly-180416_B2_AL');
% matToKiloSort('H:\Sly-180416_B2_AL.dat', 'H:\Sly-180416_B2_AL\', 96);
% 
% getting_tank_data_binary('H:\Sly-180416ml\Sly-180416', 2, 'xpz5', 96, 0, 0, 0, 'H:\Sly-180416_B2_ML');
% matToKiloSort('H:\Sly-180416_B2_ML.dat', 'H:\Sly-180416_B2_ML\', 96);


































% matToKiloSort('H:\SLY-180404_B1_AL.dat', 'H:\SLY-180404_B1_ALsd6\', 96);
% matToKiloSort('H:\SLY-180404_B1_ALtr.dat', 'H:\SLY-180404_B1_ALtrsd6\', 96);
% 
% 
% matToKiloSort('H:\SAM-171205_B2_AL.dat', 'H:\SLY-171205_B2_ALsd6\', 96);
% matToKiloSort('H:\SAM-171205_B2_ALtr.dat', 'H:\SLY-171205_B2_ALtrsd6\', 96);
% 
% matToKiloSort('H:\SAM-171205_B2_ML.dat', 'H:\SLY-171205_B2_MLsd6\', 96);
% matToKiloSort('H:\SAM-171205_B2_MLtr.dat', 'H:\SLY-171205_B2_MLtrsd6\', 96);
% 
% 
% matToKiloSort('H:\SAM-180326_B1_AL.dat', 'H:\SLY-180326_B1_ALsd6\', 96);
% matToKiloSort('H:\SAM-180326_B1_ALtr.dat', 'H:\SLY-180326_B1_ALtrsd6\', 96);
% 
% matToKiloSort('H:\SAM-180326_B1_ML.dat', 'H:\SLY-180326_B1_MLsd6\', 96);
% matToKiloSort('H:\SAM-180326_B1_MLtr.dat', 'H:\SLY-180326_B1_MLtrsd6\', 96);


% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-171205\Block-2\';
% SevSavePath='H:\SAM-171205al\SAM-171205\Block-2\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz2';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-171205\Block-2\';
% SevSavePath='H:\SAM-171205ml\SAM-171205\Block-2\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz5';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% 
% getting_tank_data_binary('H:\SAM-171205al\SAM-171205', 2, 'xpz2', 96, 0, 0, 0, 'H:\SAM-171205_B2_AL');
% matToKiloSort('H:\SAM-171205_B2_AL.dat', 'H:\SAM-171205_B2_AL\', 96);
% 
% getting_tank_data_binary('H:\SAM-171205ml\SAM-171205', 2, 'xpz5', 96, 0, 0, 0, 'H:\SAM-171205_B2_ML'); %saved in 171013
% matToKiloSort('H:\SAM-171205_B2_ML.dat', 'H:\SAM-171205_B2_ML\', 96);
% 
% 
% 
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180326\Block-1\';
% SevSavePath='H:\SAM-180326al\SAM-180326\Block-1\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz2';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180326\Block-1\';
% SevSavePath='H:\SAM-180326ml\SAM-180326\Block-1\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz5';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% 
% getting_tank_data_binary('H:\SAM-180326al\SAM-180326', 1, 'xpz2', 96, 0, 0, 0, 'H:\SAM-180326_B1_AL');
% matToKiloSort('H:\SAM-180326_B1_AL.dat', 'H:\SAM-180326_B1_AL\', 96);
% 
% getting_tank_data_binary('H:\SAM-180326ml\SAM-180326', 1, 'xpz5', 96, 0, 0, 0, 'H:\SAM-180326_B1_ML'); %saved in 171013
% matToKiloSort('H:\SAM-180326_B1_ML.dat', 'H:\SAM-180326_B2_ML\', 96);
% 














%Runing oe channel at the time

% files=dir('H:\SAM-171122ml\SAM-171122\Block-1dat\*.sev');
% 
% for n=5:length(files)
%     
% matToKiloSort(['H:\SAM-171122ml\SAM-171122\Block-1dat\' files(n).name], ['H:\SLY-180404_B1_AL\ch_' num2str(n)], 1);
% 
% end

%Running KS for both ML and AL BLock-1
num_channels=96;
% BlockPath='D:\SpikeSortingPipeline\Tanks\SLY-180404\Block-1\';
% SevSavePath='H:\SLY-180404al\SLY-180404\Block-1\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz2';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);
% BlockPath='D:\SpikeSortingPipeline\Tanks\SLY-180404\Block-1\';
% SevSavePath='H:\SLY-180404ml\SLY-180404\Block-1\';
% ch_group=4;
% channels=96;
% ndim_res=2;
% amp_var='xpz5';
% clean_sev(BlockPath,SevSavePath,channels,amp_var,ch_group,ndim_res);


% getting_tank_data_binary('H:\SLY-180404al\SLY-180404', 1, 'xpz2', 96, 0, 0, 0, 'H:\SLY-180404_B1_AL');
% matToKiloSort('H:\SLY-180404_B1_AL.dat', 'H:\SLY-180404_B1_AL\', 96);
% matToKiloSort('H:\SLY-180404_B1_ALtr.dat', 'H:\SLY-180404_B1_ALtr\', 96);

% getting_tank_data_binary('H:\SLY-180404ml\SLY-180404', 1, 'xpz5', 96, 0, 0, 0, 'H:\SLY-180404_B1_ML'); %saved in 171013
% matToKiloSort('H:\SLY-180404_B1_ML.dat', 'H:\SLY-180404_B1_ML\', 96);
% matToKiloSort('H:\SLY-180404_B1_MLtr.dat', 'H:\SLY-180404_B1_MLtr\', 96);

% getting_tank_data_binary('D:\SpikeSortingPipeline\Tanks\SAM-171011', 1, 'xpz2', 96, 0, 0, 0, 'H:\SLY-171011_B1_AL\SLY-171011_B1_AL');
% matToKiloSort('H:\SLY-171011_B1_AL\SLY-171011_B1_AL.dat', 'H:\SLY-171011_B1_AL\', 96);
% 
% getting_tank_data_binary('H:\SAM-171122ml\SAM-171122\Block-1dat\', 1, 'xpz2', 4, 0, 0, 0, 'H:\SAM-171122ml-4channel\SAM-171122ml-4channel');

%
% getting_tank_data_binary('H:\SAM-171122al\SAM-171122', 1, 'xpz2', 96, 0, 0, 0, 'H:\SAM-171122_B1_AL');
%matToKiloSort('H:\SAM-171122_B1_AL.dat', 'H:\SAM-171122_B1_AL_SD6\', 96);
%matToKiloSort('H:\SAM-171122_B1_ALtr.dat', 'H:\SAM-171122_B1_ALtr\', 96);
% 
% getting_tank_data_binary('H:\SAM-171122ml\SAM-171122', 1, 'xpz5', 96, 0, 0, 0, 'H:\SAM-171122_B1_ML'); %saved in 171013
%matToKiloSort('H:\SAM-171122_B1_ML.dat', 'H:\SAM-171122_B1_ML_SD6\', 96);
%matToKiloSort('H:\SAM-171122_B1_MLtr.dat', 'H:\SAM-171122_B1_MLtr\', 96);


%Running KS for both ML and AL BLock-1
% num_channels=96;
% %
% getting_tank_data_binary('H:\SAM-171013al\SAM-171013', 5, 'xpz2', 96, 0, 0, 0, 'H:\SAM-171013_B5_AL');
% matToKiloSort('H:\SAM-171013_B5_AL.dat', 'H:\SAM-171013_B5_AL\', 96);
% matToKiloSort('H:\SAM-171013_B5_ALtr.dat', 'H:\SAM-171013_B5_ALtr\', 96);
% 
% getting_tank_data_binary('H:\SAM-171013ml\SAM-171013', 5, 'xpz5', 96, 0, 0, 0, 'H:\SAM-171013_B5_ML');
% matToKiloSort('H:\SAM-171013_B5_ML.dat', 'H:\SAM-171013_B5_ML\', 96);
% matToKiloSort('H:\SAM-171013_B5_MLtr.dat', 'H:\SAM-171013_B5_MLtr\', 96);

% getting_tank_data_binary('H:\SAM-171220ml\SAM-171220', 1, 'xpz5', 96, 0, 0, 0, 'H:\Test_171220_B1_ML');
% matToKiloSort('H:\Test_171220_B1_ML.dat', 'H:\Test_171220_ML\', 96);
%matToKiloSort('H:\Test_171220_B1_MLtr.dat', 'H:\Test_171220_MLtr\', 96);

% getting_tank_data_binary('H:\SAM-171220al\SAM-171220', 1, 'xpz2', 96, 0, 0, 0, 'H:\Test_171220_B1_AL');
% matToKiloSort('H:\Test_171220_B1_aL.dat', 'H:\Test_171220_aL\', 96);
% matToKiloSort('H:\Test_171220_B1_altr.dat', 'H:\Test_171220_aLtr\', 96);
%  
 
%  getting_tank_data_binary('C:\work\SAM-171220al\SAM-171220', 2, 'xpz2', 96, 0, 0, 0, 'H:\Test_171220_AL');
% matToKiloSort('H:\Test_171220_AL.dat', 'H:\Test_171220_AL\', 96);
% matToKiloSort('H:\Test_171220_ALtr.dat', 'H:\Test_171220_ALtr\', 96);
%  
%  
%  
%  
% getting_tank_data_binary('D:\SpikeSortingPipeline\Tanks\SAM-180228', 1, 'xpz2', 96, 0, 0, 0, 'H:\Test_180228_AL');
% getting_tank_data_binary('D:\SpikeSortingPipeline\Tanks\SAM-180228', 1, 'xpz5', 96, 0, 0, 0, 'H:\Test_180228_ML');
% 
% matToKiloSort('H:\Test_180102_ML\Test_180228_ML.dat', 'H:\Test_180228_ML\', 32);
% matToKiloSort('H:\Test_180228_AL\Test_180228_AL.dat', 'H:\Test_180228_AL\', 32);
% 
% matToKiloSort('H:\Test_180228_AL\Test_180228_AL.dat', 'H:\Test_180228_AL_KiloOutput_new\', 32);
% % 
% 
% 
% 
% 
% cd('D:\SpikeSortingPipeline\Code');
% getting_tank_data('D:\SpikeSortingPipeline\Tanks\SAM-180102', 1, 'xpz2', 96, 0, 0, 0, 'H:\Test_180102_AL');
% getting_tank_data('D:\SpikeSortingPipeline\Tanks\SAM-180102', 1, 'xpz5', 96, 0, 0, 0, 'H:\Test_180102_ML');
% 
% getting_tank_data('D:\SpikeSortingPipeline\Tanks\SAM-180114', 2, 'xpz2', 96, 0, 0, 0, 'H:\Test_180114_AL');
% getting_tank_data('D:\SpikeSortingPipeline\Tanks\SAM-180114', 2, 'xpz5', 96, 0, 0, 0, 'H:\Test_180114_ML');
% 
% getting_tank_data('D:\SpikeSortingPipeline\Tanks\SAM-180114', 3, 'xpz2', 96, 0, 0, 0, 'H:\Test_180114_AL');
% getting_tank_data('D:\SpikeSortingPipeline\Tanks\SAM-180114', 3, 'xpz5', 96, 0, 0, 0, 'H:\Test_180114_ML');
% 
% matToKiloSort('H:\Test_180102_ML\SAM-180102_b1_ML.dat', 'H:\Test_180102b1_ML\', 96);
% matToKiloSort('H:\Test_180102_AL\SAM-180102_b1_AL.dat', 'H:\Test_180102b1_AL\', 96);
% 
% matToKiloSort('H:\Test_180114_ML\SAM-180102_b2_ML.dat', 'H:\Test_180102b2_ML\', 96);
% matToKiloSort('H:\Test_180114_AL\SAM-180102_b2_AL.dat', 'H:\Test_180102b2_AL\', 96);
% 
% 
% matToKiloSort('H:\Test_180114_ML\SAM-180114_b3_ML.dat', 'H:\Test_180102b3_ML\', 96);
% matToKiloSort('H:\Test_180114_ML\SAM-180114_b3_AL.dat', 'H:\Test_180102b3_AL\', 96);
% 




% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-180107\Block-2';
%    fpath='h:\SAM-180107_Block-2\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-180102\Block-1';
%    fpath='h:\SAM-180102_Block-1\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-180102\Block-2';
%    fpath='h:\SAM-180102_Block-2\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);


% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171205\Block-1';
%    fpath='h:\SAM-171205_Block-1\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171205\Block-2';
%    fpath='h:\SAM-171205_Block-2\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);

% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171130\Block-1';
%    fpath='h:\SAM-171130_Block-1\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171130\Block-2';
%    fpath='h:\SAM-171130_Block-2\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
%    
%    
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171130\Block-3';
%    fpath='h:\SAM-171130_Block-3\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
% 






% 
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171122\Block-1';
%    fpath='h:\SAM-171122_Block-1\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171116\Block-1';
%    fpath='h:\SAM-171116_Block-1\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);

% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171108\Block-1';
%    fpath='h:\SAM-171108_Block-1\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171108\Block-1';
%    fpath='h:\SAM-171108_Block-2\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);


% fbinary='D:\SpikeSortingPipeline\Tanks\Sly-171107\Block-1';
%    fpath='h:\SAM-171117_Block-1\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\Sly-171107\Block-2';
%    fpath='h:\SAM-171117_Block-2\KiloSort';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
% 
%    
%     fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171017\Block-1';
%   fpath='h:\SAM-171017_Block-1\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);

% %Getting binary
% getting_tank_data('D:\SpikeSortingPipeline\Tanks\SAM-171015',1,'xpz2',96,1,0,0,'D:\SpikeSortingPipeline\ToSort');
% %ML
% getting_tank_data('D:\SpikeSortingPipeline\Tanks\SAM-171015',1,'xpz5',96,1,0,0,'D:\SpikeSortingPipeline\ToSort\ML');
% 
% 
% fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171013\Block-6';
%   fpath='h:\SAM-171013_Block-6\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);

% 
%  fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171027\Block-1';
%   fpath='h:\SAM-171027_Block-1\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171027\Block-2';
%   fpath='h:\SAM-171027_Block-2\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);


% 

%  fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171018\Block-1';
%   fpath='h:\SAM-171018_v2_Block-1\KiloSort';
%   matToKiloSort_v2(fbinary,fpath,num_channels);
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171018\Block-2';
%   fpath='h:\SAM-171018_v2_Block-2\KiloSort';
%   matToKiloSort_v2(fbinary,fpath,num_channels);
%   
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171018\Block-3';
%   fpath='h:\SAM-171018_v2_Block-3\KiloSort';
%   matToKiloSort_v2(fbinary,fpath,num_channels);
%   
%   
%  fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171018\Block-4';
%   fpath='h:\SAM-171018_v2_Block-4\KiloSort';
%   matToKiloSort_v2(fbinary,fpath,num_channels);
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171018\Block-5';
%   fpath='h:\SAM-171018_v2_Block-5\KiloSort';
%   matToKiloSort_v2(fbinary,fpath,num_channels);
%   
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171018\Block-6';
%   fpath='h:\SAM-171018_v2_Block-6\KiloSort';
%   matToKiloSort_v2(fbinary,fpath,num_channels);






%  fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171017\Block-1';
%   fpath='h:\SAM-171017_Block-1\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171017\Block-2';
%   fpath='h:\SAM-171017_Block-2\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171017\Block-3';
%   fpath='h:\SAM-171017_Block-3\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%   
%  fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171017\Block-4';
%   fpath='h:\SAM-171017_Block-4\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171017\Block-5';
%   fpath='h:\SAM-171017_Block-5\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171017\Block-6';
%   fpath='h:\SAM-171017_Block-6\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);




%  fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171015\Block-1';
%   fpath='h:\SAM-171015_Block-1\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171015\Block-2';
%   fpath='h:\SAM-171015_Block-2\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%   
%    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171015\Block-3';
%   fpath='h:\SAM-171015_Block-3\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
















%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171013\Block-6';
%   fpath='h:\SAM-171013_Block-6\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
% %%
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171013\Block-5';
%   fpath='h:\SAM-171013_Block-5\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   














% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-171012\Block-1';
%   fpath='h:\SAM-171012_Block-1\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171012\Block-2';
%   fpath='h:\SAM-171012_Block-2\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171012\Block-3';
%   fpath='h:\SAM-171012_Block-3\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171012\Block-4';
%   fpath='h:\SAM-171012_Block-4\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
  
  

%   getting_tank_data('d:\SpikeSortingPipeline\Tanks\SAM-171011\', 6, 'xpz2', chan_num, 1, 1, 0, ...
%                 ['H:\test\AL']);
%             disp('Converting ML data... ');
%             getting_tank_data('d:\SpikeSortingPipeline\Tanks\SAM-171011\', 6, 'xpz5', chan_num, 1, 1, 0, ...
%                 ['H:\test\ML']);
%             
%             %%
%              fbinary='H:\test\al\SAM-171011.dat';
%    fpath='H:\test\KiloSort_6';
%    matToKiloSort_v2(fbinary,fpath,96);
%  
%  %%
%    fbinary='H:\test\al';
%    fpath='H:\test\KiloSort_6';
%    matToKiloSort_v3(fbinary,fpath,num_channels);
 
%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171011\Block-6';
%   fpath='h:\SAM-171011_Block-6\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels); 
%  
% %    fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171004\Block-1';
% %   fpath='h:\SAM-171004_Block-1\KiloSort_6';
% %   matToKiloSort_v3(fbinary,fpath,num_channels);
% %  
%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171004\Block-2';
%   fpath='h:\SAM-171004_Block-2\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
  %%
%     fbinary='d:\SpikeSortingPipeline\Tanks\SAM-171004\Block-3';
%   fpath='h:\SAM-171004_Block-3\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%   
%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-170929\Block-3';
%   fpath='h:\SAM-170929_Block-3\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
% 
%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-170929\Block-2';
%   fpath='h:\SAM-170929_Block-2\KiloSort_6';
%   matToKiloSort_v3(fbinary,fpath,num_channels);

 %%
%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-170929\Block-2';
%   fpath='h:\SAM-170929_Block-2\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%  
%   fbinary='d:\SpikeSortingPipeline\Tanks\SAM-170929\Block-3';
%   fpath='h:\SAM-170929_Block-3\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
 
 
%   fbinary='f:\SpikeSortingPipeline\Tanks\SAM-170928\Block-2';
%   fpath='h:\SAM-170928_Block-2\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%  
%   fbinary='f:\SpikeSortingPipeline\Tanks\SAM-170928\Block-3';
%   fpath='h:\SAM-170928_Block-3\KiloSort';
%   matToKiloSort_v3(fbinary,fpath,num_channels);
%  
  
% fbinary='f:\SpikeSortingPipeline\Tanks\SAM-170919\Block-1';
% fpath='h:\SAM-170919_Block-3\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
%  
% fbinary='f:\SpikeSortingPipeline\Tanks\SAM-170919\Block-2';
% fpath='h:\SAM-170919_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
 
%  
%  fbinary='f:\SpikeSortingPipeline\Tanks\SAM-170913\Block-3';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170913_Block-3\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
%  
% fbinary='f:\SpikeSortingPipeline\Tanks\SAM-170913\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170913_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
 
 
 
 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170911\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170911_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
 
 
 
 
 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170824\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170824_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170824\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170824_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170824\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170824_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 





% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170804\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170804_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
%  
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170804\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170804_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
%  
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170804\Block-3';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170804_Block-3\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
%  
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170802\Texture-170802-111618';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170802_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
 
% fbinary='D:\SpikeSortingPipeline\Tanks\Jul27_17_192ch_sr25k\Block-1';
% fpath='f:\SpikeSortingPipeline\Tanks\Jul27_17_192ch_sr25k_Block-1\KiloSort';
% matToKiloSort_v4(fbinary,fpath,num_channels);

% fbinary='D:\SpikeSortingPipeline\Tanks\Jul26_17_192ch_sr25k\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\Jul26_17_192ch_sr25k_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);


% %Later
% fbinary='D:\SpikeSortingPipeline\Tanks\Jul25_17_192ch_sr25k\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\Jul25_17_192ch_sr25k_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\Jul12_17_192ch_sr25k\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\Jul12_17_192ch_sr25k_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\Jul13b_17_192ch_sr25k\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\Jul13b_17_192ch_sr25k_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);

%%%STRF

% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170802\Texture-170802-134744';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170802_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
%  
% fbinary='D:\SpikeSortingPipeline\Tanks\Jul27_17_192ch_sr25k\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\Jul27_17_192ch_sr25k_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\Jul26_17_192ch_sr25k\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\Jul26_17_192ch_sr25k_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\Jul25_17_192ch_sr25k\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\Jul25_17_192ch_sr25k_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\Jul12_17_192ch_sr25k\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\Jul12_17_192ch_sr25k_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\Jul13b_17_192ch_sr25k\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\Jul13b_17_192ch_sr25k_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);

 

 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170817\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170817_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);

% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170817\Block-3';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170817_Block-3\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);

% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170815\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170815_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);

% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170815\Block-3';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170815_Block-3\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);


% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170811\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170811_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170811\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170811_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170809\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170809_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170809\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170809_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170807\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170807_Block-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170807\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170807_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);

%need yo add this ones
% fbinary='F:\SAM-170818\Block-1';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170818_Bloclck-1\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);

% fbinary='F:\SAM-170818\Block-2';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170818_Block-2\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);
% 
% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170815\Block-4';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170815_Block-4\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels);


% fbinary='D:\SpikeSortingPipeline\Tanks\SAM-170817\Block-4';
% fpath='F:\SpikeSortingPipeline\Sorted\SAM-170817_Block-4\KiloSort';
% matToKiloSort_v3(fbinary,fpath,num_channels)