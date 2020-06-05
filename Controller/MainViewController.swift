//
//  ViewController.swift
//  covid19statisticsApp
//
//  Created by Duale on 6/3/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
        @IBOutlet weak var tableview : UITableView!
        var countrizs = [Country]()
        var newtorkhanler = Networking()
        override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        navigationItem.title = "Countries"
        response()
    }
            
            func response () {
                newtorkhanler.response(url: UrlPathSingleTon.urlsingleton.shared()) { (countried : (Countries)) in
                    self.countrizs = countried.Countries
                    DispatchQueue.main.async {
                        self.tableview.reloadData()
                    }
                }
            }

}

extension MainViewController : UITableViewDataSource  {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return countrizs.count
            }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesViewCell" , for: indexPath) as! CountriesViewCell
                cell.countryname.text = countrizs[indexPath.row].Country
                cell.countryimage.image = UIImage(named: countrizs[indexPath.row].CountryCode.lowercased())
                cell.countryimage.beautifty()
                cell.countryname.beautifyII()
                cell.backgroundColor = (indexPath.row % 2 == 0 ) ? .systemRed : .systemGreen
                
                return cell
            }
}

extension MainViewController : UITableViewDelegate {
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                tableView.deselectRow(at: indexPath, animated: true)
                let storyBd = UIStoryboard.init(name: "Main", bundle: nil)
                guard let detailVc = storyBd.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else {return}
                var image = UIImage(named: countrizs[indexPath.row].CountryCode.lowercased())
                detailVc.populatelabels(newc: countrizs[indexPath.row].NewConfirmed, totalc: countrizs[indexPath.row].TotalConfirmed, newd:countrizs[indexPath.row].NewDeaths, totald: countrizs[indexPath.row].TotalDeaths, totalr: countrizs[indexPath.row].TotalRecovered)
                detailVc.newconf = countrizs[indexPath.row].NewConfirmed
                detailVc.newdeaths = countrizs[indexPath.row].NewDeaths
                detailVc.totalconf = countrizs[indexPath.row].TotalConfirmed
                detailVc.totaldeaths = countrizs[indexPath.row].TotalDeaths
                detailVc.totalrec = countrizs[indexPath.row].TotalRecovered
                detailVc.navigationController?.navigationItem.title = countrizs[indexPath.row].Country
                detailVc.image = image
                detailVc.countryname =  countrizs[indexPath.row].Country
                navigationController?.pushViewController(detailVc, animated: true)
                
            }
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                var height : CGFloat = CGFloat()
                height = 100
                return height
            }
}



