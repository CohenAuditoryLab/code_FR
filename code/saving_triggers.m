function saving_triggers(path,tankname,block_number,destination_folder)
%This function will save the trigger in the trigger folder
%(z:\Francisco\triggers)
%tankname=path(end-9:end);
pathtemp=fullfile(path,['block-' num2str(block_number)],[tankname '_' 'block-' num2str(block_number) '_xpz5_ch66.sev']);
%path='D:\SpikeSortingPipeline\Tanks\SAM-190521\Block-2\SAM-190521_Block-2_xpz5_ch66.sev';
[TrigA,TrigB]=getting_triggers(pathtemp);
save(fullfile(destination_folder,[tankname '_b' num2str(block_number) '_triggers']),'TrigA','TrigB');
end
