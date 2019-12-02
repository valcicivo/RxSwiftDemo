//
//  StoryboardLoadable.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instance() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instance() -> Self {
        let id = String(describing: self)
        return UIStoryboard(name: id, bundle: Bundle.main).instantiateInitialViewController() as! Self
    }
}
