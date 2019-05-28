num_channels=96;
ch_group=4;channels=96;ndim_res=2;



%Sly May3 STRF
%B2
% BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180503\Block-2\';
% SevSavePath='H:\Sly-180503al\Block-2sc\'; amp_var='xpz2';
% [sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\Sly-180503al\Block-2sc\'; 
% SevSavePath='H:\Sly-180503al\Sly-180503al\Block-2\';
% clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)
% 
% files_path='H:\Sly-180503al\Sly-180503al\Block-2wav\';stdmin=4;
% main_wave_clus(files_path,stdmin)
%%
% 
BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180503\Block-2\';
SevSavePath='H:\Sly-180503a1\Block-2sc\';
amp_var='xpz5';
[sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);

BlockPath='H:\Sly-180503a1\Block-2sc\'; 
SevSavePath='H:\Sly-180503a1\Sly-180503a1\Block-2\';
clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)

files_path='H:\Sly-180503a1\Sly-180503a1\Block-2wav\';stdmin=4;
main_wave_clus(files_path,stdmin)




% %Sly May3 STRF
% %B1
% BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180503\Block-1\';
% SevSavePath='H:\Sly-180503al\Block-1sc\'; amp_var='xpz2';
% [sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\Sly-180503al\Block-1sc\'; 
% SevSavePath='H:\Sly-180503al\Sly-180503al\Block-1\';
% clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)
% 
% files_path='H:\Sly-180503al\Sly-180503al\Block-1wav\';stdmin=4;
% main_wave_clus(files_path,stdmin)
% 
% % 
% BlockPath='D:\SpikeSortingPipeline\Tanks\Sly-180503\Block-1\';
% SevSavePath='H:\Sly-180503a1\Block-1sc\';
% amp_var='xpz5';
% [sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\Sly-180503a1\Block-1sc\'; 
% SevSavePath='H:\Sly-180503a1\Sly-180503a1\Block-1\';
% clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)
% 
% files_path='H:\Sly-180503a1\Sly-180503a1\Block-1wav\';stdmin=4;
% main_wave_clus(files_path,stdmin)
% 

%SAM May 1
%STRF
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180501\Block-2\';
% SevSavePath='H:\SAM-180501al\Block-2sc\'; amp_var='xpz2';
% [sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\SAM-180501al\Block-2sc\';
% SevSavePath='H:\SAM-180501al\SAM-180501al\Block-2\';
% clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)
% 
% files_path='H:\SAM-180501al\SAM-180501al\Block-2wav\';stdmin=4;
% main_wave_clus(files_path,stdmin)
% 
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180501\Block-2\';
% SevSavePath='H:\SAM-180501ml\Block-2sc\';
% amp_var='xpz5';
% [sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\SAM-180501ml\Block-2sc\';
% SevSavePath='H:\SAM-180501ml\SAM-180501ml\Block-2\';
% clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)
% 
% files_path='H:\SAM-180501ml\SAM-180501ml\Block-2wav\';stdmin=4;
% main_wave_clus(files_path,stdmin)
% 
% 
% %SAM March 26
% %B1 STRF normal
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180326\Block-1\';
% SevSavePath='H:\SAM-180326al\Block-1sc\'; amp_var='xpz2';
% [sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\SAM-180326al\Block-1sc\';
% SevSavePath='H:\SAM-180326al\SAM-180326al\Block-1\';
% clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)
% 
% files_path='H:\SAM-180326al\SAM-180326al\Block-1wav\';stdmin=4;
% main_wave_clus(files_path,stdmin)
% 
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180326\Block-1\';
% SevSavePath='H:\SAM-180326ml\Block-1sc\';
% amp_var='xpz5';
% [sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\SAM-180326ml\Block-1sc\';
% SevSavePath='H:\SAM-180326ml\SAM-180326ml\Block-1\';
% clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)
% 
% files_path='H:\SAM-180326ml\SAM-180326ml\Block-1wav\';stdmin=4;
% main_wave_clus(files_path,stdmin)
% 
% %B2 texture
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180326\Block-2\';
% SevSavePath='H:\SAM-180326al\Block-2sc\'; amp_var='xpz2';
% [sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\SAM-180326al\Block-2sc\';
% SevSavePath='H:\SAM-180326al\SAM-180326al\Block-2\';
% clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)
% 
% files_path='H:\SAM-180326al\SAM-180326al\Block-2wav\';stdmin=4;
% main_wave_clus(files_path,stdmin)
% 
% BlockPath='D:\SpikeSortingPipeline\Tanks\SAM-180326\Block-2\';
% SevSavePath='H:\SAM-180326ml\Block-2sc\';
% amp_var='xpz5';
% [sfml,sfal]=gettingscaling_factors_v2(BlockPath,SevSavePath,amp_var);
% 
% BlockPath='H:\SAM-180326ml\Block-2sc\';
% SevSavePath='H:\SAM-180326ml\SAM-180326ml\Block-2\';
% clean_sev_v2(BlockPath,SevSavePath,channels,ch_group,ndim_res,0,1)
% 
% files_path='H:\SAM-180326ml\SAM-180326ml\Block-2wav\';stdmin=4;
% main_wave_clus(files_path,stdmin)

%Getting Triggers
%STRF_WC
