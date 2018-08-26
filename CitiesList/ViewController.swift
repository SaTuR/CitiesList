//
//  ViewController.swift
//  CitiesList
//
//  Created by Ihonahan Buitrago on 1/27/16.
//  Copyright © 2016 NextUniversity. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var fullContainer: UIView!
    @IBOutlet weak var citiesTable: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    var cities = [[String:AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.cities.append(["name": "Bogotá" as AnyObject, "latitude": 4.624335 as AnyObject, "longitude": -74.063644 as AnyObject])
        self.cities.append(["name": "Medellín" as AnyObject, "latitude": 6.253041 as AnyObject, "longitude": -75.564574 as AnyObject])
        self.cities.append(["name": "Miami" as AnyObject, "latitude": 25.761680 as AnyObject, "longitude": -80.191790 as AnyObject])
        self.cities.append(["name": "Caracas" as AnyObject, "latitude": 10.480594 as AnyObject, "longitude": -66.903606 as AnyObject])
        self.cities.append(["name": "Buenos Aires" as AnyObject, "latitude": -34.603684 as AnyObject, "longitude": -58.381559 as AnyObject])
        
        self.citiesTable.reloadData()
        
        let city = self.cities[0]
        self.changeRegionWithCity(city)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func changeRegionWithCity(_ city : [String : AnyObject]) {
        let span = MKCoordinateSpanMake((20000.0 / 111000.0), (20000.0 / 111000.0))
        let point = CLLocationCoordinate2DMake(city["latitude"] as! CLLocationDegrees, city["longitude"] as! CLLocationDegrees)
        self.mapView.region = MKCoordinateRegionMake(point, span)
    }


    //MARK:- UITableView delegate and datasource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let city = cities[indexPath.row]
        
        cell.textLabel?.text = city["name"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = cities[indexPath.row]
        
        self.changeRegionWithCity(city)
    }
    
}

