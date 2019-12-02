//
//  APICalling.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import Foundation
import RxSwift

class APICalling {
    // create a method for calling api which is return a Observable
    
    // Get the free API key here: https://newsapi.org/register
    private let APIKEY = ""
    
    func send<T:Codable>(with country: Country) -> Observable<T> {
        return Observable<T>.create({ observer in
            
            var components = URLComponents()
            components.scheme = "https"
            components.host = "newsapi.org"
            components.path = "/v2/top-headlines"
            components.queryItems = [URLQueryItem(name: "country", value: country.code.lowercased()),
                                     URLQueryItem(name: "apiKey", value: self.APIKEY)]
          
            guard let url = components.url else {
                return Disposables.create()
            }
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
        
                do {
                    let model: T = try JSONDecoder().decode(T.self, from: data ?? Data())
                    observer.onNext(model)
                } catch let error{
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        })
    }
}
