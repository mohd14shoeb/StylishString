//
//  NSRange+StylishString.swift
//  StylishString
//
// Copyright (c) 2016 Harlan Kellaway
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Foundation

internal extension NSRange {
    
    /**
     Returns the range covering values before current range in
     the provided string.
     
     - parameter string: String.
     
     - returns: Range if current range is not at beginning of string,
     nil otherwise.
     */
    func before(inString string: String) -> NSRange? {
        guard string.hasContent(before: self) else {
            return nil
        }
        
        let head = string.substring(fromIndex: location)
        
        return NSMakeRange(0, string.characters.count - head.characters.count)
    }
    
    /**
     Returns the range covering values after current range in
     the provided string.
     
     - parameter string: String.
     
     - returns: Range if current range is not at end of string,
     nil otherwise.
     */
    func after(inString string: String) -> NSRange? {
        guard string.hasContent(after: self) else {
            return nil
        }
        
        let startIndex = location + length
        
        return NSMakeRange(startIndex, string.characters.count - startIndex)
    }
    
    /**
     Whether the current range starts at the first location.
     
     - returns: Whether the current range starts at the first location.
     */
    func doesStartAtFirstLocation() -> Bool {
        return location == 0
    }
    
}
