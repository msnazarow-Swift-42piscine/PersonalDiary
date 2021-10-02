//
//  CellModel.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import Foundation
import ArticleManager

struct Model {

}

struct CellModel: CellIdentifiable {

    var identifier: String { return "ArticleCell" }
    let title: String
    let content: String
    let language: String
    let image: Data?
    let creationDate: Date
    let modificationDate: Date
    let property: Article
    
    init(_ property: Article) {
        title = property.title ?? ""
        content = property.content ?? ""
        language = property.language ?? Locale.current.languageCode ?? ""
        image = property.image
        creationDate = property.creationDate!
        modificationDate = property.modificationDate!
        self.property = property
    }
}
