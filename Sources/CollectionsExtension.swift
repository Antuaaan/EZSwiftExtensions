//
//  CollectionsExtension.swift
//  EZSwiftExtensions
//
//  Created by Sanyal, Arunav on 3/5/17.
//  Copyright © 2017 Goktug Yilmaz. All rights reserved.
//

import Foundation

extension Collection {

#if os(iOS)
    // EZSE : A parralelized map for collections, operation is non blocking
    public func parallelizedMap<R>(_ each: @escaping (Self.Iterator.Element) -> R) -> [R?] {
        let indices = indicesArray()
        var res = [R?](repeating: nil, count: indices.count)
        
        let queue = OperationQueue()
        let operations = indices.enumerated().map { index, elementIndex in
            return BlockOperation {
                res[index] = each(self[elementIndex])
            }
        }
        queue.addOperations(operations, waitUntilFinished: true)
        
        return res
    }

    
    /// EZSE : Helper method to get an array of collection indices
    private func indicesArray() -> [Self.Index] {
        var indicesArray: [Self.Index] = []
        var nextIndex = startIndex
        while nextIndex != endIndex {
            indicesArray.append(nextIndex)
            nextIndex = index(after: nextIndex)
        }
        return indicesArray
    }
#endif
    
}

extension Collection where Iterator.Element == String {
    //Returns the initials of an array of strings
    var initials: [String] {
        return map{ String($0.characters.prefix(1)) }
    }
    //This takes an array and returns a dictionary with keys as the first letter and a value of an array of Strings (for use with sectioned tableviews)
    public func buildIndexedDictionary() -> [String:[String]]{
        var indexedDic:[String:[String]] = [:]
        let allInitials = self.initials
        let initials = Array(Set(allInitials))
        for one in self{
            for initial in initials{
                if String(one.characters.first!) == initial {
                    if var oneArray = indexedDic[initial] {
                        oneArray.append(one)
                        indexedDic[initial] = oneArray
                    }
                    else{
                        let oneArray = [one]
                        indexedDic[initial] = oneArray
                    }
                }
            }
        }
        return indexedDic
    }
}
