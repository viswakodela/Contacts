//
//  MeargeSort.swift
//  Contact
//
//  Created by Viswa Kodela on 8/19/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import Foundation

extension Collection {
    
    func meargeSort<T: Comparable>(array: [T]) -> [T] {
        
        guard array.count > 1 else {return array}
        
        let middleIndex = array.count / 2
        
        let leftArray = meargeSort(array: Array(array[0..<middleIndex]))
        let rightArray = meargeSort(array: Array(array[middleIndex..<array.count]))
        
        return mearge(left: leftArray, right: rightArray)
        
    }
    
    func mearge<T: Comparable>(left: [T], right: [T]) -> [T] {
        
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray = [T]()
        
        while leftIndex < left.count && rightIndex < right.count {
            
            if left[leftIndex] < right[rightIndex] {
                orderedArray.append(left[leftIndex])
                leftIndex += 1
            }
                
            else if left[leftIndex] > right[rightIndex] {
                orderedArray.append(right[rightIndex])
                rightIndex += 1
                
            }
            else {
                orderedArray.append(left[leftIndex])
                leftIndex += 1
                orderedArray.append(right[rightIndex])
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
    
}
