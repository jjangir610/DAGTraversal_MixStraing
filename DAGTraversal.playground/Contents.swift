//
//  main.swift
//  DAGTraversal
//
//  Created by Jyoti on 02/12/18.
//  Copyright © 2018 Jyoti. All rights reserved.
//

import Foundation

print("----Graph Traversal------")

class Graph {
    
    //Dictionary contains node and list of all nodes that have outgoing edge from node
    private var adjList: [Int:[Int]] = [Int:[Int]]()
    
    //initalize graph with number of node
    init(v: Int) {
        for i in 1...v{
            adjList[i] = [Int]()
        }
    }
    
    //To add edge between vertices
    //here edge is ging from u to v
    func addEdge(u: Int, v: Int){
        if let _ = adjList[u], v <= adjList.keys.count{
            adjList[u]?.append(v)
        }
        else {
            print("Incorrect edge \(u)->\(v)  ")
        }
    }
    
    //method to print graph
    func printGraph() {
        //assuming root is 1
        let root = 1
        printG(preVList: "\(root)", adjacencyList: adjList[1]!)
    }
    
    //
    private func printG(preVList: String, adjacencyList: [Int]?) {
        //If reched at the last child then print the path
        guard let list = adjacencyList, list.count > 0 else{
            print(preVList)
            return
        }
        //for each node create a print path format and pass adjacency list of the current node to recusrsive call
        for node in list{
            let listPrint = ("\(preVList)->\(node)")
            printG(preVList: listPrint, adjacencyList: adjList[node])
        }
    }
}

let graph = Graph(v: 8)
graph.addEdge(u: 1, v: 2)
graph.addEdge(u: 1, v: 3)
graph.addEdge(u: 1, v: 4)
graph.addEdge(u: 1, v: 5)
graph.addEdge(u: 2, v: 6)
graph.addEdge(u: 3, v: 6)
graph.addEdge(u: 3, v: 7)
graph.addEdge(u: 4, v: 7)
graph.addEdge(u: 4, v: 8)
graph.addEdge(u: 5, v: 8)

graph.printGraph()



print("\n\n----Mix Strings------\n")


func mixString(s1: String, s2: String, s3: String, i: Int) -> String {
    
    //as given all string have equal number of characters
    if i == s1.count {
        return ""
    }
    else {
        let index = s1.index(s1.startIndex, offsetBy: i)
        return ("\(s1[index])" + "\(s2[index])" + "\(s3[index])") + mixString(s1: s1, s2: s2, s3: s3, i: i+1)
    }
    
}
print(mixString(s1: "abcd", s2: "ijkl", s3: "xyzw", i: 0))
