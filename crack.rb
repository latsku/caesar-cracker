word = ARGV[0].downcase.strip

if !ARGV[1].nil? then
	pattern = ARGV[1].downcase.strip
end

def incr_and_print(ciphertext,array,index,pattern)
	while array[index] <= 25 do
		crack(ciphertext,array,pattern)
		if index > 0 
			incr_and_print(ciphertext,array,index-1,pattern)
		end
		array[index] = array[index] + 1
	end
	array[index] = 0
end

def crack (ciphertext,keyarray,pattern)
	guess=''
	x=0
	ciphertext.bytes do |p|
		if p != 32 then
			guess.concat  (( p - 97 + keyarray[x] ) % 26 ) + 97 
			x = ( x + 1 ) % keyarray.size
		else
			guess.concat ' '
		end
	end
	if !pattern.nil? then
		if guess.include? pattern then
			puts "+#{keyarray} #{guess}"
		end
	else
		puts "+#{keyarray} #{guess}"
	end	
end

##
## Complex Ceasar
##

add = [0]
i=add.size-1

incr_and_print(word,add,i,pattern)

