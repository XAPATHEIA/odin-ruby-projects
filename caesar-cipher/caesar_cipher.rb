def caesar_cipher(phrase, shift_factor)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    alphabet_upcase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    alphabet_list = alphabet.split('')
    alphabet_upcase_list = alphabet_upcase.split('')
    phrase_list = phrase.split('')
    phrase_list.each_with_index do |character, index|
        lowercase_letter_index = alphabet_list.find_index(character)
        uppercase_letter_index = alphabet_upcase_list.find_index(character)
        if lowercase_letter_index != nil
            phrase_list[index] = alphabet_list[((lowercase_letter_index + shift_factor) % 26)]
        elsif uppercase_letter_index != nil
            phrase_list[index] = alphabet_upcase_list[((uppercase_letter_index + shift_factor) % 26)]
        end
    end
    return phrase_list.join
end


puts caesar_cipher("eazy!!!!", 4)