//
//  HomeVC.swift
//  AKSwiftSlideMenu
//
//  Created by MAC-186 on 4/8/16.
//  Copyright © 2016 Kode. All rights reserved.
//

import UIKit
import CoreLocation
class HomeVC: BaseViewController,UICollectionViewDataSource,UICollectionViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    
    let job = ["Care Taker","Beutician","Carpenter","Civil Work","Driver","Electrician","Gardening","Tailor","Home Tutor","House Keeping","Workers","Laundry Service","Painter","Plumber","Pandit","Tiffin","Transport","Vehicle Repair","Water Supplier","Welder","Personal Trainer","Photographer"]
    let job_image = [#imageLiteral(resourceName: "caretaker"),#imageLiteral(resourceName: "beutician"),#imageLiteral(resourceName: "carpenter"),#imageLiteral(resourceName: "civil work"),#imageLiteral(resourceName: "driver"),#imageLiteral(resourceName: "electrician"),#imageLiteral(resourceName: "gardnening"),#imageLiteral(resourceName: "tailor"),#imageLiteral(resourceName: "home tutor"),#imageLiteral(resourceName: "housekeeper"),#imageLiteral(resourceName: "workers"),#imageLiteral(resourceName: "laundry"),#imageLiteral(resourceName: "painter"),#imageLiteral(resourceName: "plumber"),#imageLiteral(resourceName: "pandit"),#imageLiteral(resourceName: "tiffin"),#imageLiteral(resourceName: "transport"),#imageLiteral(resourceName: "Vehicle Repair"),#imageLiteral(resourceName: "water supplyer"),#imageLiteral(resourceName: "welder"),#imageLiteral(resourceName: "personal trainer"),#imageLiteral(resourceName: "photographer")]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return job.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! CollectionViewCell
        cell.job_lbl.text = job[indexPath.item]
        cell.job_img.image = job_image[indexPath.item]
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
   /* func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.black.cgColor
        cell?.layer.borderWidth = 3
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 1
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 05, right: 10)
        layout.itemSize = CGSize(width: self.collectionView.frame.size.width/4, height:
            self.collectionView.frame.size.height/5)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        collectionView!.collectionViewLayout = layout
        // locationManager.delegate = self as! CLLocationManagerDelegate
        
        // Do any additional setup after loading the view.
        //  locationManager.requestWhenInUseAuthorization()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var displayLocation: UIBarButtonItem!
    @IBAction func locationClick(_ sender: Any) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                
                print("placemarks",placemarks!)
                let pm = placemarks?[0]
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            
            print("your location is:-",containsPlacemark)
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            print(locality)
            displayLocation.title = locality
            print(postalCode)
            print(administrativeArea)
            print(country)
        }
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating location " + error.localizedDescription)
    }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


