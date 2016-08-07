//
//  DefaultStringAttributeAdapter.swift
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

/// Default StringAttribute adapter.
public struct DefaultStringAttributeAdapter: StringAttributeAdapter {
    
    public func dictionary(from attributes: [StringAttribute]) -> [String : AnyObject] {
        var attributesDictionary: [String : AnyObject] = [:]
        
        attributes.forEach() {
            attributesDictionary[key(forAttribute: $0)] = value(forAttribute: $0)
        }
        
        return attributesDictionary
    }
    
    public func key(forAttribute attribute: StringAttribute) -> String {
        switch attribute {
        case .Attachment:
            return NSAttachmentAttributeName
        case .BackgroundColor:
            return NSBackgroundColorAttributeName
        case .BaselineOffset:
            return NSBaselineOffsetAttributeName
        case .Color:
            return NSForegroundColorAttributeName
        case .Expansion:
            return NSExpansionAttributeName
        case .Font:
            return NSFontAttributeName
        case .Kern:
            return NSKernAttributeName
        case .Ligature:
            return NSLigatureAttributeName
        case .Link:
            return NSLinkAttributeName
        case .Obliqueness:
            return NSObliquenessAttributeName
        case .ParagraphStyle:
            return NSParagraphStyleAttributeName
        case .Shadow:
            return NSShadowAttributeName
        case .StrikethroughColor:
            return NSStrikethroughColorAttributeName
        case .StrikethroughStyle:
            return NSStrikethroughStyleAttributeName
        case .StrokeColor:
            return NSStrokeColorAttributeName
        case .StrokeWidth:
            return NSStrokeWidthAttributeName
        case .TextEffect:
            return NSTextEffectAttributeName
        case .UnderlineStyle:
            return NSUnderlineStyleAttributeName
        case .UnderlineColor:
            return NSUnderlineColorAttributeName
        case .VerticalGlyphForm:
            return NSVerticalGlyphFormAttributeName
        case .WritingDirection:
            return NSWritingDirectionAttributeName
        }
    }
    
    public func value(forAttribute attribute: StringAttribute) -> AnyObject {
        switch attribute {
        case .Attachment(let value):
            return value
        case .BackgroundColor(let value):
            return value
        case .BaselineOffset(let value):
            return value
        case .Color(let value):
            return value
        case .Expansion(let value):
            return value
        case .Font(let value):
            return value
        case .Kern(let value):
            return value
        case .Ligature(let value):
            return value
        case .Link(let value):
            return value
        case .Obliqueness(let value):
            return value
        case .ParagraphStyle(let value):
            return value
        case .Shadow(let value):
            return value
        case .StrikethroughColor(let value):
            return value
        case .StrikethroughStyle(let value):
            return value
        case .StrokeColor(let value):
            return value
        case .StrokeWidth(let value):
            return value
        case .TextEffect(let value):
            return value
        case .UnderlineStyle(let value):
            return value
        case .UnderlineColor(let value):
            return value
        case .VerticalGlyphForm(let value):
            return value
        case .WritingDirection(let value):
            return value
        }
    }
    
}
