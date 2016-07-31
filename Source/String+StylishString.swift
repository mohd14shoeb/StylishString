//
//  String+StylishString.swift
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

extension String {
    
    /**
     Substring of string staring from provided index until end.
     
     - parameter index: Index to start substring from.
     
     - returns: Substring.
     */
    internal func substring(fromIndex index: Int) -> String {
        let convertedString = self as NSString
        
        return convertedString.substringFromIndex(index)
    }
    
    /**
     Whether the current string has any content before the provided
     range.
     
     - parameter range: Range.
     
     - returns: True when string has content before range, false otherwise.
     */
    internal func hasContent(before range: NSRange) -> Bool {
        return !range.doesStartFirstLocation()
    }
    
    /**
     Whether the current string has any content after the provided
     range.
     
     - parameter range: Range.
     
     - returns: True when string has content after range, false otherwise.
     */
    internal func hasContent(after range: NSRange) -> Bool {
        return (range.location + range.length) != characters.count
    }
    
}
