//: Playground - noun: a place where people can play

import UIKit
import Foundation

//func latticePaths(size: Int) -> Int {
//    
//    func walkPath(_ x: Int, _ y: Int) -> Int {
//        var routes = 0
//        
//        if x == 0 || y == 0 {
//            routes = 1
//        } else {
//            routes = walkPath(x-1, y) + walkPath(x, y-1)
//        }
//        
//        return routes
//    }
//    
//    return walkPath(size, size)
//}
//
//latticePaths(size: 2)


/*
 *  Homework X
 *
 *  Problem 1: Max Consecutive Sum
 *
 *  Prompt:    Given an array of integers find the sum of consecutive
 *             values in the array that produces the maximum value.
 *
 *  Input:     Unsorted array of positive and negative integers
 *  Output:    Integer (max consecutive sum)
 *
 *  Example:   input = [6, -1, 3, 5, -10]
 *             output = 13 (6 + -1 + 3 + 5 = 13)
 *
 *  Time Complexity: O(n)
 *  Auxiliary Space Complexity: O(1)
 */

func maxConsecutiveSums(list: [Int]) -> Int {
    var sum = 0
    var maxSum = 0
    
    for num in list {
        sum += num
        
        if sum > maxSum {
            maxSum = sum
        }
    }
    
    return maxSum
}

let nums = [6, -1, 3, 5, -10]
print(maxConsecutiveSums(list: nums))



 /*
 *  Problem 2: Lattice Paths (Dynamic Programming Approach)
 *
 *  Prompt:    Count the number of unique paths to travel from the top left
 *             to the bottom right of a lattice of squares.
 *
 *  Input:     An interger N (which is the size of the lattice)
 *  Output:    An interger (which represents the number of unique paths)
 *
 *  Example:   input: 2
 *
 *             (2 x 2 lattice of squares)
 *              __ __
 *             |__|__|
 *             |__|__|
 *
 *             output: 6 (number of unique paths from top left corner to bottom
 *                     right)
 *
 *  Notes:     What is the time and auxilliary space complexity of your solution?
 *
 *             When moving through the lattice, you can only move either down or
 *             to the left.
 *
 *             You did this problem before with recursion. Try implementing it
 *             now with dynamic programming!
 *
 *  Resources:
 *    1: https://projecteuler.net/problem=15
 *    2: https://en.wikipedia.org/wiki/Lattice_path
 *
 */


func latticePaths(_ size: Int) -> Int {
    var memo = Array(repeating: Array(repeating: 1, count: size), count: size)
    memo[0][0] = 1
    
    guard size > 1 else {
        return memo[0][0] + 1
    }
    
    for i in 1..<size {
        for j in 1..<size {
            memo[i][j] = memo[i-1][j] + memo[i][j-1] + 1
        }
    }
    
    print(memo)
    return memo[size-1][size-1]
}

print(latticePaths(2))



func insertionSort(input: inout [Double]) {
    for i in 1..<input.count {
        let current = input[i]
        var index = i
        
        while index > 0 && input[index-1] > current {
            input[index] = input[index-1]
            index -= 1
        }
        input[index] = current
    }
}

/*
 *  Homework XI
 *
 *  Problem 1: Bucket Sort
 *
 *  Prompt:    Given an unsorted array of numbers which are in the range
 *             of 0.0 to 1.0, and are uniformly distributed across the
 *             range, sort the numbers efficiently.
 *
 *  Input:     Unsorted array of numbers in range of 0.0 to 1.0
 *  Output:    A sorted array
 *
 *  Example:   input = [0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434]
 *             output = [0.1234, 0.3434, 0.565, 0.656, 0.665, 0.897]
 *
 *  Notes:     What are the time and auxilliary space complexity?
 
 
 
 loop through elements
 each bucket contains 1..n
 keep bucket sorted (can use sorting method used before i. bst  or   ii. insertion sort)

 loop through each bucket and gather back into original array
 
 
 
 define bucket size of range from 1-20, 4 buckets holding values
 loop through array and add items into proper bucket
 when multiple items make sure we insert into proper order
 
 next work to get values into sorted order
 loop thru bucket, one by one place into sorted array
 can replace items in our imput array
 
 */

// time:  O(n+k) for best and avg. O(n^2) in worst case
// space: O(n)

func bucketSort(arr: inout [Double]) {
    var result = [Double]()
    
    var buckets = Array(repeating: [Double](), count: 4)
    // 0: 0.00...0.25
    // 1: 0.26...0.50
    // 2: 0.51...0.75
    // 3: 0.76...1.00
    for element in arr {
        if element > 0.0 && element <= 0.25 {
            buckets[0].append(element)
            insertionSort(input: &buckets[0])
        }
        else if element > 0.26 && element <= 0.50 {
            buckets[1].append(element)
            insertionSort(input: &buckets[1])
        }
        else if element > 0.51 && element <= 0.75 {
            buckets[2].append(element)
            insertionSort(input: &buckets[2])
        }
        else if element > 0.76 {
            buckets[3].append(element)
            insertionSort(input: &buckets[3])
        }
    }
    
    var index = 0
    for i in 0..<buckets.count {
        for j in 0..<buckets[i].count {
            arr[index] = buckets[i][j]
            index += 1
        }
    }
}

var input = [0.897, 0.565, 0.656, 0.1234, 0.665, 0.3434]
bucketSort(arr: &input)
print(input)


 /*
 *  Problem 2: Kth Smallest Element in a Range
 *
 *  Prompt:    Given an unsorted array of whole integers in the range
 *             1000 to 9000, find the Kth smallest element in linear time
 *             The array can have duplicates.
 *
 *  Input:     Unsorted array of whole integers in range of 1000 to 9000
 *             Kth smallest element you want to find
 *
 *  Output:    Kth smalest element in the range
 *
 *  Example:   array = [1984, 1337, 9000, 8304, 5150, 9000, 8304], k=5
 *             output = 8304
 *
 *  Notes:     What are the time and auxilliary space complexity?
 *
 */

