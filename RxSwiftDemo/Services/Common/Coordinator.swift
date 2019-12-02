//
//  Coordinator.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import UIKit
public protocol Coordinator: class {
    @discardableResult
    func start() -> UIViewController
}
