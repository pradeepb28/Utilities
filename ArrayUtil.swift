//
//  ArrayUtil.swift
//  Today
//
//  Created by Pradeep Burugu on 1/17/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//


class ArrayUtil {
    func numberOfPossibilities<T>(letters: [T]) -> [[T]] {
        var returnValues : [[T]] = []
        // less than two values
        if letters.count < 2 {
            return [letters]
        }
        //two values
        if letters.count == 2 {
            var twoValues = letters
            returnValues += [twoValues]
            let second = twoValues[1]
            twoValues[1] = twoValues[0]
            twoValues[0] = second
            returnValues += [twoValues]
            return returnValues
            
        }
        // n values
        for index in 0..<letters.count {
            var nValues = letters
            let removed = nValues.removeAtIndex(index)
            let nArr = numberOfPossibilities(nValues)
            for anArray in nArr {
                var newArr = anArray
                newArr.insert(removed, atIndex: index)
                returnValues += [newArr]
            }
        }
        return returnValues
    }
}
