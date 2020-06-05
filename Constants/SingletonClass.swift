//
//  SingletonClass.swift
//  covid19statisticsApp
//
//  Created by Duale on 6/3/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import Foundation
class UrlPathSingleTon {
    static let urlsingleton = UrlPathSingleTon()
    private init() {}
    let urlpath = "https://api.covid19api.com/summary"
    func shared() -> String {
      return urlpath
    }
}
