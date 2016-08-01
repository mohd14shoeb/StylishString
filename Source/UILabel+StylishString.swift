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
     Sets attributedText and styles with provided attribute.
     
     - parameter text:      Text.
     - parameter adapter:   Adapter for translating StringAttribute list to attribute dictionary.
     - parameter attribute: Function returning a single attribute.
     */
    public func styleText(text: String, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter(), attribute: () -> StringAttribute) {
        styleText(text, adapter: adapter) { [ attribute() ] }
    }
    
    /**
     Sets attributedText and styles with provided attributes.
     
     - parameter text:           Text.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     - parameter attributeList: Function returning a list of attributes.
     */
    public func styleText(text: String, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter(), attributeList: () -> [StringAttribute]) {
        styleText(text, adapter: adapter, attributes: StringAttributes { attributeList() })
    }
    
    /**
     Sets attributedText and styles with provided attributes.
     
     - parameter text:       Text.
     - parameter adapter:    Adapter for translating StringAttribute list to attribute dictionary.
     - parameter attributes: Attributes.
     */
    public func styleText(text: String, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter(), attributes: StringAttributes) {
        styleSubstring(text, ofText: text, adapter: adapter, attributes: attributes)
    }
    
    /**
     Sets attributedText and styles substring with provided attributes.
     
     - parameter substring:     Substring.
     - parameter text:          Text.
     - parameter searchOptions: Options used when searching for substring.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     - parameter attribute:     Function returning a single attribute.
     */
    public func styleSubstring(substring: String, ofText text: String, searchOptions: NSStringCompareOptions = .CaseInsensitiveSearch, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter(), attribute: () -> StringAttribute) {
        styleSubstring(substring, ofText: text, searchOptions: searchOptions, adapter: adapter) { [ attribute() ] }
    }
    
    /**
     Sets attributedText and styles substring with provided attributes.
     
     - parameter substring:     Substring.
     - parameter text:          Text.
     - parameter searchOptions: Options used when searching for substring.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     - parameter attributeList: Function returning a list of attributes.
     */
    public func styleSubstring(substring: String, ofText text: String, searchOptions: NSStringCompareOptions = .CaseInsensitiveSearch, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter(), attributeList: () -> [StringAttribute]) {
        styleSubstring(substring, ofText: text, searchOptions: searchOptions, adapter: adapter, attributes: StringAttributes { attributeList() })
    }
    
    /**
     Sets attributedText and styles substring with provided attributes.
     
     - parameter substring:     Substring.
     - parameter text:          Text.
     - parameter searchOptions: Options used when searching for substring.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     - parameter attributes:    Attributes.
     */
    public func styleSubstring(substring: String, ofText text: String, searchOptions: NSStringCompareOptions = .CaseInsensitiveSearch, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter(), attributes: StringAttributes) {
        guard let _ = attributedText  else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: text)
        
        if attributedText!.string != text {
            attributedText = attributedString
        }
        
        styleSubstring(substring, searchOptions: searchOptions, adapter: adapter, attributes: attributes)
    }
    
    /**
     Styles substring of attributedText with provided attributes.
     
     - parameter substring:     Substring.
     - parameter text:          Text.
     - parameter searchOptions: Options used when searching for substring.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     - parameter attribute:     Function returning a single attribute.
     */
    public func styleSubstring(substring: String, searchOptions: NSStringCompareOptions = .CaseInsensitiveSearch, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter(), attribute: () -> StringAttribute) {
        styleSubstring(substring, searchOptions: searchOptions, adapter: adapter) { [ attribute() ] }
    }
    
    /**
     Styles substring of attributedText with provided attributes.
     
     - parameter substring:     Substring.
     - parameter text:          Text.
     - parameter searchOptions: Options used when searching for substring.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     - parameter attributeList: Function returning a list of attributes.
     */
    public func styleSubstring(substring: String, searchOptions: NSStringCompareOptions = .CaseInsensitiveSearch, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter(), attributeList: () -> [StringAttribute]) {
        styleSubstring(substring, searchOptions: searchOptions, adapter: adapter, attributes: StringAttributes { attributeList() })
    }
    
    /**
     Styles substring of attributedText with provided attributes.
     
     Using this function assumes that attributedText is already
     set to the desired value. This may not be the case if Label text is defaulting
     to a Storyboard value which does not reflect the desired text value at run-time. 
     If the attributedText is not known to be set, use 
     styleSubstring(_:ofText:attributes:searchOptions:adatper) instead.
     
     - parameter substring:     Substring.
     - parameter searchOptions: Options used when searching for substring.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     - parameter attributes:    Attributes.
     */
    public func styleSubstring(substring: String, searchOptions: NSStringCompareOptions = .CaseInsensitiveSearch, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter(), attributes: StringAttributes) {
        guard let _ = attributedText  else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: attributedText!.string)
        let range = attributedString.mutableString.rangeOfString(substring, options: searchOptions)
        
        guard range.location != NSNotFound else {
            return
        }
        
        let attributes = adapter.dictionary(from: attributes.values)
        
        attributedString.addAttributes(
            attributes,
            range: range
        )
        
        var finalAttributedString = attributedString.attributedSubstringFromRange(range)
        
        if let rangeOfContentBeforeSubstring = range.before(inString: attributedString.string) {
            let beforeAttributedString = attributedText!.attributedSubstringFromRange(rangeOfContentBeforeSubstring)
            
            finalAttributedString = beforeAttributedString.append(finalAttributedString)
        }
        
        if let rangeOfContentAfterSubstring = range.after(inString: attributedString.string) {
            let afterAttributedString = attributedText!.attributedSubstringFromRange(rangeOfContentAfterSubstring)
            
            finalAttributedString = finalAttributedString.append(afterAttributedString)
        }
        
        attributedText = finalAttributedString
    }
    
}
