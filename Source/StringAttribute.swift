//
//  StringAttribute.swift
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

/// String attribute.
public enum StringAttribute {
    
    /// Color.
    case Color(value: UIColor)
    
    /// Font.
    case Font(value: UIFont)
    
    /// Kern.
    case Kern(value: CGFloat)
    
}

// MARK: - Instance functions

extension StringAttribute {
    
    /**
     Whether current attribute is the same type as another.
     
     Note: Value is not considered when determining sameness.
     
     - returns: True when types match, false oterhwise.
     */
    func isSameType(asOther other: StringAttribute) -> Bool {
        switch (self, other) {
        case (.Color, .Color),
             (.Font, Font),
             (.Kern, .Kern):
            return true
        default:
            return false
        }
    }
    
}

// MARK: - Protocol conformance

// MARK: Equatable

extension StringAttribute: Equatable {
    
}

/**
 Evaluates whether two StringAttribute types are equal.
 
 Note: Both type and values are considered when determining equality.
 
 - returns: True when equal, false otherwise.
 */
public func ==(lhs: StringAttribute, rhs: StringAttribute) -> Bool {
    guard lhs.isSameType(asOther: rhs) else {
        return false
    }
    
    switch (lhs, rhs) {
    case (.Color(let value1), .Color(let value2)):
        return value1 == value2
    case (.Font(let value1), .Font(let value2)):
        return value1 == value2
    case (.Kern(let value1), .Kern(let value2)):
        return value1 == value2
    default:
        return false
    }
}
