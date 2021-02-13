//
//  ViewController.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: Views
    
    private let mapView: MKMapView = {
        let view = MKMapView()
        view.mapType = MKMapType.standard
        view.isZoomEnabled = true
        view.isScrollEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loadingView: SpinnerView = {
        let view = SpinnerView()
        view.isHidden = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Properties
    
    private var map: Map?
    private let montrealLocation = CLLocation(latitude: 45.5211167, longitude: -73.6173925)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupConstraints()
        sharedNetworkManager.fetchMap(completionHandler: { [weak self] (map) in
            self?.map = map
            for feed in map.feeds {
                self?.mapView.addAnnotation(feed)
            }
            self?.loadingView.isHidden = true
        })
        mapView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let coordinateRegion = MKCoordinateRegion(
            center: montrealLocation.coordinate,
            latitudinalMeters: 50000,
            longitudinalMeters: 50000)
        mapView.setRegion(coordinateRegion, animated: true)
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

extension MapViewController: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        guard let annotation = annotation as? Feed else {
            return nil
        }
        let identifier = "feed"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            view.canShowCallout = true
            view.image = UIImage(named: "pin")
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.markerTintColor = annotation.pinColor
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}