// time:  O(n)
// space: O(n)
func kthSmallest(arr: [Int], k: Int) -> Int {
    var intsAsDouble = arr.map { Double($0) }
    bucketSort(arr: &intsAsDouble)
    return Int(intsAsDouble[k-1])
}

var array = [1984, 1337, 9000, 8304, 5150, 9000, 8304]
kthSmallest(arr: array, k: 5)












/*
 *                                 Homework XII
 *
 *  Problem: Heap
 *
 *  Prompt: Create a Heap class/constructor
 *
 *  The Heap will take in the following input:
 *
 *                type: argument should be either 'min' or 'max'. This will
 *                      dictate whether the heap will be a minheap or maxheap.
 *                      The comparator method will be affected by this
 *                      argument. See method description below
 *
 *  The Heap will have the following property:
 *
 *             storage: array
 *
 *                type: property that will be either 'min' or 'max'. This will
 *                      be dictated by
 *
 *  The Heap will have the following methods:
 *
 *             compare: takes in two arguments (a and b). Depending on the heap
 *                      type (minheap or maxheap), the comparator will behave
 *                      differently. If the heap is a minheap, then the compare
 *                      function will return true if a is less than b, false
 *                      otherwise. If the heap is a maxheap, then the compare
 *                      function will return true if a is greater than b, false
 *                      otherwise.
 *
 *                swap: takes in two indexes and swaps the elements at the two
 *                      indexes in the storage array
 *
 *                peak: returns the peak element of the storage array. This
 *                      will be the most minimum and maximum element for a
 *                      minheap and maxheap respectively
 *
 *                size: returns the number of elements in the heap
 *
 *              insert: inserts a value into the heap. Should begin by pushing
 *                      the value onto the end of the array, and then calling
 *                      the bubbleUp method from the last index of the array
 *
 *            bubbleUp: takes in an index, and considers the element at that
 *                      index to be a child. Continues to swap that child with
 *                      its parent value if the heap comparator condition is
 *                      not fulfilled
 *
 *          removePeak: removes the peak element from the heap and returns it.
 *                      Should begin by swapping the 0th-index element with the
 *                      last element in the storage array. Uses bubbleDown
 *                      method from the 0th index
 *
 *          bubbleDown: takes in an index, and considers the element at this
 *                      index to be the parent. Continues to swap this parent
 *                      element with its children if the heap comparator
 *                      condition is not fulfilled
 *
 *              remove: takes in a value and (if it exists in the heap),
 *                      removes that value from the heap data structure and
 *                      returns it. Should rearrange the rest of the heap to
 *                      ensure the heap comparator conditions are fulfilled
 *                      for all of its elements
 *
 *
 *
 *  Input:  N/A
 *  Output: A Heap instance
 *
 *  What are the time and auxilliary space complexities of the various methods?
 *
 */



class Minheap {
    var storage = [Int]()
    
    init() {
        
    }
    
    func swap(_ index1: Int, _ index2: Int) {
        (storage[index1], storage[index2]) = (storage[index2], storage[index1])
    }
    
    func peak() -> Int {
        return self.storage[0]
    }
    
    func size() -> Int {
        return self.storage.count
    }
    
    func insert(_ value: Int) {
        var size = self.size() - 1
        self.storage.append(value)
        self.bubbleUp(&size)
    }
    
    func bubbleUp(_ childIndex: inout Int) {
        var parentIndex = self.getParentIndex(childIndex)
        
        while childIndex > 0 && self.storage[parentIndex] > self.storage[childIndex] {
            self.swap(childIndex, parentIndex)
            
            childIndex = parentIndex
            parentIndex = self.getParentIndex(childIndex)
        }
    }
    
    func getParentIndex(_ childIndex: Int) -> Int {
        if childIndex % 2 == 0 {
            return (childIndex - 2) / 2
        } else {
            return (childIndex - 1) / 2
        }
    }
    
    func removePeak() -> Int {
        var start = 0
        self.swap(start, self.size() - 1)
        let removedElement = self.storage.remove(at: self.size() - 1)
        self.bubbleDown(&start)
        return removedElement
    }
    
    func bubbleDown(_ parentIndex: inout Int) {
        var childIndex = self.getChildIndex(parentIndex)
        
        while parentIndex < self.size() - 1 && self.storage[parentIndex] > self.storage[childIndex] {
            self.swap(parentIndex, childIndex)
            
            parentIndex = childIndex
            childIndex = self.getChildIndex(parentIndex)
        }
    }
    
    func getChildIndex(_ parentIndex: Int) -> Int {
        let childIndex1 = 2 * parentIndex + 1
        let childIndex2 = 2 * parentIndex + 2
        
        // choose the index of the smaller element
        
        if childIndex1 >= self.size() {
            return childIndex1
        }
            
        else if childIndex2 >= self.size() {
            return childIndex1
        }
            
        else if self.storage[childIndex1] < self.storage[childIndex2] {
            return childIndex1
        }
            
        else {
            return childIndex2
        }
    }
}



var test = Minheap()
test.insert(10)
test.insert(5)
test.insert(7)
test.insert(8)
test.insert(1)
test.insert(3)
test.insert(6)
print(test.storage)
print(test.removePeak())
print(test.storage)
print(test.removePeak())
print(test.storage)
print(test.removePeak())
print(test.storage)








