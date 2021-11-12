//
//  BookTableViewCell.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    func setup(book: Book) {
        self.textLabel?.text = book.title
    }
    
}
