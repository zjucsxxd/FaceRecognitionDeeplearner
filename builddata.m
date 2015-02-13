function builddata

%Init
clc;
xsize = 64;




%Get Available files in each category
facefiles = getfiles('faces');
catfiles = getfiles('catfaces');
objectfiles = getfiles('random');




%Randomize lists
facefiles = randomizelist(facefiles);
catfiles = randomizelist(catfiles);
objectfiles = randomizelist(objectfiles);




%Training data
fid = fopen('train.csv','w');
fidtext = fopen('traintext.csv','w');
for j=1:xsize.^2
  fprintf(fid,'pixel%d,',j);
end
Xtrain = zeros(500*3,(64*64)+1);
count = 0;
fprintf(fid,'y\n');
for i=1:500
  disp(['Train ' num2str(i)]);
  %fprintf(fidtext,'%s\n',facefiles{i});
  fprintf(fidtext,'%s\n',catfiles{i});
  fprintf(fidtext,'%s\n',objectfiles{i});
  %face = processimage(facefiles{i},xsize);
  cat = processimage(catfiles{i},xsize);
  object = processimage(objectfiles{i},xsize);
  %face(end+1) = 0;
  cat(end+1) = 1;
  object(end+1) = 2;
  %count = count + 1;Xtest(count,:) = face;
  count = count + 1;Xtest(count,:) = cat;
  count = count + 1;Xtest(count,:) = object;
  %writevector(fid,face);
  writevector(fid,cat);
  writevector(fid,object);
end
fclose(fid);
fclose(fidtext);




%Testing data
fidtext = fopen('testtext.csv','w');
fid = fopen('test.csv','w');
for j=1:xsize.^2
  fprintf(fid,'pixel%d,',j);
end
Xtest = zeros(500*3,(64*64)+1);
count = 0;
fprintf(fid,'y\n');
for i=501:1000
  disp(['Test ' num2str(i)]);
  %fprintf(fidtext,'%s\n',facefiles{i});
  fprintf(fidtext,'%s\n',catfiles{i});
  fprintf(fidtext,'%s\n',objectfiles{i});
  %face = processimage(facefiles{i},xsize);
  cat = processimage(catfiles{i},xsize);
  object = processimage(objectfiles{i},xsize);
  %face(end+1) = 0;
  cat(end+1) = 1;
  object(end+1) = 2;
  %count = count + 1;Xtest(count,:) = face;
  count = count + 1;Xtest(count,:) = cat;
  count = count + 1;Xtest(count,:) = object;
  %writevector(fid,face);
  writevector(fid,cat);
  writevector(fid,object);
end
fclose(fid);
fclose(fidtext);




%Save
save('train.mat','Xtrain');
save('test.mat','Xtest');