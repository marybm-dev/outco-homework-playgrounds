
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
    
}

class Graph {
    
    func addVertex(id: Int) {
        
    }
    
    func getVertex(id: Int) -> Vertex? {
        return nil
    }
    
    func addEdge(id1: Int, id2: Int) {
        
    }
    
    func removeEdge(id1: Int, id2: Int) {
        
    }
    
    func removeVertex(id: Int) {
        
    }
    
    func findNeighbors(id: Int) -> [Int: Vertex] {
        return [:]
    }
}









