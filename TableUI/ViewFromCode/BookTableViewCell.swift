//
//  BookTableViewCell.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    var id = UILabel()
    var title = UILabel()
    var author = UILabel()
    var type = UIImageView()
    var ageLimit = UIImageView()
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    
    func setup(book: Book) {
        
        let cellHeight = self.frame.size.height
        let inset = screenWidth * 0.03
        let labelWidth = screenWidth * 0.72
        let iconSide = cellHeight * 0.4
        let space = screenWidth - labelWidth - iconSide - inset * 2
        let iconX = inset + labelWidth + space
        let labelHeight = cellHeight / 3
        let iconInset = (cellHeight - iconSide * 2) / 3
        let secondIconY = iconInset * 2 + iconSide
        
        id.frame = CGRect(x: inset, y: 0, width: labelWidth, height: labelHeight)
        id.textColor = .gray
        id.textAlignment = .left
        id.font = .systemFont(ofSize: 10)
        self.addSubview(id)
        
        title.frame = CGRect(x: inset, y: labelHeight, width: labelWidth, height: labelHeight)
        title.textAlignment = .left
        title.font = .systemFont(ofSize: 14)
        self.addSubview(title)
        
        author.frame = CGRect(x: inset, y: labelHeight * 2, width: labelWidth, height: labelHeight)
        author.textAlignment = .left
        author.font = .systemFont(ofSize: 14)
        self.addSubview(author)
        
        var typeIcon = ""
        var ageLimitIcon = ""
        
        switch book.type {
        case .electronic:
            typeIcon = "book.closed.fill"
        case .audio:
            typeIcon = "headphones.circle.fill"
        case .pdf:
            typeIcon = "doc.circle"
        case .unknown:
            typeIcon = "camera.metering.unknown"
        }
        
        switch book.ageLimit {
        case .zero:
            ageLimitIcon = "0.circle.fill"
        case .six:
            ageLimitIcon = "6.circle.fill"
        case .twelve:
            ageLimitIcon = "12.circle.fill"
        case .sixteen:
            ageLimitIcon = "16.circle.fill"
        case .eighteen:
            ageLimitIcon = "18.circle.fill"
        case .unknown:
            ageLimitIcon = "camera.metering.unknown"
        }
        
        type.image = UIImage(systemName: typeIcon)
        type.frame = CGRect(x: iconX, y: iconInset, width: iconSide, height: iconSide)
        self.addSubview(type)
        
        ageLimit.image = UIImage(systemName: ageLimitIcon)
        ageLimit.frame = CGRect(x: iconX, y: secondIconY , width: iconSide, height: iconSide)
        self.addSubview(ageLimit)
        
        self.id.text = String(book.id)
        self.title.text = book.title
        self.author.text = book.author
    }
}
