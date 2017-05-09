//: Playground - noun: a place where people can play

import UIKit


 /*
     000:
     001: a
     010: b
     011: ab
     100: c
     101: ac
     110: bc
     111: abc
 */


func powerSetIterative(string: String) -> [String] {
    var result = [String]()
    let size = string.characters.count
    let powerSetSize = Int(pow(2.0, Double(size)))
    let letters = Array(string.characters)
    
    for i in 0..<powerSetSize {
        var current = ""
        
        for j in 0..<size {
            let isSet = (i & (1 << j)) != 0
            if isSet {
                current += String(letters[j])
            }
        }
        result.append(current)
    }
    
    return result
}

//print(powerSetIterative(string: "abc"))

/*
 * Homework II
 *
 * Prompt:   Given a set S, return the power set P(S), which is
 *           a set of all subsets of S.
 *
 * Input:    A String
 * Output:   An Array of Strings representing the power set of the input
 *
 * Example:  S = "abc", P(S) = ['', 'a', 'b','c','ab','ac','bc','abc']
 *
 * Note:     The input string will not contain duplicate characters
 *           The letters in the subset string must be in the same order
 *           as the original input.
 *
 */

func powerSet(string: String) -> [String] {
    var result = [String]()
    let letters = Array(string.characters)
    var powerSetSize = Int(pow(2.0, Double(letters.count)))
    var current = ""
    
    func powerSetHelper(counter: Int) {
        guard result.count < powerSetSize else {
            return
        }
        
        guard counter < letters.count else {
            result.append(current)
            current = ""
            powerSetHelper(counter: 0)
            return
        }
        
        let isSet = (result.count & (1 << counter)) != 0
        if isSet {
            current += String(letters[counter])
        }
        
        powerSetHelper(counter: counter + 1)
    }
    powerSetHelper(counter: 0)
    
    return result
}

//print(powerSet(string: "abcd"))



/*
 *  Homework III
 *
 *  Problem 1: Node class
 *
 *  Prompt:    Create a Node class
 *             The Node class should contain the following properties:
 *
 *                 value:   integer value (initially null)
 *                  next:   pointer to another node (initially null)
 *
 *               Example:   var sample1 = new Node(1)
 *                          sample1.value     // 1
 *                          sample1.next      // null
 *
 *               Example:   var sample2 = new Node()
 *                          sample2.value     // null
 *                          sample2.next      // null
 *
 *
 *  Problem 2:  LinkedList class
 *
 *  Prompt:     Create a LinkedList class
 *              The LinkedList class should contain the following properties:
 *
 *                length:   The number of nodes in the linked list
 *                  head:   A pointer to the head node
 *                  tail:   A pointer to the tail node
 *
 *              The LinkedList class should also contain the following methods:
 *
 *                append:   A method appends a value to the end of the
 *                          LinkedList.
 *
 *                          Input:     Integer
 *                          Output:    LinkedList w/ appended Node instance
 *
 *                insert:   A method that inserts an integer value at a set
 *                          index in the LinkedList (assume head index is 0).
 *
 *                          Input:     Integer value, Integer index
 *                          Output:    LinkedList w/ appended Node instance
 *
 *                delete:   A method that removes a node at a specified index.
 *
 *                          Input:     Integer index
 *                          Output:    LinkedList w/ removed Node
 *
 *              contains:   A method that checks to see if a value is contained
 *                          in the list.
 *
 *                          Input:     Integer value
 *                          Output:    Boolean
 *
 *    What are the time and auxiliary space complexity of the various
 *    methods?
 *
 */


enum LinkedListError: Error {
    case indexOutOfRange
}

// Problem 1
class Node {
    var value: Int?
    var next: Node?
    
    convenience init(_ value: Int) {
        self.init()
        self.value = value
    }
}

// Problem 2
class LinkedList {
    var length: Int = 0
    var head: Node?
    var tail: Node?
    
    
    /* A method that appends a value to the end of the LinkedList.
     
     Input:  Int
     Output: Void
     
     time:   O(n) where n is the length of the linked list
     space:  O(1)
     */
    func append(_ value: Int) {
        let newNode = Node(value)
        length += 1
        
        guard head != nil else {
            head = newNode
            tail = head
            return
        }
        
        var current: Node? = head
        while current?.next != nil {
            current = current?.next
        }
        
        current?.next = newNode
        tail = newNode
    }
    
    
    /* A method that inserts an integer value at a set
     index in the LinkedList (assume head index is 0).
     
     Input:  Int
     Output: Void
     
     time:   O(n) where n is the length of the linked list
     space:  O(1)
     */
    func insert(_ value: Int, at index: Int) throws {
        let newNode = Node(value)
        length += 1
        
        guard index <= length else {
            length -= 1
            throw LinkedListError.indexOutOfRange
        }
        
        // find the node before index to insert at
        var current: Node? = head
        var counter = 0
        while counter + 1 != index {
            current = current?.next
            counter += 1
        }
        
        // newNode now points to current's next
        // current's next becomes new node
        newNode.next = current?.next
        current?.next = newNode
        
        // update head if the index was zero
        if index == 0 {
            head = newNode
        }
        
        // update tail if index is last element
        if index == length {
            tail = newNode
        }
    }
    
    
    /* A method that removes a node at a specified index.
     
     Input:  Int
     Output: Void
     
     time:   O(n) where n is the length of the linked list
     space:  O(1)
     */
    func delete(at index: Int) throws {
        guard index < length else {
            throw LinkedListError.indexOutOfRange
        }
        
        // find node before index to update next pointer
        var current: Node? = head
        var counter = 0
        while counter + 1 != index {
            current = current?.next
            counter += 1
        }
        
        // point current's next node to the victim's next node
        let victim = current?.next
        current?.next = victim?.next
        length -= 1
    }
    
    
    /* A method that checks to see if a value is contained in the list
     
     Input:  Int
     Output: Void
     
     time:   O(n) where n is the length of the linked list
     space:  O(1)
     */
    func contains(_ value: Int) -> Bool {
        guard length > 0 else {
            return false
        }
        
        var current: Node? = head
        while current != nil {
            if current?.value == value {
                return true
            }
            current = current?.next
        }
        
        return false
    }
}


/* A computed property to display a LinkedList when called with print()
 
 Input:  Void
 Output: Void
 
 time:   O(n) where n is the length of the linked list
 space:  O(n) where n is the length of the linked list
 */
extension LinkedList: CustomStringConvertible {
    var description: String {
        var values = [Int]()
        
        var current: Node? = head
        for _ in 0..<length {
            values.append((current?.value)!)
            current = current?.next
        }
        
        return values.map { String($0) }.joined(separator: " -> ")
    }
}



/* Below are some examples of output */
var myList = LinkedList()
myList.append(0)
myList.append(1)
myList.append(2)
myList.append(3)
myList.append(4)
print(myList)               // 0 -> 1 -> 2 -> 3 -> 4

try? myList.insert(5, at: 2)
try? myList.insert(5, at: 8)
print(myList)               // 0 -> 1 -> 5 -> 2 -> 3 -> 4

print(myList.contains(7))   // false
print(myList.contains(5))   // true
print(myList.contains(3))   // true

try? myList.delete(at: 4)
print(myList)               // 0 -> 1 -> 5 -> 2 -> 4
print(myList.contains(3))   // false






