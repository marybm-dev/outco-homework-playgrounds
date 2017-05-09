//: Playground - noun: a place where people can play

/* Homework IV
 *
 * Problem 1: Insertion Sort
 *
 * Prompt:    Given an unsorted array of integers, return the array
 *            sorted using insertion sort.
 *
 *            What are the time and auxilliary space complexity?
 *
 * Input:     An unsorted array of integers
 * Output:    A sorted array of integers
 *
 * Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
 */


func insertionSort(arr: inout [Int]) {
    var i = 0
    var last = Int()
    var sorted = 0

    while i <= arr.count - 1 {
        let curr = arr[i]
        if curr < last {
            // shift the elements to the left until we reach the sort index
            var j = i
            while j > sorted {
                // if this is smaller than the element before this, then swap them.
                if arr[j] < arr[j-1] {
                    (arr[j], arr[j-1]) = (arr[j-1], arr[j])
                }
                j -= 1
            }
            sorted += 1
            last = arr[i]
        } else {
            last = curr
        }
        
        i += 1
    }
}

var arrayToInsertionSort =  [3,9,1,4,7]
insertionSort(arr: &arrayToInsertionSort)
print(arrayToInsertionSort)



/*
 * Problem 2: Selection Sort
 *
 * Prompt:    Given an unsorted array of integers, return the array
 *            sorted using selection sort.
 *
 *            What are the time and auxilliary space complexity?
 *
 * Input:     An unsorted array of integers
 * Output:    A sorted array of integers
 *
 * Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
 */


// Time:  O(n^2)
// Space: O(1)

func selectionSort(arr: inout [Int]) {
    var min = arr[0]
    var minIndex = 0
    var sortedPoint = 0
    var currIndex = 0
    
    while sortedPoint < arr.count {
        // set the min to the first element we see
        min = arr[sortedPoint]
        minIndex = sortedPoint
        currIndex = sortedPoint
        
        // find the current minimum element
        while currIndex < arr.count {
            if arr[currIndex] < min {
                min = arr[currIndex]
                minIndex = currIndex
            }
            currIndex += 1
        }
        
        // swap the current minimum with the element at the sortPoint
        (arr[sortedPoint], arr[minIndex]) = (arr[minIndex], arr[sortedPoint])
        sortedPoint += 1
    }
}
var arrayToSelectionSort = [3,9,1,4,7]
selectionSort(arr: &arrayToSelectionSort)
//print(arrayToSelectionSort)

/*
 * Problem 3: Bubble Sort
 *
 * Prompt:    Given an unsorted array of integers, return the array
 *            sorted using bubble sort.
 *
 *            What are the time and auxilliary space complexity?
 *
 * Input:     An unsorted array of integers
 * Output:    A sorted array of integers
 *
 * Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
 *
 */

// Time:  O(n^2)
// Space: O(1)

func bubbleSort(arr: inout [Int]) {
    var end = arr.count - 1
    while end >= 0 {
        var didSwap = false
        
        for i in 0..<end {
            if arr[i] > arr[i+1] {
                swap(&arr[i], &arr[i+1])
                didSwap = true
            }
        }
        
        if !didSwap {
            break
        }
    }
}
var arrayToBubbleSort = [3,9,1,4,7]
bubbleSort(arr: &arrayToBubbleSort)
//print(arrayToBubbleSort)









