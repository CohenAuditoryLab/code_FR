%Reads master list and calculates triggers
%path,block_number,destination_folder
 %saving_triggers(path,tankname,block_number,destination_folder)
path='D:\SpikeSortingPipeline\Tanks';
destination_folder='z:\Francisco\triggers';
load('SAM_master_list_old_format.mat')
for n=394:487
   tankname= char(rawtable{n,4});
   fullpath=fullfile(path,tankname); 
   task=char(rawtable{n,7});
   block_number=rawtable{n,6};
   if length(task)>3
       task=task(1:4);
   end
   if ~isempty(task) && strcmp(task,'STRF') && length(task)>3 && length(task)<5
        saving_triggers(fullpath,tankname,block_number,destination_folder)
               
   end
end