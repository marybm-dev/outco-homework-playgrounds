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









