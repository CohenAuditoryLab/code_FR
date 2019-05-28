% metaf={'H:\meta\SAM-180705_meta.mat',...
%     'H:\meta\SAM-180608_meta.mat'};
% 
% alf={'H:\SAM-180705al\SAM-180705\Block-1wav\Results\Times\times_SAM-180705_Block-1_ch','H:\SAM-180606al\SAM-180608\Block-2wav\Results\Times\times_SAM-180608_Block-2_ch'};
% 
% amf={'H:\SAM-180705ml\SAM-180705\Block-1wav\Results\Times\times_SAM-180705_Block-1_ch','H:\SAM-180606ml\SAM-180608\Block-2wav\Results\Times\times_SAM-180608_Block-2_ch'};
% 
% rasterpath={'H:\SAM-180705al\raster_results\channel_','H:\SAM-180705ml\raster_results\channel_','H:\SAM-180608al\raster_results\channel_','H:\SAM-180608ml\raster_results\channel_'};
% 
% 
% raster_per_sound_wc(metaf{1},alf{1},rasterpath{1});
% 
% raster_per_sound_wc(metaf{1},amf{1},rasterpath{2});
% 
% raster_per_sound_wc(metaf{2},alf{2},rasterpath{3});
% 
% raster_per_sound_wc(metaf{2},amf{2},rasterpath{4});

%%

raster_per_sound_wc('H:\meta\SAM-180403_meta.mat','H:\SAM-180403al\SAM-180403\Block-1wav\Results\Times\times_SAM-180403_Block-1_ch','H:\SAM-180403al\raster_results\channel_');

raster_per_sound_wc('H:\meta\SAM-180403_meta.mat','H:\SAM-180403ml\SAM-180403\Block-1wav\Results\Times\times_SAM-180403_Block-1_ch','H:\SAM-180403ml\raster_results\channel_');