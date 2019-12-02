//
//  MainViewController.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController, Storyboarded {
    
    var viewModel: MainViewModel!
    let apiCalling = APICalling()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Countries", style: .plain, target: self, action: #selector(settingsTapped))
        title = "News"
        
        viewModel.articles.bind(to: tableView.rx.items(cellIdentifier: "ArticleTableViewCell")) { row, model, cell in
                    if let cell = cell as? ArticleTableViewCell{
                        cell.titleLabel.text = model.title
                        cell.descriptionLabel.text = model.description
                    }
            }
        .disposed(by: disposeBag)
        viewModel.getData(country: Country(code: "US", name: "USA"))
    }
    
    @objc private func settingsTapped() {
        viewModel.openSettings()
    }

}
