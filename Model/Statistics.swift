//
//  Statistics.swift
//  covid19statisticsApp
//
//  Created by Duale on 6/3/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation

struct Countries : Codable {
    var Countries : [Country]
}

struct Country : Codable {
    var Country : String
    var NewConfirmed : Int
    var TotalConfirmed : Int
    var NewDeaths : Int
    var TotalDeaths : Int
    var NewRecovered : Int
    var TotalRecovered : Int
    var CountryCode : String
}



