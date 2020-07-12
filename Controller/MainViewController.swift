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
        let searchcontroller = UISearchController(searchResultsController: nil)
        var viewModel = NetViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        response()
        forViewDidLoad()
    }
            
    func response () {
        viewModel.viewModelResponse(url: UrlPathSingleTon.urlsingleton.shared()) { [weak self ](_) in
            DispatchQueue.main.async {
                self?.tableview.reloadData()
            }
        }
    }

}

extension MainViewController : UITableViewDataSource  {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                let countries : [Country] = (isfiltered == true ) ? viewModel.filtercountries : viewModel.countriesdecoded
                return countries.count
            }
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesViewCell" , for: indexPath) as! CountriesViewCell
                let countries = (isfiltered == true ) ? viewModel.filtercountries : viewModel.countriesdecoded
                print(indexPath.row)
                cell.countryname.text = countries[indexPath.row].Country
                cell.countryimage.image = UIImage(named: countries[indexPath.row].CountryCode.lowercased())
                cell.countryimage.beautifty()
                cell.countryname.beautifyII()
                cell.backgroundColor = (indexPath.row % 2 == 0 ) ? .systemRed : .systemGreen
                return cell
            }
}

extension MainViewController : UITableViewDelegate {
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                tableView.deselectRow(at: indexPath, animated: true)
                print("The path selected =============  \(indexPath.row)")
                let storyBd = UIStoryboard.init(name: "Main", bundle: nil)
                guard let detailVc = storyBd.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else {return}
                let countries = (isfiltered == true ) ? viewModel.filtercountries : viewModel.countriesdecoded
                let image = UIImage(named: countries[indexPath.row].CountryCode.lowercased())
                detailVc.populatelabels(newc: countries[indexPath.row].NewConfirmed, totalc: countries[indexPath.row].TotalConfirmed, newd:countries[indexPath.row].NewDeaths, totald: countries[indexPath.row].TotalDeaths, totalr: countries[indexPath.row].TotalRecovered)
                detailVc.newconf = countries[indexPath.row].NewConfirmed
                detailVc.newdeaths = countries[indexPath.row].NewDeaths
                detailVc.totalconf = countries[indexPath.row].TotalConfirmed
                detailVc.totaldeaths = countries[indexPath.row].TotalDeaths
                detailVc.totalrec = countries[indexPath.row].TotalRecovered
                detailVc.navigationController?.navigationItem.title = countries[indexPath.row].Country
                detailVc.image = image
                detailVc.countryname =  countries[indexPath.row].Country
                navigationController?.pushViewController(detailVc, animated: true)
                
            }
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                var height : CGFloat = CGFloat()
                height = 100
                return height
            }
}

extension MainViewController {
    func filteredCountries (for searchtext: String ) {
        viewModel.filtercountries = viewModel.countriesdecoded.filter { country in
            return country.Country.lowercased().contains(searchtext.lowercased())
        }
        tableview.reloadData()
    }
}

extension MainViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filteredCountries(for: searchBar.text!)
    }
}

extension MainViewController {
       var isfiltered : Bool {
           return searchcontroller.isActive  && !isfilteredEmpty
       }
       var isfilteredEmpty : Bool {
           return searchcontroller.searchBar.text?.isEmpty ?? true
       }
}

extension MainViewController {
    func forViewDidLoad() {
        tableview.delegate = self
        tableview.dataSource = self
        navigationItem.title = "Countries"
        searchcontroller.searchResultsUpdater = self
        navigationItem.searchController = searchcontroller
        searchcontroller.searchBar.placeholder = "Enter Country"
//        searchcontroller.searchBar.layer.borderWidth = 1
//        searchcontroller.searchBar.layer.borderColor = UIColor.systemBlue.cgColor
        searchcontroller.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
    }
}




