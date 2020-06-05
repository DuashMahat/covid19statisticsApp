//
//  DetailsViewController.swift
//  covid19statisticsApp
//
//  Created by Duale on 6/5/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var countryimage: UIImageView!
    @IBOutlet weak var newconfirmed: UILabel!
    @IBOutlet weak var totalconfirmed: UILabel!
    @IBOutlet weak var newdeath: UILabel!
    @IBOutlet weak var totaldeath: UILabel!
    @IBOutlet weak var totalrecoveres: UILabel!
    @IBOutlet weak var labsview: UIView!
    
    var newconf : Int = 0
    var totalconf : Int = 0
    var newdeaths: Int = 0
    var totaldeaths : Int = 0
    var totalrec : Int = 0
    var image : UIImage?
    var countryname : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.populate()
            self.beatutify()
            self.imageviewdeats()
            self.navigationItem.title = self.countryname
        }
    }
    
    func populate() {
        newconfirmed.text = "New Confirmed Cases: " +  String(newconf)
        totalconfirmed.text =  "Total Confirmed Cases:  " +  String(totalconf)
        newdeath.text = "New Deaths:  " + String(newdeaths)
        totaldeath.text = "Total Deaths:  " +  String(totaldeaths)
        totalrecoveres.text =  "Total Recovered:  " + String(totalrec)
    
    }
    
    func beatutify() {
        newconfirmed.beautifyIII()
        totalconfirmed.beautifyIII()
        newdeath.beautifyIII()
        totaldeath.beautifyIII()
        totalrecoveres.beautifyIII()
        labsview.backgroundColor = .systemBlue
        labsview.layer.borderWidth = 1
        labsview.layer.borderColor = UIColor.white.cgColor
    }
    func populatelabels(newc: Int , totalc: Int , newd: Int , totald: Int , totalr: Int ) {
        newconf = newc
        totalconf = totalc
        newdeaths = newd
        totaldeaths = totald
        totalrec = totalr
    }
    
    func imageviewdeats () {
        countryimage.image = image
        countryimage.contentMode = .scaleAspectFill
        countryimage.layer.borderWidth = 1
        countryimage.layer.borderColor = UIColor.white.cgColor
    }
}

/*
 
 
 
 
 */
