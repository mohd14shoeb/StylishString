//
//  StringAttributeAdapter.swift
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

/// Adapter for translating between StringAttribute data and other types.
public protocol StringAttributeAdapter {
    
    /**
     Creates an attributes dictionary from provided list of StringAttribute.
     
     - parameter attributes: StringAttribute list.
     
     - returns: Dictionary.
     */
    func dictionary(from attributes: [StringAttribute]) -> [String : AnyObject]
    
    /**
     Associated key in Foundation for provided attribute.
     
     For example, the Font attribute has the associated key NSFontAttributeName.
     
     - parameter attribute: StringAttribute.
     
     - returns: Key.
     */
    func key(forAttribute attribute: StringAttribute) -> String
    
    /**
     Value for the attribute instance.
     
     - parameter attribute: StringAttribute.
     
     - returns: Value.
     */
    func value(forAttribute attribute: StringAttribute) -> AnyObject
    
}
