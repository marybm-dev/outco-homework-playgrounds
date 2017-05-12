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
//print(arrayToInsertionSort)



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



/*
 *  Homework V
 *
 *  Problem 1: Node class
 *
 *  Prompt:    Create a Node class
 *             The Node class should contain the following properties:
 *
 *                   value:   integer value (default null)
 *               leftChild:   pointer to another node (initially null)
 *              rightChild:   pointer to another node (initially null)
 *
 *                 Example:   var sample = new Node(1)
 *                            sample.value        // 1
 *                            sample.leftChild    // null
 *                            sample.rightChild   // null
 */


 /*  Problem 2: BinarySearchTree class.
 *
 *  Prompt:    Create a BinarySearchTree class
 *
 *             The BinarySearchTree class should contain the following
 *             properties:
 *
 *                    root:   A pointer to the root node (initially null)
 *                    size:   The number of nodes in the BinarySearchTree
 *
 *             The BinarySearchTree class should also contain the following
 *             methods:
 *
 *                  insert:   A method that takes takes an integer value, and
 *                            creates a node with the given input.  The method
 *                            will then find the correct place to add the new
 *                            node. Values larger than the current node node go
 *                            to the right, and smaller values go to the left.
 *
 *                            Input:     value
 *                            Output:    undefined
 *
 *                  search:   A method that will search to see if a node with a
 *                            specified value exists and returns true or false
 *                            if found.
 *
 *                            Input:     value
 *                            Output:    boolean
 *
 *
 *             What are the time and auxilliary space complexities of the
 *             various methods?
 *
 *
 *  Extra:     Remove method for BinarySearchTree class
 *
 *  Prompt:    Add the following method to the BinarySearchTree class:
 *
 *                  remove:   A method that removes a value matching the input
 *                            the tree is then retied so that the binary search
 *                            tree order is not violated.
 *
 */


class Node {
    var value: Int? = nil
    var left: Node? = nil
    var right: Node? = nil
    
    convenience init(_ value: Int) {
        self.init()
        self.value = value
    }
}

class BinarySearchTree {
    var root: Node? = nil
    var size: Int = 0
    
    func insert(_ value: Int) {
        let newNode = Node(value)
        guard self.root != nil else {
            self.root = newNode
            self.size += 1
            return
        }
        
        var current: Node? = root
        func recursiveInsert(_ node: Node) {
            if value < (node.value)! {
                if node.left != nil {
                    recursiveInsert(node.left!)
                }
                else {
                    node.left = newNode
                    self.size += 1
                    return
                }
            } else {
                if node.right != nil {
                    recursiveInsert(node.right!)
                }
                else {
                    node.right = newNode
                    self.size += 1
                    return
                }
            }
        }
        recursiveInsert(current!)
    }
    
    func search(_ value: Int) -> Bool {
        var current: Node? = root
        func recursiveFind(_ node: Node?) -> Bool {
            guard node != nil else {
                return false
            }
            
            if (node?.value)! == value {
                return true
            }
            else if value < (node?.value)! {
                return recursiveFind(node?.left)
            }
            else if value > (node?.value)! {
                return recursiveFind(node?.right)
            }
            
            return false
        }
        
        return recursiveFind(current)
    }
}


var myTree = BinarySearchTree()
myTree.insert(5)
assert(myTree.root?.value == 5)
myTree.insert(3)
myTree.root?.left?.value == 3
assert(myTree.root?.left?.value == 3)
myTree.insert(2)
assert(myTree.root?.left?.left?.value == 2)
myTree.insert(4)
assert(myTree.root?.left?.right?.value == 4)


assert(myTree.search(2) == true)
assert(myTree.search(7) == false)




/*
 
 TARGET PRACTICE
 
 */

/*
 *  1. Write a function that takes in an array of integers and performs the insert method on each
 *     item of the array in order.
 *
 *  Input: Array
 *  Output: Binary Search Tree
 *
 *  Example: [4, 2, 5, 1, 3, 7, 6, 8]
 *  Output this binary search tree:
 *
 *              4
 *            /   \
 *          2       5
 *        /   \       \
 *      1       3       7
 *                    /   \
 *                  6      8
 */

let array = [4, 2, 5, 1, 3, 7, 6, 8]
var myBinaryTree = BinarySearchTree()

for element in array {
    myBinaryTree.insert(element)
}

//print(myBinaryTree.size)



/*
 *  2. Given the example output binary search tree from Problem 1, what would the order of values
 *     printed be if we used:
 *
 *     a. BREADTH FIRST traversal
 4, 2, 5, 1, 3, 7, 6, 8
 *
 *     b. PRE-ORDER DEPTH first traversal
 
 4, 2, 5, 1, 3, 7, 6, 8
 *
 *     c. IN-ORDER DEPTH first traversal
 
 1, 2, 3, 4, 5, 6, 7, 8
 *
 *     d. POST-ORDER DEPTH first traversal
 
 1, 3, 2, 6, 8, 7, 5, 4
 */




