//
//  SectionModel.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import Foundation
import ArticleManager

final class SectionModel: SectionRowsRepresentable {
    var rows: [CellIdentifiable] = []

    init(_ properties: [Article]) {
        properties.forEach { property in
            rows.append(CellModel(property))
        }
    }
}
