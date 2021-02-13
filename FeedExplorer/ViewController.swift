//
//  ViewController.swift
//  FeedExplorer
//
//  Created by redpanda on 2021-02-13.
//

import UIKit

class ViewController: UIViewController {
    
    private var map: Map?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        sharedNetworkManager.fetchMap(completionHandler: { [weak self] (map) in
            self?.map = map
            print(map.feeds)
        })
    }
}

