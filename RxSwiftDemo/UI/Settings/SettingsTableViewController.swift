//
//  SettingsTableViewController.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SettingsTableViewController: UIViewController, Storyboarded {
    var viewModel: SettingsViewModel!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.countries.bind(to: tableView.rx.items(cellIdentifier: "SettingsCell")) { row, model, cell in
            cell.textLabel?.text = model.name
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected
        .subscribe(onNext: { [weak self]indexPath in
            guard let self = self else {return}
            self.viewModel.update(with: self.viewModel.countries.value[indexPath.row])
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
    }

}
