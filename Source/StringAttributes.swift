//
//  StringAttributes.swift
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

/// Data structure wrapping a list of StringAttribute.
public struct StringAttributes {
    
    // MARK: - Properties
    
    /// Values.
    let values: [StringAttribute]
    
    // MARK: - Init/Deinit
    
    /**
     Creates new instance  from provided values.
     Designated initializer.
     
     - parameter values: Values.
     
     - returns: New instance.
     */
    public init(values: [StringAttribute]) {
        self.values = values
    }
    
    /**
     Convenience initializer for creating an instance from
     a single attribute.
     
     - parameter values: Values.
     
     - returns: New instance.
     */
    public init(value: StringAttribute) {
        self.values = [value]
    }
    
    /**
     Convenience initializer for creating an instance with
     an empty list of values.
     
     - returns: New instance.
     */
    public init() {
        self.init(values: [])
    }
    
    /**
     Convenience intializer for creating an instance from a
     function that returns a list of values.
     
     - parameter createAttributes: Function returning a list of values.
     
     - returns: New instance.
     */
    public init(@noescape _ createAttributes: () -> [StringAttribute]) {
        self.init(values: createAttributes())
    }

    /**
     Convenience intializer for creating an instance from a
     function that returns a single value.
     
     - parameter createAttributes: Function returning a single value.
     
     - returns: New instance.
     */
    public init(@noescape _ createAttributes: () -> StringAttribute) {
        self.init(value: createAttributes())
    }
    
}
