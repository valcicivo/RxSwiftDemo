//
//  Article.swift
//  RxSwiftDemo
//
//  Created by Ivo Valcic on 30/11/2019.
//  Copyright © 2019 TELTECH.CO. All rights reserved.
//

import Foundation

struct ArticlesList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String?
    let description: String?
}
