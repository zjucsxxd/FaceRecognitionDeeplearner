function writevector(fid,vector)

%Write
for j=1:numel(vector)-1
  fprintf(fid,'%f,',vector(j));
end
fprintf(fid,'%f\n',vector(end));