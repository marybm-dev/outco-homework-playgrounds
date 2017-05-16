

func mergesort(arr: [Int]) -> [Int] {
    // base case we have 1. empty array or 2. single element
    if arr.count <= 1 {
        return arr
    }
    
    // create left chunk & right chunk
    let index = arr.count / 2
    let left = Array(arr[0..<index])
    let right = Array(arr[index..<arr.count])
    
    let sortedLeft = mergesort(arr: left)
    let sortedRight = mergesort(arr: right)
    
    var i = 0
    var j = 0
    var result = [Int]()
    while i < sortedLeft.count && j < sortedRight.count {
        if sortedLeft[i] <= sortedRight[j] {
            result.append(sortedLeft[i])
            i += 1
        } else {
            result.append(sortedRight[j])
            j += 1
        }
    }
    
    while i < sortedLeft.count {
        result.append(sortedLeft[i])
        i += 1
    }
    
    while j < sortedRight.count {
        result.append(sortedRight[j])
        j += 1
    }
    
    return result
}

// print(mergesort(arr: [8,5,7,3,9]))













/*
 *                                 Homework VII
 *
 *  Problem: Graph
 *
 *  Prompt: Create a Vertex class/constructor and Graph class/constructor.
 *          Name it Graph.
 *
 *  The Vertex will have the following properties:
 *
 *               value: integer value (initially null)
 *               edges: hash that contains edges to other vertices
 *
 *  The Graph will have the following properties:
 *
 *            vertices: A hash/dictionary/object to store vertices.
 *       totalVertices: The total number of vertices in your Graph.
 *          totalEdges: The total number of edges in your Graph
 *
 *  The Graph will also have the following methods:
 *
 *           addVertex: Method that accepts an id (int/str), and creates an
 *                      object with a "value" of id, and a property called
 *                      "edges" which will store the edges of the vertex. If a
 *                      vertex with the id already exists, then do not create a
 *                      new vertex.
 *
 *           getVertex: Method that takes an id, and outputs the vertex with the
 *                      matching id, if it exists.
 *
 *             addEdge: Method that accepts two different id's as its input, and
 *                      creates an edge between both vertices.
 *                      (This edge may look like [id1,id2])
 *
 *          removeEdge: Method that accepts two different id's as its input, and
 *                      removes the edge between the two vertices if it exists.
 *
 *        removeVertex: Method that takes an id as its input, and removes the
 *                      vertex with the matching id.
 *
 *       findNeighbors: Method that accepts an id as its input, and returns
 *                      all of the edges of that vertex.
 *
 *  Input:  N/A
 *  Output: A Graph instance
 *
 *  What are the time and auxilliary space complexities of the various methods?
 *
 */

class Vertex {
    var value: Int
    var edges: [Int: Vertex]
    
    init(value: Int) {
        self.value = value
        self.edges = [:]
    }
}

class Graph {
    
    var vertices: [Int: Vertex] = [:]
    var totalVertices: Int = 0
    var totalEdges: Int = 0
    
    func addVertex(id: Int) {
        // check if the vertex already exists
        guard vertices[id] == nil else {
            return
        }
        
        // create the vertex since it doesn't exist
        let vertex = Vertex(value: id)
        vertices[id] = vertex
        totalVertices += 1
    }
    
    func getVertex(id: Int) -> Vertex? {
        return vertices[id]
    }
    
    func addEdge(id1: Int, id2: Int) {
        guard vertices[id1] != nil,
            vertices[id2] != nil else {
                return
        }
        
        let vertex1 = vertices[id1]!
        let vertex2 = vertices[id2]!
        
        vertex1.edges[vertex2.value] = vertex2
        vertex2.edges[vertex1.value] = vertex1
        totalEdges += 2
    }
    
    func removeEdge(id1: Int, id2: Int) {
        guard vertices[id1] != nil,
            vertices[id2] != nil else {
                return
        }
        
        let vertex1 = vertices[id1]!
        let vertex2 = vertices[id2]!
        
        vertex1.edges[vertex2.value] = nil
        vertex1.edges[vertex1.value] = nil
        totalEdges -= 2
    }
    
    func removeVertex(id: Int) {
        guard vertices[id] != nil else {
            return
        }
        
        // remove the vertex
        vertices[id] = nil
        
        // remove any edges to/from this vertex
        for v in vertices {
            let vertex = v.value
            if vertex.edges[id] != nil {
                vertex.edges[id] = nil
                totalEdges -= 1
            }
        }
        
        // decrement the vertex count
        totalVertices -= 1
    }
    
