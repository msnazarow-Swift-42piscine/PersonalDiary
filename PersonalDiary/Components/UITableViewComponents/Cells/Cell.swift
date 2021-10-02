//
//  Cell.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit

class Cell: UITableViewCell, ModelRepresentable {
    weak var presenter: CellToPresenterDiaryProtocol!

    var model: Identifiable? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {}
}
