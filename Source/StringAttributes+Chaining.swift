//
//  StringAttributes+Chaining.swift
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

extension StringAttributes {
    
    // MARK: - Color
    
    /**
     Returns a new instance with provided color attribute.
     
     - parameter value: Color.
     
     - returns: New instance.
     */
    public func color(value value: UIColor) -> StringAttributes {
        return self.update(with: .Color(value: value))
    }
    
    /**
     Returns a new instance with provided color attribute.
     
     - parameter red:   Red component of the color, specified from 0.0 to 1.0.
     - parameter green: Green component of the color object, specified from 0.0 to 1.0.
     - parameter blue:  Blue component of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func color(red red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return self.update(with: .Color(value: color))
    }
    
    /**
     Returns a new instance with provided color attribute.
     
     - parameter white: Grayscale value of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func color(white white: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(white: white, alpha: alpha)
        
        return self.update(with: .Color(value: color))
    }
    
    /**
     Returns a new instance with provided color attribute.
     
     - parameter hue:        Hue component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter saturation: Saturation component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter brightness: Brightness of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter alpha:      Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func color(hue hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        
        return self.update(with: .Color(value: color))
    }
    
    /**
     Returns a new instance with provided color attribute.
     
     - parameter patternImage: Image to use when creating pattern color.
     
     - returns: New instance.
     */
    public func color(patternImage patternImage: UIImage) -> StringAttributes {
        let color = UIColor(patternImage: patternImage)
        
        return self.update(with: .Color(value: color))
    }
    
    // MARK: - Font
    
    /**
     Returns a new instance with provided font attribute.
     
     Note: If font cannot be created, original attributes are returned.
     
     - parameter name: Fully specified name of font.
     - parameter size: Size in point to which font should be scaled. This value must be greater than 0.0.
     
     - returns: New instance.
     */
    public func font(name name: String, size: CGFloat) -> StringAttributes {
        guard let font = UIFont(name: name, size: size) else {
            return self
        }
        
        return self.update(with: .Font(value: font))
    }
    
    /**
     Returns a new instance with provided font attribute.
     
     - parameter descriptor: Font descriptor to match.
     - parameter size: Size in point to which font should be scaled. If greater than 0.0, it has precedence of UIFontDescriptorSizeAttribute in descriptor.
     
     - returns: New instance.
     */
    public func font(descriptor descriptor: UIFontDescriptor, size: CGFloat) -> StringAttributes {
        let font = UIFont(descriptor: descriptor, size: size)
        
        return self.update(with: .Font(value: font))
    }
    
    // MARK: - Kern
    
    /**
     Returns a new instance with provided kern attribute.
     
     - parameter value: Kern.
     
     - returns: New instance.
     */
    public func kern(value value: CGFloat) -> StringAttributes {
        return self.update(with: .Kern(value: value))
    }
    
}