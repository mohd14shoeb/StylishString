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
    
    /// Adapter.
    let adapter: StringAttributeAdapter
    
    /// Values.
    let values: [StringAttribute]
    
    // MARK: - Init/Deinit
    
    /**
     Creates new instance from provided values and adapter.
     Designated initializer.
     
     - warning: If multiple values of the same type are added,
     only the final value is kept.
     
     - parameter values:  Values.
     - parameter adapter: Adapter.
     
     - returns: New instance.
     */
    public init(values: [StringAttribute], adapter: StringAttributeAdapter) {
        self.adapter = adapter
        self.values = uniqeElements(from: values)
    }
    
    /**
     Convenience initializer for creating an instance from a list of values.
     
     - parameter values:  Values.
     
     - returns: New instance.
     */
    public init(values: [StringAttribute]) {
        self.init(values: values, adapter: DefaultStringAttributeAdapter())
    }
    
    /**
     Convenience initializer for creating an instance from
     a single attribute.
     
     - parameter values: Values.
     
     - returns: New instance.
     */
    public init(value: StringAttribute) {
        self.init(values: [value])
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
     
     - parameter attributeList: Function returning a list of values.
     
     - returns: New instance.
     */
    public init(@noescape _ attributeList: () -> [StringAttribute]) {
        self.init(values: attributeList())
    }

    /**
     Convenience intializer for creating an instance from a
     function that returns a single value.
     
     - parameter createAttributes: Function returning a single value.
     
     - returns: New instance.
     */
    public init(@noescape _ attribute: () -> StringAttribute) {
        self.init(value: attribute())
    }
    
    // MARK: - Instance functions
    
    /**
     Return attributes dictionary compatible with NSAttributedString API.
     
     - returns: Attributes dictionary.
     */
    public func toDictionary() -> [String : AnyObject] {
        return adapter.dictionary(from: values)
    }
    
    /**
     Returns a new instance with the result of updating values with
     the provided attribute.
     
     If an attribute of the same type already exists within values,
     it is replaced.
     
     - parameter attribute: Attribute to update with.
     
     - returns: New instance.
     */
    public func update(with attribute: StringAttribute) -> StringAttributes {
        return update(with: [attribute])
    }
    
    /**
     Returns a new instance with the result of updating values with
     the provided attributes.
     
     If an attribute of the same type already exists within values,
     it is replaced.
     
     - parameter attribute: Attribute to update with.
     
     - returns: New instance.
     */
    public func update(with attributes: [StringAttribute]) -> StringAttributes {
        var newValues = values
        
        attributes.forEach() { attribute in
            let indexOfKey = newValues.indexOf { attribute.isSameType(asOther: $0) }
            
            if let index = indexOfKey {
                newValues.removeAtIndex(index)
            }
        }
        
        newValues.appendContentsOf(attributes)
        
        return StringAttributes { newValues }
    }
    
}
