//
//  SpinnerView.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import UIKit

class SpinnerView: UIView {
    
    // MARK: Views
    
    private let spinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        view.color = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
        setupStyling()
        spinner.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(spinner)
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints += [
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupStyling() {
        backgroundColor = UIColor(white: 0, alpha: 0.7)
    }
}
