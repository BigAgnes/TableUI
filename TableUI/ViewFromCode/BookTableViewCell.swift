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
    
    let horizontalMargin: CGFloat = 12
    let marginTop: CGFloat = 10
    let iconSide: CGFloat = 27
    var cellHeight: CGFloat = 0

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
    }
    
    private func layout() {
        let iconsStack = iconSide * 2 + 12
        cellHeight = self.contentView.bounds.height
        
        idLabel.sizeToFit()
        titleLabel.sizeToFit()
        authorLabel.sizeToFit()
        
        idLabel.frame.origin.x = CGFloat(horizontalMargin)
        idLabel.frame.origin.y = CGFloat(marginTop)
        idLabel.textColor = .gray
        idLabel.textAlignment = .left
        idLabel.font = .systemFont(ofSize: 10)
        
    
        titleLabel.frame.origin.x = CGFloat(horizontalMargin)
        titleLabel.frame.origin.y = CGFloat(idLabel.frame.maxY + marginTop)
        titleLabel.textAlignment = .left
        titleLabel.font = .systemFont(ofSize: 14)

    
        authorLabel.frame.origin.x = CGFloat(horizontalMargin)
        authorLabel.frame.origin.y = CGFloat(titleLabel.frame.origin.y + titleLabel.frame.height + marginTop)
        authorLabel.textAlignment = .left
        authorLabel.font = .systemFont(ofSize: 14)
        
        typeImage.frame = CGRect(x: self.frame.width - horizontalMargin - iconSide, y: cellHeight/2 - iconsStack/2, width: iconSide, height: iconSide)
    
        ageLimitImage.frame = CGRect(x: self.frame.width - horizontalMargin - iconSide, y: cellHeight/2 + marginTop/2, width: iconSide, height: iconSide)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        layout()
        cellHeight = authorLabel.frame.maxY + marginTop
        return CGSize(width: size.width, height: cellHeight)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
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

