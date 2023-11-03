dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings(word, array_of_substrings)
    separate_words = word.scan(/\b\w+\b/).map {|input_word| input_word.downcase}
    occurence_hash = Hash.new()
    array_of_substrings.each do |word|
        if separate_words.include?(word)
            occurence_hash[word] = separate_words.count(word)
        end
    end
    return occurence_hash
end

puts substrings("Howdy howdy partner, sit down! How's it going mate?", dictionary)