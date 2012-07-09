
word = ARGV[0].downcase.strip

if !ARGV[1].nil? then
	pattern = ARGV[1].downcase.strip
end

##
## Simple Ceasar
##

i=0
while i <= 25 do
  gues=''
  word.bytes do |p|
    if p != 32 then
      gues.concat(((((p-97)+i) % 26) + 97 ))
    else
      gues.concat ' '
    end
  end
  if !pattern.nil? then
    if gues.include? pattern then
      puts "+#{i} #{gues}"
    end
  else
    puts "+#{i} #{gues}"
  end
  i=i+1
end