    func findNeighbors(id: Int) -> [Int: Vertex] {
        guard vertices[id] != nil else {
            return [:]
        }
        
        let vertex = vertices[id]!
        return vertex.edges
    }
}

var work = Vertex(value: 5)
assert(work.value == 5)

var work1 = Vertex(value: 5)
var work2 = Vertex(value: 10)
work1.edges[work2.value] = work2
work2.edges[work1.value] = work1
assert(work1.edges[work2.value]?.value == 10 && work2.edges[work1.value]?.value == 5)



/*
 *                                 Homework VIII
 *
 *  Problem: Hash Table
 *
 *  Prompt: Create a HashTable class/constructor.
 *          Name it HashTable.
 *
 *  The HashTable will have the following properties:
 *
 *         storage:  An array of arrays.
 *        buckets:   The max number of buckets that your storage can contain.
 *                   Initialize your "buckets" at 8 buckets.
 *           size:   The current number (total) of key-value pairs in the storage
 *                   Initialize your "size" to 0.
 *
 *        Example:   var sample = new HashTable()
 *                   sample.storage          // []
 *                   sample.buckets          // 8
 *                   sample.size             // 0
 *
 *
 *  The HashTable will also have the following methods:
 *
 *           hash:   Method that takes a string as an input and outputs a number
 *                   We have provided to you the dbjb2 hashing function, so you
 *                   do not need to write your own.
 *
 *                   Input:      key
 *                   Output:     index
 *
 *         insert:   Method that takes a key and a value as inputs, and places a
 *                   tuple ([key,value]) into the proper bucket.
 *                   If the key already exists, it should update the value.
 *                   You should use separate chaining to handle collisions.
 *
 *                   Input:      key, value
 *                   Output:     undefined
 *
 *         remove:   Method that takes a key as its input, and looks for the
 *                   [key,value] and removes it from the bucket.
 *
 *                   Input:      key
 *                   Output:     value
 *
 *       retrieve:   Method that a key as its input, and returns the value
 *                   stored at that key, or undefined if the key is not present.
 *
 *                   Input:      key
 *                   Output:     value
 *
 *
 *  Input: N/A
 *  Output: A HashTable instance
 *
 *  What are the time and auxiliary space complexities of the various methods?
 *
 */

func djb2Code(string: String, buckets: Int) -> Int {
    var hash = 5381
    for char in string.characters {
        hash = ((hash << 5) &+ hash) &+ char.hashValue
    }
    return hash % buckets
}

class HashTable {
    var storage: [[(String,Int)]]
    var buckets: Int
    var size: Int
    
    init() {
        self.buckets = 8
        self.storage = Array(repeating: [], count: self.buckets)
        self.size = 0
    }
    
    // time:  O(s) where s is the length of the string
    // space: O(1)
    func hash(key: String, buckets: Int) -> Int {
        return djb2Code(string: key, buckets: buckets)
    }
    
    // time:  O(s) where s is the length of the string
    // space: O(1)
    func insert(key: String, value: Int) {
        let hash = self.hash(key: key, buckets: self.buckets)
        self.storage[hash].append((key,value))
    }
    
    // time:  O(s+n) where s is the length of the string and n is the length of the values in the bucket
    // space: O(1)
    func remove(key: String) {
        let hash = self.hash(key: key, buckets: self.buckets)
        for (index,el) in self.storage[hash].enumerated() {
            if el.0 == key {
                self.storage[hash].remove(at: index)
            }
        }
    }
    
    // time:  O(s+n) where s is the length of the string and n is the length of the values in the bucket
    // space: O(1)
    func retrieve(key: String) -> (String,Int)? {
        let hash = self.hash(key: key, buckets: self.buckets)
        for (index,el) in self.storage[hash].enumerated() {
            if el.0 == key {
                return self.storage[hash][index]
            }
        }
        
        return nil
    }
    
}


/*
 *  Extra Credit: Resize
 *
 *  Prompt: If the load factor reaches a critical 0.75 or higher, resize the HashTable
 *          by doubling the number of buckets, and reindexing all the key-value pairs.
 *
 *                   Input:      undefined
 *                   Output:     undefined
 *
 */





















