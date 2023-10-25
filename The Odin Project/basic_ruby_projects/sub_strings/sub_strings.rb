#Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. 
#It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
def substrings(words, dictionary)
    downcasedWords = words.downcase #bitch you're lowercase now
    arrayOfDowncasedWords = downcasedWords.split(" ") #this takes the user provided 'words' and converts it into an array of words, downcased, and separated by the user provided spaces.
     # *** https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods - scroll to reduce section
    results = arrayOfDowncasedWords.reduce(Hash.new(0)) do |instances, word| 
        instances[word] += 1
        instances
    end
    results
end
#> dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#=> ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#> substrings("below", dictionary)
#=> { "below" => 1, "low" => 1 }

#Next, make sure your method can handle multiple words:

#> substrings("Howdy partner, sit down! How's it going?", dictionary)
#=> { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }

#Please note the order of your keys might be different.