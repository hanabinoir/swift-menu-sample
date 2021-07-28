//
//  OCRView.swift
//  interview-practice
//
//  Created by Hiroshi Shin on 2021/04/23.
//

import Foundation
import UIKit

class OCRView: UIView {
    
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setup() {
        backgroundColor = .systemBackground
        label.text = "OCR"
        addSubview(label)
    }
    
}
