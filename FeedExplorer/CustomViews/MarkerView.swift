//
//  AnnotationView.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import MapKit

class MarkerView: MKAnnotationView {
    
    // MARK: Views
    
    private let pinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pin")?.withRenderingMode(.alwaysTemplate)
        return imageView
    }()
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let feed = newValue as? Feed else {
                return
            }
            pinImageView.tintColor = feed.pinColor
        }
    }
    
    // MARK: Inits
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupConstraints()
        setupStyling()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewHierarchy() {
        addSubview(pinImageView)
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints += [
            pinImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            pinImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupStyling() {
        canShowCallout = true
        rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
}
