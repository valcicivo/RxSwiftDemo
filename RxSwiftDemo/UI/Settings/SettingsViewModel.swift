//
//  SettingsViewModel.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SettingsViewModel {
    
    let countries = BehaviorRelay(value: [Country]())
    
    var onCountryChanged: PublishSubject<Country>!
    
    init() {
        let countryList = [Country(code: "US", name: "United States"), Country(code: "CA", name: "Canada"), Country(code: "FR", name: "France"),Country(code: "MX", name: "Mexico")]
        countries.accept(countryList)
    }
    
    func update(with country: Country){
        onCountryChanged.onNext(country)
    }
}