/*
 *  3a. Using a queue, and while loop write a function that takes in a binary search tree and
 *      outputs an array of values ordered by BREADTH FIRST traversal.
 *
 *  Input: Binary Search Tree
 *  Output: Array
 *
 *  NOTE: You may use an array or linked list for your queue.
 *
 *  NOTE: Confirm with your answer from problem 2a.
 */

func bfs(tree: BinarySearchTree) -> [Int] {
    var result = [Int]()
    var queue = [Node]()
    queue.append(tree.root!)
    
    while queue.count > 0 {
        let current = queue.remove(at: 0)
        if current.left != nil {
            queue.append(current.left!)
        }
        if current.right != nil {
            queue.append(current.right!)
        }
        result.append(current.value!)
    }
    
    return result
}

//print(bfs(tree: myBinaryTree))


/*
 *  3b. Using recursion, write a function that takes in a binary search tree and
 *      outputs an array of values ordered by PRE-ORDER DEPTH FIRST traversal.
 *
 *      Input: Binary Search Tree
 *      Output: Array
 *
 *      NOTE: Confirm with your answer from problem 2b.
 */


/*
 *  3c. Using recursion, write a function that takes in a binary search tree and
 *      outputs an array of values ordered by IN-ORDER DEPTH FIRST traversal.
 *
 *      Input: Binary Search Tree
 *      Output: Array
 *
 *      NOTE: Confirm with your answer from problem 2c.
 */


/*
 *  3d. Using recursion, write a function that takes in a binary search tree and
 *      outputs an array of values ordered by POST-ORDER DEPTH FIRST traversal.
 *
 *      Input: Binary Search Tree
 *      Output: Array
 *
 *      NOTE: Confirm with your answer from problem 2d.
 */




/*
 *  Homework VI
 *
 *  Problem 1: Quicksort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using quicksort.
 *
 *             What are the time and auxilliary space complexity?
 *
 *  Input:     An unsorted array of integers
 *  Output:    A sorted array of integers
 *
 *  Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
 */

// time:  O(nlog(n))
// space: O(1)

//func sort(subarray: inout [Int]) {
//    if subarray.count == 1 {
//        return
//    }
//    
//    let pivot = subarray[0]
//    var left = 1
//    print("pivot: \(pivot)   array: \(subarray)")
//    var right = subarray.count - 1
//    
//    while left <= right {
//        while subarray[left] < pivot && left < subarray.count - 1 {
//            left += 1
//        }
//        while subarray[right] > pivot && right > 0 {
//            right -= 1
//        }
//        print("-- while : right \(right)")
//        let temp = subarray[left]
//        subarray[left] = subarray[right]
//        subarray[right] = temp
//    }
//    
//    // smaller section
//    var subA = Array(subarray[1..<left])
//    
//    // larger section
//    var subB = Array(subarray[left..<subarray.count])
//    
//    //sort(subarray: &subA)
//    sort(subarray: &subB)
//}

func quicksort(arr: inout [Int]) {

    func partition(start: Int, pivot: Int) -> Int {
        var sorted = start
        
        // compare elements with the pivot
        for i in sorted..<pivot {
            if arr[i] <= arr[pivot] {
                if sorted != i {
                    swap(&arr[i], &arr[sorted])
                }
                
                sorted += 1
            }
        }
        
        // move pivot to final position
        if sorted != pivot {
            swap(&arr[sorted], &arr[pivot])
        }
        
        return sorted
    }
    
    func sort(startIndex: Int, pivot: Int) {
        if startIndex < pivot {
            let pivotIndex = partition(start: startIndex, pivot: pivot)
            sort(startIndex: startIndex, pivot: pivotIndex - 1)
            sort(startIndex: pivotIndex + 1, pivot: pivotIndex)
        }
    }
    
    sort(startIndex: 0, pivot: arr.count - 1)
}

var arrayToQuicksort = [3,9,1,4,7]
quicksort(arr: &arrayToQuicksort)
print(arrayToQuicksort)


/*
 *  Problem 2: Mergesort
 *
 *  Prompt:    Given an unsorted array of integers, return the array
 *             sorted using mergesort.
 *
 *             What are the time and auxilliary space complexity?
 *
 *  Input:     An unsorted array of integers
 *  Output:    A sorted array of integers
 *
 *  Example:   input = [3,9,1,4,7] , output = [1,3,4,7,9]
 *
 */


func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [Int] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}

var arrayToMergeSort = [3,9,1,4,7]
print(mergeSort(arrayToMergeSort))





































