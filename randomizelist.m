function newlist = randomizelist(mylist)

%Init
newlist = [];


%Randomize
randval = randperm(numel(mylist));
for i=1:numel(randval)
  newlist{i} = mylist{randval(i)};
end


