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
     Sets attributedText and styles with provided attributes.
     
     - parameter text:       Text.
     - parameter attributes: Attributes.
     - parameter adapter:    Adapter for translating StringAttribute list to attribute dictionary.
     */
    public func styleText(text: String, attributes: [StringAttribute], adapter: StringAttributeAdapter = DefaultStringAttributeAdapter()) {
        styleSubstring(text, ofText: text, attributes: attributes, adapter: adapter)
    }
    
    /**
     Sets attributedText and styles substring with provided attributes.
     
     - parameter substring:     Substring.
     - parameter text:          Text.
     - parameter attributes:    Attributes.
     - parameter searchOptions: Options used when searching for substring.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     */
    public func styleSubstring(substring: String, ofText text: String, attributes: [StringAttribute], searchOptions: NSStringCompareOptions = .CaseInsensitiveSearch, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter()) {
        guard let _ = attributedText  else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: text)
        
        if attributedText!.string != text {
            attributedText = attributedString
        }
        
        styleSubstring(substring, attributes: attributes, searchOptions: searchOptions, adapter: adapter)
    }
    
    /**
     Styles substring of attributedText with provided attributes.
     
     Using this function assumes that attributedText is already
     set to the desired value. This may not be the case if Label text is defaulting
     to a Storyboard value which does not reflect the desired text value at run-time. 
     If the attributedText is not known to be set, use 
     styleSubstring(_:ofText:attributes:searchOptions:adatper) instead.
     
     - parameter substring:     Substring.
     - parameter attributes:    Attributes.
     - parameter searchOptions: Options used when searching for substring.
     - parameter adapter:       Adapter for translating StringAttribute list to attribute dictionary.
     */
    public func styleSubstring(substring: String, attributes: [StringAttribute], searchOptions: NSStringCompareOptions = .CaseInsensitiveSearch, adapter: StringAttributeAdapter = DefaultStringAttributeAdapter()) {
        guard let _ = attributedText  else {
            return
        }
        
        let attributedString = NSMutableAttributedString(string: attributedText!.string)
        let range = attributedString.mutableString.rangeOfString(substring, options: searchOptions)
        
        guard range.location != NSNotFound else {
            return
        }
        
        let attributes = adapter.dictionary(from: attributes)
        
        attributedString.addAttributes(
            attributes,
            range: range
        )
        
        let attributedSubstring = attributedString.attributedSubstringFromRange(range)
        var finalAttributedString = attributedSubstring
        
        if let beforeRange = rangeBefore(range: range, inString: attributedString.string) {
            let beforeAttributedString = attributedText!.attributedSubstringFromRange(beforeRange)
            
            finalAttributedString = concatenate(beforeAttributedString, withOther: finalAttributedString)
        }
        
        if let afterRange = rangeAfter(range: range, inString: attributedString.string) {
            let afterAttributedString = attributedText!.attributedSubstringFromRange(afterRange)
            
            finalAttributedString = concatenate(finalAttributedString, withOther: afterAttributedString)
        }
        
        attributedText = finalAttributedString
    }
    
    // MARK: - Private functions
    
    private func rangeBefore(range range: NSRange, inString string: String) -> NSRange? {
        guard range.location != 0 else {
            return nil
        }
        
        let head = substring(ofString: string, fromIndex: range.location)
        
        return NSMakeRange(0, string.characters.count - head.characters.count)
    }
    
    private func rangeAfter(range range: NSRange, inString string: String) -> NSRange? {
        guard doesString(string, haveContentAfterRange: range) else {
            return nil
        }
        
        let startIndex = range.location + range.length
        
        return NSMakeRange(startIndex, string.characters.count - startIndex)
    }
    
    private func doesString(string: String, haveContentAfterRange range: NSRange) -> Bool {
        return (range.location + range.length) != string.characters.count
    }
    
    private func substring(ofString string: String, fromIndex index: Int) -> String {
        let convertedString = string as NSString
        
        return convertedString.substringFromIndex(index)
    }
    
    private func concatenate(attributedString: NSAttributedString, withOther other: NSAttributedString) -> NSAttributedString {
        let concatenation = NSMutableAttributedString(attributedString: attributedString)
        
        concatenation.appendAttributedString(other)
        
        return concatenation
    }
    
}
