
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
	word.chars {|p| gues.concat(((((p.ord-97)+i) % 26) + 97 ).chr)}
	if !pattern.nil? then
		if gues.include? pattern then
			puts "+#{i} #{gues}"
		end
		else
		puts "+#{i} #{gues}"
	end
	i=i+1
end

