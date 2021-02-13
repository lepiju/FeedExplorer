//
//  ViewController.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    // MARK: Views
    
    private let mapView: MKMapView = {
        let view = MKMapView()
        view.mapType = MKMapType.standard
        view.isZoomEnabled = true
        view.isScrollEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loadingView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Properties
    
    private var map: Map?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViewHierarchy()
        setupConstraints()
        
        
        sharedNetworkManager.fetchMap(completionHandler: { [weak self] (map) in
            self?.map = map
            print(map.feeds)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupViewHierarchy() {
        view.addSubview(mapView)
        view.addSubview(loadingView)
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        constraints += [
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        
        constraints += [
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

