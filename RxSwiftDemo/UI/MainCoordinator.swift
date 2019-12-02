//
//  MainCoordinator.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import UIKit
import RxSwift

class MainCoordinator: Coordinator {
    
    private var navigationController: UINavigationController?
    
    private let onCountryChanged = PublishSubject<Country>()
    private let disposeBag = DisposeBag()
    
    
    func start() -> UIViewController {
        return main()
    }
    
    func main() -> UIViewController {
        let vc = MainViewController.instance()
        let viewModel = MainViewModel()
        
        viewModel.goToSettings.bind { [unowned self] _ in
            self.navigationController?.pushViewController(self.settingsVc(), animated: true)
        }.disposed(by: disposeBag)
        
        onCountryChanged.subscribe(onNext: { country in
            viewModel.getData(country: country)
            }).disposed(by: disposeBag)
        
        vc.viewModel = viewModel
        navigationController = UINavigationController(rootViewController: vc)
        navigationController?.showAsRoot()
        return navigationController!
    }
    
    func settingsVc() -> UIViewController {
        let vc = SettingsTableViewController.instance()
        let viewModel = SettingsViewModel()
        viewModel.onCountryChanged = onCountryChanged
        vc.viewModel = viewModel
        return vc
    }
    
    
}
