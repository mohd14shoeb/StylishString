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

import UIKit

/// String attribute.
public enum StringAttribute {
    
    /// Background color.
    case BackgroundColor(value: UIColor)
    
    /// Color.
    case Color(value: UIColor)
    
    /// Font.
    case Font(value: UIFont)
    
    /// Kern.
    case Kern(value: CGFloat)
    
    /// Ligature.
    case Ligature(value: NSNumber)
    
    /// Paragraph style.
    case ParagraphStyle(value: NSParagraphStyle)
    
    /// Strikethrough color.
    case StrikethroughColor(value: UIColor)
    
    /// Strikethrough style.
    case StrikethroughStyle(value: NSNumber)
    
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
        case (.BackgroundColor, .BackgroundColor),
             (.Color, .Color),
             (.Font, Font),
             (.Kern, .Kern),
             (.Ligature, .Ligature),
             (.ParagraphStyle, .ParagraphStyle),
             (.StrikethroughColor, .StrikethroughColor),
             (.StrikethroughStyle, .StrikethroughStyle):
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
    case (.BackgroundColor(let value1), .BackgroundColor(let value2)):
        return value1 == value2
    case (.Color(let value1), .Color(let value2)):
        return value1 == value2
    case (.Font(let value1), .Font(let value2)):
        return value1 == value2
    case (.Kern(let value1), .Kern(let value2)):
        return value1 == value2
    case (.Ligature(let value1), .Ligature(let value2)):
        return value1 == value2
    case (.ParagraphStyle(let value1), .ParagraphStyle(let value2)):
        return value1 == value2
    case (.StrikethroughColor(let value1), .StrikethroughColor(let value2)):
        return value1 == value2
    case (.StrikethroughStyle(let value1), .StrikethroughStyle(let value2)):
        return value1 == value2
    default:
        return false
    }
}

// MARK: Hashable

extension StringAttribute: Hashable {
    
    public var hashValue: Int {
        switch self {
        case .BackgroundColor(let value):
            return value.hashValue
        case .Color(let value):
            return value.hashValue
        case .Font(let value):
            return value.hashValue
        case .Kern(let value):
            return Int(value)
        case .Ligature(let value):
            return value.hashValue
        case .ParagraphStyle(let value):
            return value.hashValue
        case .StrikethroughColor(let value):
            return value.hashValue
        case .StrikethroughStyle(let value):
            return value.hashValue
        }
    }
    
}
