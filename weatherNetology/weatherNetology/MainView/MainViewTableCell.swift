//
//  MainViewTableCell.swift
//  weatherNetology
//
//  Created by Illya Blinov on 29.02.24.
//

import UIKit
final class MainViewTableCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func layout() {
        self.backgroundColor = UIColor(hex: "#E9EEFA")
    }

}
