
word = ARGV[0].downcase.strip

if !ARGV[1].nil? then
	pattern = ARGV[1].downcase.strip
end

##
## Simple Ceasar
##

add = [0]
i=0
while add[i] <= 25 do
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
      puts "+#{add[i]} #{guess}"
    end
  else
    puts "+#{add[i]} #{guess}"
  end
  add[i] = add[i] + 1
end

