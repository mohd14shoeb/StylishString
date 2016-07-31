//
//  UILabel+StylishString.swift
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

extension UILabel {
    
    /**
     Sets text for label with provided attributes applied.
     
     - parameter text:       Text.
     - parameter attributes: Attributes.
     - parameter adapter:    Adapter for translating StringAttribute list to attribute dictionary.
     */
    public func styleText(text: String, attributes: [StringAttribute], adapter: StringAttributeAdapter = DefaultStringAttributeAdapter()) {
        styleSubstring(text, ofText: text, attributes: attributes, adapter: adapter)
    }
    
    /**
     Sets substring text for label with provided attributes applied.
     
     - parameter substring:     Substring.
     - parameter text:          Text.
     - parameter attributes:    Attributes.
     - parameter searchOptions: Options used when searching for substring.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     */
    public func styleSubstring(substring: String, ofText text: String, attributes: [StringAttribute], searchOptions: NSStringCompareOptions = .CaseInsensitiveSearch, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter()) {
        let attributedString = NSMutableAttributedString(string: text)
        let range = attributedString.mutableString.rangeOfString(substring, options: searchOptions)
        
        guard range.location != NSNotFound else {
            return
        }
        
        let attributes = adapter.dictionary(from: attributes)
        
        attributedString.addAttributes(
            attributes,
            range: range
        )
        
        attributedText = attributedString
    }
    
}
