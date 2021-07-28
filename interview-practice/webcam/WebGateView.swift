//
//  WebView.swift
//  interview-practice
//
//  Created by Hiroshi Shin on 2021/04/23.
//

import Foundation
import UIKit

class WebGateView: UIView {
    
    private let btnRedirect = UIButton()
    
    public var openWebAction: (()->())?
    
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
        btnRedirect.translatesAutoresizingMaskIntoConstraints = false
        btnRedirect.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btnRedirect.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setup() {
        backgroundColor = .systemBackground
        btnRedirect.backgroundColor = .gray
        btnRedirect.setTitle("Open the WebView", for: .normal)
        btnRedirect.setTitleColor(.white, for: .normal)
        btnRedirect.addTarget(self, action: #selector(openWeb), for: .touchUpInside)
        addSubview(btnRedirect)
    }
    
    @objc func openWeb() {
        if let _f = openWebAction {
            print("A website will be opened")
            _f()
        }
    }
    
}
