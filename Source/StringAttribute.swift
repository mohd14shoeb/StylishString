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
    
    /// Attachment.
    case Attachment(value: NSTextAttachment)
    
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
    
    /// Link.
    case Link(value: NSURL)
    
    /// Paragraph style.
    case ParagraphStyle(value: NSParagraphStyle)
    
    /// Shadow.
    case Shadow(value: NSShadow)
    
    /// Strikethrough color.
    case StrikethroughColor(value: UIColor)
    
    /// Strikethrough style.
    case StrikethroughStyle(value: NSNumber)
    
    /// Stroke color.
    case StrokeColor(value: UIColor)
    
    /// Stroke width.
    case StrokeWidth(value: NSNumber)
    
    /// Text effect.
    case TextEffect(value: String)
    
    /// Underline style.
    case UnderlineStyle(value: NSNumber)
    
    /// Underline color.
    case UnderlineColor(value: UIColor)
    
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
        case (.Attachment, .Attachment),
             (.BackgroundColor, .BackgroundColor),
             (.Color, .Color),
             (.Font, Font),
             (.Kern, .Kern),
             (.Ligature, .Ligature),
             (.Link, .Link),
             (.ParagraphStyle, .ParagraphStyle),
             (.Shadow, .Shadow),
             (.StrikethroughColor, .StrikethroughColor),
             (.StrikethroughStyle, .StrikethroughStyle),
             (.StrokeColor, .StrokeColor),
             (.StrokeWidth, .StrokeWidth),
             (.TextEffect, .TextEffect),
             (.UnderlineStyle, .UnderlineStyle),
             (.UnderlineColor, .UnderlineColor):
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
    case (.Attachment(let value1), .Attachment(let value2)):
        return value1 == value2
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
    case (.Link(let value1), .Link(let value2)):
        return value1 == value2
    case (.ParagraphStyle(let value1), .ParagraphStyle(let value2)):
        return value1 == value2
    case (.Shadow(let value1), .Shadow(let value2)):
        return value1 == value2
    case (.StrikethroughColor(let value1), .StrikethroughColor(let value2)):
        return value1 == value2
    case (.StrikethroughStyle(let value1), .StrikethroughStyle(let value2)):
        return value1 == value2
    case (.StrokeColor(let value1), .StrokeColor(let value2)):
        return value1 == value2
    case (.StrokeWidth(let value1), .StrokeWidth(let value2)):
        return value1 == value2
    case(.TextEffect(let value1), .TextEffect(let value2)):
        return value1 == value2
    case (.UnderlineStyle(let value1), .UnderlineStyle(let value2)):
        return value1 == value2
    case (.UnderlineColor(let value1), .UnderlineColor(let value2)):
        return value1 == value2
    default:
        return false
    }
}

// MARK: Hashable

extension StringAttribute: Hashable {
    
    public var hashValue: Int {
        switch self {
        case .Attachment(let value):
            return value.hashValue
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
        case .Link(let value):
            return value.hashValue
        case .ParagraphStyle(let value):
            return value.hashValue
        case .Shadow(let value):
            return value.hashValue
        case .StrikethroughColor(let value):
            return value.hashValue
        case .StrikethroughStyle(let value):
            return value.hashValue
        case .StrokeColor(let value):
            return value.hashValue
        case .StrokeWidth(let value):
            return value.hashValue
        case .TextEffect(let value):
            return value.hashValue
        case .UnderlineStyle(let value):
            return value.hashValue
        case .UnderlineColor(let value):
            return value.hashValue
        }
    }
    
}
