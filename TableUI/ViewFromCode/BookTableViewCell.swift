//
//  BookTableViewCell.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    private let idLabel = UILabel()
    private let titleLabel = UILabel()
    private let authorLabel = UILabel()
    private let typeImage = UIImageView()
    private let ageLimitImage = UIImageView()
    
    private struct Const {
        static let marginLeft: CGFloat = 12
        static let marginTop: CGFloat = 10

        static var screenWidth: CGFloat {
            UIScreen.main.bounds.size.width
        }
        static var cellHeight: CGFloat = 90
        static let labelWidth = screenWidth * 0.72
        static let labelHeight = cellHeight / 3
        
        static let iconSide = cellHeight * 0.4
        static let insetXForIcon = screenWidth - labelWidth - iconSide - marginLeft * 2
        static let iconInsetX = marginLeft + labelWidth + insetXForIcon
        static let iconInsetY = (cellHeight - iconSide * 2) / 3
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(idLabel)
        self.addSubview(titleLabel)
        self.addSubview(authorLabel)
        self.addSubview(typeImage)
        self.addSubview(ageLimitImage)
    }
    
    func setup(book: Book) {
        self.idLabel.text = String(book.id)
        self.titleLabel.text = book.title
        self.authorLabel.text = book.author
        
        typeImage.image = UIImage(systemName: book.type.imageBookTypeName)
        ageLimitImage.image = UIImage(systemName: book.ageLimit.imageAgeLimit)
        
        layout()
    }
    
    private func layout() {
        idLabel.frame.origin.x = CGFloat(Const.marginLeft)
        idLabel.sizeToFit()
        idLabel.textColor = .gray
        idLabel.textAlignment = .left
        idLabel.font = .systemFont(ofSize: 10)
        
    
        titleLabel.frame.origin.x = CGFloat(Const.marginLeft)
        titleLabel.frame.origin.y = CGFloat(Const.labelHeight)
        titleLabel.sizeToFit()
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 14)

    
        authorLabel.frame.origin.x = CGFloat(Const.marginLeft)
        authorLabel.frame.origin.y = CGFloat(Const.labelHeight * 2)
        authorLabel.sizeToFit()
        authorLabel.textAlignment = .left
        authorLabel.font = .systemFont(ofSize: 14)
        
        typeImage.frame = CGRect(x: Const.iconInsetX, y: Const.iconInsetY, width: Const.iconSide, height: Const.iconSide)
    
        ageLimitImage.frame = CGRect(x: Const.iconInsetX, y: Const.iconInsetY * 2 + Const.iconSide , width: Const.iconSide, height: Const.iconSide)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BookType {
    var imageBookTypeName: String {
        switch self {
        case .electronic:
            return "book.closed.fill"
        case .audio:
            return "headphones.circle.fill"
        case .pdf:
            return "doc.circle"
        case .unknown:
            return "camera.metering.unknown"
        }
    }
}

extension AgeLimit {
    var imageAgeLimit: String {
        switch self {
        case .zero:
            return "0.circle.fill"
        case .six:
            return "6.circle.fill"
        case .twelve:
            return "12.circle.fill"
        case .sixteen:
            return "16.circle.fill"
        case .eighteen:
            return "18.circle.fill"
        case .unknown:
            return "camera.metering.unknown"
        }
    }
}

