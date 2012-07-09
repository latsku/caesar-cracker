
word = ARGV[0].downcase.strip

if !ARGV[1].nil? then
	pattern = ARGV[1].downcase.strip
end

##
## Simple Ceasar
##

i=0
while i <= 25 do
  guess=''
  word.bytes do |p|
    if p != 32 then
      guess.concat(((((p-97)+i) % 26) + 97 ))
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
end

