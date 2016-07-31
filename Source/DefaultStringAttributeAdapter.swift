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
    
    // MARK: - Init/Deinit
    
    /**
     Creates new instance.
     
     - returns: New instance.
     */
    public init() { }
    
    // MARK: - Protocol conformance
    
    // MARK: StringAttributeAdapter
    
    public func dictionary(from attributes: [StringAttribute]) -> [String : AnyObject] {
        var attributesDictionary: [String : AnyObject] = [:]
        
        attributes.forEach() {
            attributesDictionary[key(forAttribute: $0)] = value(forAttribute: $0)
        }
        
        return attributesDictionary
    }
    
    public func key(forAttribute attribute: StringAttribute) -> String {
        switch attribute {
        case .Color:
            return NSForegroundColorAttributeName
        case .Font:
            return NSFontAttributeName
        case .Kern:
            return NSKernAttributeName
        }
    }
    
    public func value(forAttribute attribute: StringAttribute) -> AnyObject {
        switch attribute {
        case .Color(let value):
            return value
        case .Font(let value):
            return value
        case .Kern(let value):
            return value
        }
    }
    
}
