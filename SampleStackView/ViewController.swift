//
//  ViewController.swift
//
//  Created by Home on 2019.
//  Copyright 2017-2018 NoStoryboardsAtAll Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

class ViewController: UIViewController {
    // array with colors
    let colors: [UIColor] = [.red, .yellow, .green]
    
    // stack view declaration
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        // initial stack axis
        stack.axis = .horizontal
        // this is how the arranged views will be aligned in stack
        stack.alignment = .center
        // this is how views will be presented
        stack.distribution = .equalSpacing
        // spacing between views
        stack.spacing = 13.0
        
        return stack
    }()
    
    // declaration for the segmented control
    lazy var segmentedControl: UISegmentedControl = {
        // declared with two items
        let control = UISegmentedControl(items: [".horizontal", ".vertical"])
        
        // will use auto layout
        control.translatesAutoresizingMaskIntoConstraints = false
        // select first segment 
        control.selectedSegmentIndex = 0
        // add handler to segmented control
        control.addTarget(self, action: #selector(handler(_:)), for: .valueChanged)
        
        return control
    }()
    
    // Do any additional setup here
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // Setup your view and constraints here
    override func loadView() {
        super.loadView()
        prepareView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
    }
    
    private func prepareView() {
        // add views to the superview
        view.addSubview(segmentedControl)
        view.addSubview(stackView)
        
        // activate constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            segmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13.0)
        ])
        
        // add arranged views to stack view
        colors.forEach { (color) in
            let arrangedView = MyView(color: color)
            stackView.addArrangedSubview(arrangedView)
        }
    }
    
    // segmented view's change value handler
    @objc func handler(_ sender: UISegmentedControl) {
        // switch stack view axis between horizontal and vertical
        switch sender.selectedSegmentIndex {
        case 0:
            stackView.axis = .horizontal
        case 1:
            stackView.axis = .vertical
        default:
            break
        }
    }
}

