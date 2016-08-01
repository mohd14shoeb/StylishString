//
//  ViewController.swift
//  StylishStringDemo
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

import StylishString
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: Private properties
    
    @IBOutlet private weak var topLabel: UILabel!
    @IBOutlet private weak var bottomLabel: UILabel!
    
    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Attributes created via chaining
        
        let attributes = StringAttributes()
            .color(red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0)
            .font(name: "AvenirNext-Bold", size: 40)
            .kern(value: 2)
        
        let substringAttributes = attributes
            .update(with: .Color(value: UIColor.magentaColor()))
        
        topLabel.styleText("Hello World", attributes: attributes)
        topLabel.styleSubstring("Hello", attributes: substringAttributes)
        
        print(attributes.toDictionary())
        
        // Attributes created in-line
        
        bottomLabel.styleText("Goobye World") {[
            .Color(value: UIColor.redColor()),
            .Font(value: UIFont.systemFontOfSize(30)),
            .Kern(value: 15)
        ]}
        
    }

}
