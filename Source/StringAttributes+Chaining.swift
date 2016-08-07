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
    
    // MARK: - Attachment
    
    /**
     Returns a new instance with provided attachment attribute.
     
     - parameter value: Attachment.
     
     - returns: New instance.
     */
    public func attachment(value value: NSTextAttachment) -> StringAttributes {
        return update(with: .Attachment(value: value))
    }
    
    // MARK: - Background Color

    /**
     Returns a new instance with provided background color attribute.
     
     - parameter value: Color.
     
     - returns: New instance.
     */
    public func backgroundColor(value value: UIColor) -> StringAttributes {
        return update(with: .BackgroundColor(value: value))
    }
    
    /**
     Returns a new instance with provided background color attribute.
     
     - parameter red:   Red component of the color, specified from 0.0 to 1.0.
     - parameter green: Green component of the color object, specified from 0.0 to 1.0.
     - parameter blue:  Blue component of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func backgroundColor(red red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return backgroundColor(value: color)
    }
    
    /**
     Returns a new instance with provided background color attribute.
     
     - parameter white: Grayscale value of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func backgroundColor(white white: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(white: white, alpha: alpha)
        
        return backgroundColor(value: color)
    }
    
    /**
     Returns a new instance with provided background color attribute.
     
     - parameter hue:        Hue component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter saturation: Saturation component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter brightness: Brightness of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter alpha:      Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func backgroundColor(hue hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        
        return backgroundColor(value: color)
    }
    
    /**
     Returns a new instance with provided background color attribute.
     
     - parameter patternImage: Image to use when creating pattern color.
     
     - returns: New instance.
     */
    public func backgroundColor(patternImage patternImage: UIImage) -> StringAttributes {
        let color = UIColor(patternImage: patternImage)
        
        return backgroundColor(value: color)
    }
    
    // MARK: - Baseline Offset
    
    /**
     Returns a new instance with provided baseline offset attribute.
     
     - parameter value: Number.
     
     - returns: New instance.
     */
    public func baselineOffset(value value: NSNumber) -> StringAttributes {
        return update(with: .BaselineOffset(value: value))
    }
    
    // MARK: - Color
    
    /**
     Returns a new instance with provided background color attribute.
     
     - parameter value: Color.
     
     - returns: New instance.
     */
    public func color(value value: UIColor) -> StringAttributes {
        return update(with: .Color(value: value))
    }
    
    /**
     Returns a new instance with provided background color attribute.
     
     - parameter red:   Red component of the color, specified from 0.0 to 1.0.
     - parameter green: Green component of the color object, specified from 0.0 to 1.0.
     - parameter blue:  Blue component of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func color(red red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> StringAttributes {
        let newColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return color(value: newColor)
    }
    
    /**
     Returns a new instance with provided background color attribute.
     
     - parameter white: Grayscale value of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func color(white white: CGFloat, alpha: CGFloat) -> StringAttributes {
        let newColor = UIColor(white: white, alpha: alpha)
        
        return color(value: newColor)
    }
    
    /**
     Returns a new instance with provided background color attribute.
     
     - parameter hue:        Hue component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter saturation: Saturation component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter brightness: Brightness of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter alpha:      Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func color(hue hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> StringAttributes {
        let newColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        
        return color(value: newColor)
    }
    
    /**
     Returns a new instance with provided background color attribute.
     
     - parameter patternImage: Image to use when creating pattern color.
     
     - returns: New instance.
     */
    public func color(patternImage patternImage: UIImage) -> StringAttributes {
        let newColor = UIColor(patternImage: patternImage)
        
        return color(value: newColor)
    }
    
    // MARK: - Expansion
    
    /**
     Returns a new instance with provided expansion attribute.
     
     - parameter value: Number.
     
     - returns: New instance.
     */
    public func expansion(value value: NSNumber) -> StringAttributes {
        return update(with: .Expansion(value: value))
    }
    
    // MARK: - Font
    
    /**
     Returns a new instance with provided font attribute.
     
     - parameter value: Font.
     
     - returns: New instance.
     */
    public func font(value value: UIFont) -> StringAttributes {
        return update(with: .Font(value: value))
    }
    
    /**
     Returns a new instance with provided font attribute.
     
     Note: If font cannot be created, original attributes are returned.
     
     - parameter name: Fully specified name of font.
     - parameter size: Size in point to which font should be scaled. This value must be greater than 0.0.
     
     - returns: New instance.
     */
    public func font(name name: String, size: CGFloat) -> StringAttributes {
        guard let newFont = UIFont(name: name, size: size) else {
            return self
        }
        
        return font(value: newFont)
    }
    
    /**
     Returns a new instance with provided font attribute.
     
     - parameter descriptor: Font descriptor to match.
     - parameter size: Size in point to which font should be scaled. If greater than 0.0, it has precedence of UIFontDescriptorSizeAttribute in descriptor.
     
     - returns: New instance.
     */
    public func font(descriptor descriptor: UIFontDescriptor, size: CGFloat) -> StringAttributes {
        let newFont = UIFont(descriptor: descriptor, size: size)
        
        return font(value: newFont)
    }
    
    // MARK: - Kern
    
    /**
     Returns a new instance with provided kern attribute.
     
     - parameter value: Kern.
     
     - returns: New instance.
     */
    public func kern(value value: CGFloat) -> StringAttributes {
        return update(with: .Kern(value: value))
    }
    
    // MARK: - Ligature
    
    /**
     Returns a new instance with provided kern attribute.
     
     - parameter value: Kern.
     
     - returns: New instance.
     */
    public func ligature(value value: NSNumber) -> StringAttributes {
        return update(with: .Ligature(value: value))
    }
    
    // MARK: - Link
    
    /**
     Returns a new instance with provided link attribute.
     
     - parameter value: URL.
     
     - returns: New instance.
     */
    public func link(value value: NSURL) -> StringAttributes {
        return update(with: .Link(value: value))
    }
    
    /**
     Returns a new instance with provided link attribute.
     
     Note: If link cannot be created, original attributes are returned.
     
     - parameter string: URL string.
     
     - returns: New instance.
     */
    public func link(string string: String) -> StringAttributes {
        guard let url = NSURL(string: string) else {
            return self
        }
        
        return link(value: url)
    }
    
    /**
     Returns a new instance with provided link attribute.
     
     Note: If link cannot be created, original attributes are returned.
     
     - parameter string:        URL string.
     - parameter relativeToURL: Base URL.
     
     - returns: New instance.
     */
    public func link(string string: String, relativeToURL baseURL: NSURL?) -> StringAttributes {
        guard let url = NSURL(string: string, relativeToURL: baseURL) else {
            return self
        }
        
        return link(value: url)
    }
    
    // MARK: - Obliqueness
    
    /**
     Returns a new instance with provided obliqueness attribute.
     
     - parameter value: Number.
     
     - returns: New instance.
     */
    public func obliqueness(value value: NSNumber) -> StringAttributes {
        return update(with: .Obliqueness(value: value))
    }
    
    // MARK: - Paragraph Style
    
    /**
     Returns a new instance with provided ligature attribute.
     
     - parameter value: Number.
     
     - returns: New instance.
     */
    public func paragraphStyle(value value: NSParagraphStyle) -> StringAttributes {
        return update(with: .ParagraphStyle(value: value))
    }
    
    // MARK: - Shadow
    
    /**
     Returns a new instance with provided shadow attribute.
     
     - parameter value: Shadow.
     
     - returns: New instance.
     */
    public func shadow(value value: NSShadow) -> StringAttributes {
        return update(with: .Shadow(value: value))
    }
    
    /**
     Returns a new instance with provided shadow attribute.
     
     - parameter offset:     Offset in user space of the shadow from the original drawing.
     - parameter blurRadius: Blur radius of the shadow in default user space units.
     - parameter color:      Color.
     
     - returns: New instance.
     */
    public func shadow(offset offset: CGSize, blurRadius: CGFloat, color: AnyObject?) -> StringAttributes {
        let shadow = NSShadow()
        
        shadow.shadowOffset = offset
        shadow.shadowBlurRadius = blurRadius
        shadow.shadowColor = color
        
        return update(with: .Shadow(value: shadow))
    }
    
    // MARK: - Strikethrough Color
    
    /**
     Returns a new instance with provided strikethrough color attribute.
     
     - parameter value: Color.
     
     - returns: New instance.
     */
    public func strikethroughColor(value value: UIColor) -> StringAttributes {
        return update(with: .StrikethroughColor(value: value))
    }
    
    /**
     Returns a new instance with provided strikethrough color attribute.
     
     - parameter red:   Red component of the color, specified from 0.0 to 1.0.
     - parameter green: Green component of the color object, specified from 0.0 to 1.0.
     - parameter blue:  Blue component of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func strikethroughColor(red red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return strikethroughColor(value: color)
    }
    
    /**
     Returns a new instance with provided strikethrough color attribute.
     
     - parameter white: Grayscale value of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func strikethroughColor(white white: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(white: white, alpha: alpha)
        
        return strikethroughColor(value: color)
    }
    
    /**
     Returns a new instance with provided strikethrough color attribute.
     
     - parameter hue:        Hue component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter saturation: Saturation component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter brightness: Brightness of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter alpha:      Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func strikethroughColor(hue hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        
        return strikethroughColor(value: color)
    }
    
    /**
     Returns a new instance with provided strikethrough color attribute.
     
     - parameter patternImage: Image to use when creating pattern color.
     
     - returns: New instance.
     */
    public func strikethroughColor(patternImage patternImage: UIImage) -> StringAttributes {
        let color = UIColor(patternImage: patternImage)
        
        return strikethroughColor(value: color)
    }
    
    // MARK: - Strikethrough Style
    
    /**
     Returns a new instance with provided strikethrough style attribute.
     
     - parameter value: Style.
     
     - returns: New instance.
     */
    public func strikethroughStyle(value value: NSNumber) -> StringAttributes {
        return update(with: .StrikethroughStyle(value: value))
    }
    
    // MARK: - Stroke Color
    
    /**
     Returns a new instance with provided stroke color attribute.
     
     - parameter value: Color.
     
     - returns: New instance.
     */
    public func strokeColor(value value: UIColor) -> StringAttributes {
        return update(with: .StrokeColor(value: value))
    }
    
    /**
     Returns a new instance with provided stroke color attribute.
     
     - parameter red:   Red component of the color, specified from 0.0 to 1.0.
     - parameter green: Green component of the color object, specified from 0.0 to 1.0.
     - parameter blue:  Blue component of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func strokeColor(red red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return strokeColor(value: color)
    }
    
    /**
     Returns a new instance with provided stroke color attribute.
     
     - parameter white: Grayscale value of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func strokeColor(white white: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(white: white, alpha: alpha)
        
        return strokeColor(value: color)
    }
    
    /**
     Returns a new instance with provided stroke color attribute.
     
     - parameter hue:        Hue component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter saturation: Saturation component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter brightness: Brightness of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter alpha:      Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func strokeColor(hue hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        
        return strokeColor(value: color)
    }
    
    /**
     Returns a new instance with provided stroke color attribute.
     
     - parameter patternImage: Image to use when creating pattern color.
     
     - returns: New instance.
     */
    public func strokeColor(patternImage patternImage: UIImage) -> StringAttributes {
        let color = UIColor(patternImage: patternImage)
        
        return strokeColor(value: color)
    }
    
    // MARK: - Stroke Width
    
    /**
     Returns a new instance with provided stroke width attribute.
     
     - parameter value: Width.
     
     - returns: New instance.
     */
    public func strokeWidth(value value: NSNumber) -> StringAttributes {
        return update(with: .StrokeWidth(value: value))
    }
    
    // MARK: - Text Effect
    
    /**
     Returns a new instance with provided text effect attribute.
     
     - parameter value: Text effect string.
     
     - returns: New instance.
     */
    public func textEffect(value value: String) -> StringAttributes {
        return update(with: .TextEffect(value: value))
    }
    
    // MARK: - Underline Color
    
    /**
     Returns a new instance with provided underline color attribute.
     
     - parameter value: Color.
     
     - returns: New instance.
     */
    public func underlineColor(value value: UIColor) -> StringAttributes {
        return update(with: .UnderlineColor(value: value))
    }
    
    /**
     Returns a new instance with provided underline color attribute.
     
     - parameter red:   Red component of the color, specified from 0.0 to 1.0.
     - parameter green: Green component of the color object, specified from 0.0 to 1.0.
     - parameter blue:  Blue component of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func underlineColor(red red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return underlineColor(value: color)
    }
    
    /**
     Returns a new instance with provided underline color attribute.
     
     - parameter white: Grayscale value of the color, specified from 0.0 to 1.0.
     - parameter alpha: Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func underlineColor(white white: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(white: white, alpha: alpha)
        
        return underlineColor(value: color)
    }
    
    /**
     Returns a new instance with provided underline color attribute.
     
     - parameter hue:        Hue component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter saturation: Saturation component of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter brightness: Brightness of the color in the HSB color space, specified from 0.0 to 1.0.
     - parameter alpha:      Opacity value of the color, specified from 0.0 to 1.0.
     
     - returns: New instance.
     */
    public func underlineColor(hue hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> StringAttributes {
        let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        
        return underlineColor(value: color)
    }
    
    /**
     Returns a new instance with provided underline color attribute.
     
     - parameter patternImage: Image to use when creating pattern color.
     
     - returns: New instance.
     */
    public func underlineColor(patternImage patternImage: UIImage) -> StringAttributes {
        let color = UIColor(patternImage: patternImage)
        
        return underlineColor(value: color)
    }
    
    // MARK: - Underline Style
    
    /**
     Returns a new instance with provided underline style attribute.
     
     - parameter value: Style.
     
     - returns: New instance.
     */
    public func underlineStyle(value value: NSNumber) -> StringAttributes {
        return update(with: .UnderlineStyle(value: value))
    }
    
    // MARK: - Vertical Glyph Form
    
    /**
     Returns a new instance with provided vertical glyph form attribute.
     
     - parameter value: Number.
     
     - returns: New instance.
     */
    public func verticalGlyphForm(value value: NSNumber) -> StringAttributes {
        return update(with: .VerticalGlyphForm(value: value))
    }
    
}
