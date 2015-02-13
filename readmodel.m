function readmodel


%Init
clc;



%Read
vector1 = [];
vector2 = [];
fid = fopen('models/3class.java','r');
while 1
  tline = fgetl(fid);
  if ~ischar(tline)
    break
  end
  if ~isempty(strfind(tline,'static final class Weight_1_0'))
    tline = fgetl(fid);
    while isempty(strfind(tline(1),'}'))
      tline = fgetl(fid);
      [left,right] = strtok(tline,'=');
      value = str2num(right(2:end-2));
      if (~isempty(value))
        vector1 = [vector1 ; value];
      end
    end
  end
  if ~isempty(strfind(tline,'static final class Weight_2_0'))
    tline = fgetl(fid);
    while isempty(strfind(tline(1),'}'))
      tline = fgetl(fid);
      [left,right] = strtok(tline,'=');
      value = str2num(right(2:end-2));
      if (~isempty(value))
        vector2 = [vector2 ; value];
      end
    end
  end
end
fclose(fid);



%Reshape
L1 = reshape(vector1,64*64,12);
L2 = reshape(vector2,12,6);



for i=1:6
  W = L1 * L2(:,i);
  W = reshape(W,64,64);
  subplot(2,3,i);
	imagesc(W);
  colormap gray;
end
