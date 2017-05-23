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

















