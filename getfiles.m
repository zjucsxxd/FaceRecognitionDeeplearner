function mylist = getfiles(category)

%Get Face List
mylist = [];
cd(category);
path = cd;
count = 0;
fdir = dir;
for i=3:size(fdir,1)
  filename = fdir(i).name;
  ext = filename(end-2:end);
  if (strcmp(ext,'jpg'))
    count = count + 1;
    mylist{count} = [path '/' filename];
  end
end
cd ..