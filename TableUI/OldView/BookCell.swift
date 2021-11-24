//
//  BookCell.swift
//  TableUI
//
//  Created by Кристина Максимова on 11.11.2021.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet private var id: UILabel!
    @IBOutlet private var title: UILabel!
    @IBOutlet private var author: UILabel!
    
    @IBOutlet private var type: UIImageView!
    @IBOutlet private var ageLimit: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
        
    func setup(book: Book) {
        id.text = String(book.id)
        title.text = book.title
        author.text = book.author
    }

}
