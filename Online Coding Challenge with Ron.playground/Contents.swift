// Most Common Characters
//
// input: string, integer
// output: array of strings
//
// input: 'abcdabca', 3
// output: ['a','c','b']
//
// time: O(N)
// space: O(N)
//
// hashmap character count approach
// then sort hashmap

/*
 
 first use a hash map:
 map -> [a: 3, b: 2, c: 2, d: 1, e: 2]
 
 array [126] = [[],[],[],[],[]]
 
 'abcaa'
 |
 
 
 [nil,[b,c,next=3,previous=null],[],[a,next=null,previous=1],[]]
 
 [
 a: 3
 b: 1
 c: 1
 ]
 
 for backwards for ea. element
 loop thru the set and append to results
 
 return results
 
 
 
 */




func mostCharacters(string: String, mostSeen: Int) -> [String] {
    var results = [String]()
    
    // create the hashmap
    var hash = [String: Int]()
    for char in string.characters {
        let charString = String(char)
        if hash[charString] != nil {
            hash[charString]! += 1
        } else {
            hash[charString] = 1
        }
    }
    
    // load an array of 26 spaces for each character
    var characters: [[String]] = Array(repeating: [String](), count: 26)
    for (char, count) in hash {
        characters[count].append(char)
    }
    
    // loop backwards and for each set in this element, add to results
    var end = 25
    var foundThem = false
    while !foundThem {
        for element in characters[end] {
            results.append(element)
            
            if results.count == mostSeen {
                foundThem = true
                break
            }
        }
        
        end -= 1
    }
    
    return results
}

//print(mostCharacters(string: "abcdabca", mostSeen: 1))

import Foundation

var arr = [12,3]
arr.remove(at: 1)


var test: String = "test"
let length = test.characters.count - 1
for i in 0..<test.characters.count {
    let start = test.index(test.startIndex, offsetBy: i)
    let end = test.index(test.endIndex, offsetBy: -(length-i))
    let range = start..<end
    print("start: \(start)   \(end)")
    print("char: \(test.substring(with: range))")
}























