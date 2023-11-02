dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


def substrings(word, array_of_substrings)
    split_word = word.split()
    occurence_hash = Hash.new()
    split_word.each do |word|
        if word.downcase in array_of_substrings
            occurence_hash[word] = array_of_substrings.count(word)
        end
    end
    return occurence_hash
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)