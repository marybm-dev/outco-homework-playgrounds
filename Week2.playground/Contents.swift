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

class Node {
    var value: Int? = nil
    var left: Node? = nil
    var right: Node? = nil
    
    convenience init(_ value: Int) {
        self.init()
        self.value = value
    }
}

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


class BinarySearchTree {
    var root: Node? = nil
    var size: Int = 0
    
    func insert(_ value: Int) {
        let newNode = Node(value)
        guard self.root != nil else {
            self.root = newNode
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
                    return
                }
            } else {
                if node.right != nil {
                    recursiveInsert(node.right!)
                }
                else {
                    node.right = newNode
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
















