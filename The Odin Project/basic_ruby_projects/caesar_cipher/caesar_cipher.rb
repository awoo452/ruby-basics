#Implements a caesar cipher that takes in a string and the shift factor and then outputs the modified string
#It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. 
#For example, with a left shift of 3, D would be replaced by A, E would become B, and so on.

#> caesar_cipher("What a string!", 5)
#=> "Bmfy f xywnsl!"

    #This was fun, but this whole ass project could be revisited using chr or whatever https://ruby-doc.org/core-2.3.1/Integer.html#method-i-chr

    # *** https://www.digitalocean.com/community/tutorials/how-to-use-irb-to-explore-ruby#loading-your-code-into-irb 
    # irb -r ./caesar_cipher.rb will open this file in terminal

def caesar_cipher(string, shift_factor)
        # *** https://stackoverflow.com/questions/4846853/generate-array-of-all-letters-and-digits 
        # *** https://apidock.com/ruby/Kernel/Array/instance
    alphabet = 'a'.upto('z').to_a #This establishes an Array containing the alphabet, separated by letter
    alphabetButBigger = 'A'.upto('Z').to_a
    alphabet.push(*alphabetButBigger)
        # *** https://stackoverflow.com/questions/6085518/what-is-the-easiest-way-to-push-an-element-to-the-beginning-of-the-array
    alphabet.unshift(" ") #This adds compatibility for strings containing spaces. This can be revisited to further expand compatibility for provided characters but the logic is there. 
    stringConvertedToArray = string.split("") #This takes the user provided "string", and converts it into an array separated by each individual character in the user provided string.
        # *** https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods - Scroll to Map section
        # *** https://apidock.com/ruby/Array/index
    arrayConvertedFromStringsToCharacters = stringConvertedToArray.map { |letter| alphabet.index(letter) } #for each letter in stringConvertedToArray, find the corresponding letter in the alphabet array and replace with the index of that letter within the alphabet.
    shiftFactoredArrayOfNumbers = arrayConvertedFromStringsToCharacters.map { |number| number + shift_factor } #add the user provided 'shift_factor' to each corresponding number within this array.
        # *** https://stackoverflow.com/questions/26415380/replace-a-single-element-in-an-array
    shiftFactoredArrayOfNumbersWithoutOvers = shiftFactoredArrayOfNumbers.map { |number| number >= alphabet.count() ? number -= alphabet.count() : number } #If after shift factoring the number, the total is > the total number of characters in the alphabet array, restart at the beginning of the alphabet array
    shiftFactoredArrayOfNumbersWithoutOversOrUnders = shiftFactoredArrayOfNumbersWithoutOvers.map { |number| number < 0 ? number += alphabet.count() : number } #If after shift factoring the number, the total is < 0, reset the count by adding the total number of characters in the alphabet array so that it loops from z-a 
    shiftFactoredArrayOfCharacters = shiftFactoredArrayOfNumbersWithoutOversOrUnders.map { |number| alphabet[number] } #This compares the shifted number to the corresponding value contained at that index in the alphabet array and creates a new array containing these 'shifted' characters, thus completing the cipher
    print shiftFactoredArrayOfCharacters
end