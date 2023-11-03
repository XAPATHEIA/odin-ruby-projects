dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings(word, array_of_substrings)
    separate_words = word.scan(/\b\w+\b/).map {|input_word| input_word.downcase}
    occurence_hash = Hash.new()
    array_of_substrings.each do |array_word|
        if separate_words.include?(array_word)
            occurence_hash[array_word] = separate_words.count(array_word)
        end
        separate_words.each do |single_word|
            if single_word.include?(array_word) && single_word.length != array_word.length
                if occurence_hash.has_key?(array_word)
                    occurence_hash[array_word] += 1
                else
                    occurence_hash[array_word] = 1
                end
            end
        end
    end
    return occurence_hash
end

puts substrings("Howdy howdy partner, sit down! How's it going mate?", dictionary)