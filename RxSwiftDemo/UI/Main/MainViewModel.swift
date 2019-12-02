//
//  MainViewModel.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {
    var apiCalling = APICalling()
    var articles = PublishSubject<[Article]>()
    var goToSettings = PublishSubject<Void>()
    private let disposeBag = DisposeBag()
    
    
    init() {

    }
    func getData(country: Country){
        let articleList: Observable<ArticlesList> = apiCalling.send(with: country)
        articleList.subscribe(onNext: { [weak self] (articleList) in
            self?.articles.onNext(articleList.articles)
        }).disposed(by: disposeBag)
    }
  
    func openSettings() {
        goToSettings.onNext(())
    }
}
