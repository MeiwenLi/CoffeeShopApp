//
//  ViewController.swift
//  CoffeeShopApp
//
//  Created by Meiwen Li on 2019/7/25.
//  Copyright © 2019 Meiwen Li. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(pinTitle:String, pinSubtitle:String, location: CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubtitle
        self.coordinate = location
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var imagesNames = ["IMG71","IMG72","IMG73","IMG74","IMG75","IMG76"]
        
        var coffeeImages = [UIImage]()
        
        for i in 0..<imagesNames.count{
            coffeeImages.append(UIImage(named: imagesNames[i])!)
        }
        
        animate(imageView: imageView, images:coffeeImages)
        
        let initialLocation = CLLocation(latitude: 39.958570, longitude: 116.352210)
    
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
            
            let pin = customPin(pinTitle: "Elephant Coffee", pinSubtitle: "C-1088,XUEYUANPAI", location: initialLocation.coordinate)
            self.mapView.addAnnotation(pin)
        }
        
        centerMapOnLocation(location: initialLocation)
        
        
    }
    
    func animate(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 10.0
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
    }
    
}

