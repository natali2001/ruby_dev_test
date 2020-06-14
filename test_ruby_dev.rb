def encrypt(input, n)
    result = Array.new
    oddElements = Array.new
    evenElements = Array.new
    if input == nil
        return input
    elsif input.length < 1
        return input
    elsif n < 1
        return input
    else
        for i in 0..input.length - 1
            if i % 2 == 0 
                evenElements << input[i]
            else 
                oddElements << input[i]
            end
        end
        result << oddElements
        result << evenElements
        encrypt(result.join(''), n-1)
    end
end

puts encrypt("123456", 3)


def decrypt(input, n) 
    if input == nil
        return input
    elsif n <= 0
        return input
    else
        isOdd = input.length % 2 == 0 
        halfOfArrayIndex = (input.length - 1) / 2
        result = Array.new

        for oddIndex in 0..halfOfArrayIndex
            evenIndex = oddIndex + input.length / 2
            if oddIndex == halfOfArrayIndex and !isOdd
                result << input[evenIndex]
            else
                result << input[evenIndex]
                result << input[oddIndex]
            end
        end
        decrypt(result.join(''), n-1)
    end
end

puts decrypt("246135", 1)


def topThreeWords(input)
    wordsArray = input.downcase.split(/[\s,.!?:;&()*^#"{}]+/)
    topWords = Hash.new

    for i in 0..input.length() - 1
        if /^[a-z']/.match?(wordsArray[i])
            if topWords.include? wordsArray[i]
                topWords[wordsArray[i]] = topWords[wordsArray[i]] + 1
            else
                topWords[wordsArray[i]] = 1
            end
        end
    end

    if topWords.length < 3
        return []
    end

    sortedWords = topWords.sort_by {|key, value| [value, key]}.reverse
    result = sortedWords.collect { |key, value| key }
    return result
end

words = "Hello, hi, hello, aloha, aLoHa, hI, bye, don't"

puts topThreeWords(words)