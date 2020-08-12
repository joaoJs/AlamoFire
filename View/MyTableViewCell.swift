//
//  TableViewCell.swift
//  Practice2
//
//  Created by Joao Campos on 8/4/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let reuseId: String = "MyCell"
    
    var pokemonName: UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .blue
        
        self.contentView.addSubview(name)
        
        name.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        name.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        name.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        name.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
        self.pokemonName = name
    }
}
