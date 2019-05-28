function sort_data_ks2(ffolder,number_channels,config_file)
%Will take the .dat binary file and sort it using Kilosort 
%will save sorting results in that folder, data can be accessed using phy
%and spikes
%Config file is by default 'Config_96_linear.m', look at the folder
%c:\work\config_files_kilosort2 for other options (i.e 64channels)
%
%Input Arguments
if nargin<2
    number_channels=96;
end
if nargin<3
    if number_channels==96
    config_file='Config_96_linear.m';
    elseif number_channles==64
        config_file='Config_64_linear.m';
    end
end
%adding kilosort2 folders
addpath(genpath('C:\work\KiloSort2')); % path to kilosort folder
addpath('C:\work\npy-matlab');
pathToYourConfigFile = 'C:\work\config_files_kilosort2'; 
run(fullfile(pathToYourConfigFile, config_file))
%Folder for temporal Ks2 file
rootH = 'C:\work';
ops.fproc       = fullfile(rootH, 'temp_wh.dat'); % proc file on a fast SSD
ops.trange = [0 Inf]; % time range to sort
ops.NchanTOT    = number_channels; % total number of channels in your recording
% this block runs all the steps of the algorithm
%ffolder=folder(ff).folder;
fprintf('Looking for data inside %s \n\n\n', ffolder)
% find the binary file
fs          = [dir(fullfile(ffolder, '*.bin')) dir(fullfile(ffolder, '*.dat'))];
ops.fbinary = fullfile(ffolder,fs.name);
% preprocess data to create temp_wh.dat
rez = preprocessDataSub(ops);
% time-reordering as a function of drift
rez = clusterSingleBatches(rez);
save(fullfile(ffolder, 'rez.mat'), 'rez', '-v7.3');
% main tracking and template matching algorithm
rez = learnAndSolve8b(rez);
% final merges
rez = find_merges(rez, 1);
% final splits by SVD
rez = splitAllClusters(rez, 1);
% final splits by amplitudes
rez = splitAllClusters(rez, 0);
% decide on cutoff
rez = set_cutoff(rez);
fprintf('found %d good units \n', sum(rez.good>0))
% write to Phy
fprintf('Saving results to Phy  \n')
rezToPhy(rez, fullfile(ffolder));
%% if you want to save the results to a Matlab file... 
% discard features in final rez file (too slow to save)
rez.cProj = [];
rez.cProjPC = [];
% save final results as rez2
fprintf('Saving final results in rez2  \n\n')
file_name = fullfile(ffolder, 'rez2.mat');
save(file_name, 'rez', '-v7.3');

