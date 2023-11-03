dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings(word, array_of_substrings)
    separate_words = words.scan("/\b\w+\b").map {|word| word.downcase}
    occurence_hash = Hash.new()
    dictionary.each do |word|
        if word in separate_words
            occurence_hash[word] = separate_words.count(word)
        end
    end
    return occurence_hash
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)