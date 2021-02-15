//
//  ViewController.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    private static var montrealLocation = CLLocation(latitude: 45.5211167, longitude: -73.6173925)
    
    // MARK: Views
    
    private let mapView: MKMapView = {
        let view = MKMapView()
        let coordinateRegion = MKCoordinateRegion(
            center: montrealLocation.coordinate,
            latitudinalMeters: 50000,
            longitudinalMeters: 50000)
        view.setRegion(coordinateRegion, animated: true)
        view.mapType = MKMapType.standard
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loadingView: SpinnerView = {
        let view = SpinnerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Properties
    
    private var map: Map?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLoading()
        setupViewHierarchy()
        setupConstraints()
        sharedNetworkManager.fetchMap(completionHandler: { [weak self] (map) in
            self?.map = map
            DispatchQueue.main.async {
                self?.addAnnotation()
                self?.endLoading()
            }
        })
        mapView.register(MarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
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
            loadingView.topAnchor.constraint(equalTo: mapView.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func addAnnotation() {
        guard let map = self.map else {
            return
        }
        for feed in map.feeds {
            mapView.addAnnotation(feed)
        }
    }
    
    private func startLoading() {
        loadingView.isHidden = false
        mapView.isScrollEnabled = false
        mapView.isZoomEnabled = false
        mapView.isUserInteractionEnabled = false
    }
    
    private func endLoading() {
        loadingView.isHidden = true
        mapView.isScrollEnabled = true
        mapView.isZoomEnabled = true
        mapView.isUserInteractionEnabled = true
    }
}
