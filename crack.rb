
word = ARGV[0].downcase.strip

if !ARGV[1].nil? then
	pattern = ARGV[1].downcase.strip
end

##
## Simple Ceasar
##

add = [0]
i=0
while i <= 25 do
  guess=''
  x=0
  word.bytes do |p|
    if p != 32 then
      guess.concat  (( p - 97 + add[x] ) % 26 ) + 97 
      x = ( x + 1 ) % add.size
    else
      guess.concat ' '
    end
  end
  if !pattern.nil? then
    if guess.include? pattern then
      puts "+#{i} #{guess}"
    end
  else
    puts "+#{i} #{guess}"
  end
  i=i+1
  add[0]=i
end

