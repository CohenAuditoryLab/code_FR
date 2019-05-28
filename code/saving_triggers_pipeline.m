function saving_triggers_pipeline(path,block_number)
%This function will save the trigger in the trigger folder
destination_folder='z:\Francisco\triggers';
%path='D:\SpikeSortingPipeline\Tanks\SAM-190521\Block-2\SAM-190521_Block-2_xpz5_ch66.sev';
a=strfind(path,'SAM');
b=strfind(path,'SLY');
c=strfind(path,'\');
if ~isempty(a)
    d=c(c>a);d=d(1);
    tankname=path(a:d-1);
elseif ~isempty(b)
    d=c(c>b);d=d(1);
    tankname=path(b:d-1);
end
pathtemp=fullfile(path,[tankname '_' 'block-' num2str(block_number) '_xpz5_ch66.sev']);

[TrigA,TrigB]=getting_triggers(pathtemp);
save(fullfile(destination_folder,[tankname '_b' num2str(block_number) '_triggers']),'TrigA','TrigB');
end
