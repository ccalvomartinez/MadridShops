//
//  MainViewController.swift
//  MadridShops
//
//  Created by Administrador on 11/9/17.
//  Copyright © 2017 CCM. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

   
    
    @IBOutlet weak var goToShopsButton: UIButton!
    
    @IBOutlet weak var goToActivitiesButton: UIButton!
    
    @IBOutlet weak var   activityIndicatorView: UIActivityIndicatorView!
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var messageView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ExecuteOnceInteractorImpl().execute(executeOnce: {
            startWaitingSetup()
            initializeData()
        }, executeElse: {
            self.stopWaitingSetup()
            
        })
        
    }
    func startWaitingSetup() {
        self.goToShopsButton.isHidden = true
        self.goToActivitiesButton.isHidden = true
        self.messageView.isHidden = false
        self.activityIndicatorView.hidesWhenStopped = true
        self.activityIndicatorView.startAnimating()
    }
    
    func stopWaitingSetup() {
        self.goToShopsButton.isHidden = false
        self.goToActivitiesButton.isHidden = false
        self.messageView.isHidden = true
        self.activityIndicatorView.stopAnimating()
        self.activityIndicatorView.isHidden = true
        
    }
    
    func errorDownloadingSetup(error: Error) {
        self.messageView.text = NSLocalizedString("Error while downloading data. ", comment: "") + error.localizedDescription
        self.activityIndicatorView.stopAnimating()
    }
    
    func initializeData() {
        let downloadShopsInteractor = DownloadAlPlacesInteractorNSUrlSession(loadShops: true)
        downloadShopsInteractor.execute(onSuccess: { (places: Places) in
            let cacheInteractor = SaveAllPlacesInteractorImpl()
            cacheInteractor.execute(places: places, areShops: true, context: self.context, onSuccess: { (places: PlacesProocol) in
                
                let downloadActivitiesInteractor = DownloadAlPlacesInteractorNSUrlSession(loadShops: false)
                
                downloadActivitiesInteractor.execute(onSuccess: { (places: Places) in
                
                    let cacheInteractor = SaveAllPlacesInteractorImpl()
                    cacheInteractor.execute(places: places, areShops: false, context: self.context, onSuccess: { (places: PlacesProocol) in
                        SetExecutedOnceInteractorImpl().execute()
                        self.stopWaitingSetup()
                    }, onError:{ (error: Error) in
                        self.errorDownloadingSetup(error: error)
                    })
                }, onError:{ (error: Error) in
                    self.errorDownloadingSetup(error:error)
                })
            }, onError:{ (error: Error) in
                self.errorDownloadingSetup(error: error)
            })
        }, onError:{ (error: Error) in
            self.errorDownloadingSetup(error: error)
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowActivities" {
            let vc = segue.destination as! PlacesViewController
            vc.context = self.context
            vc.title = NSLocalizedString("Activities", comment: "")
            vc.places = PlacesCD(self.context, areShops: false)
        }
        if segue.identifier == "ShowShops" {
            let vc = segue.destination as! PlacesViewController
            vc.context = self.context
              vc.title = NSLocalizedString("Shops", comment: "")
            vc.places = PlacesCD(self.context, areShops: true)
        }
    }
}
