//
//  DetailsViewController.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit

class DetaulsViewController: UIViewController {
    
    private var books: [Book] = []
    
    let dateExpiration = UILabel()
    let dateAdmission = UILabel()
    let priceAdmission = UILabel()
    let fullNameAuthor = UILabel()
    let titleBook = UILabel()
    
    let type = UIImageView()
    let bookImage = UIImageView()
    let ageLimit = UIImageView()
    
    let index: Int
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    var screenHeigth: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    init(_ index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        books = BookDecoder().decode()
        setup(book: books[index])
    }
    
    func setup(book: Book) {

        let labelWidth = screenWidth * 0.8
        let labelHeight: CGFloat = 40
        
        let insetIcon = screenWidth * 0.5
        let iconBookImageSide = screenWidth * 0.6
        let iconSide = screenWidth * 0.1
        
        let inset = screenWidth * 0.04
        let labelBlockInset = inset * 3 + iconBookImageSide + iconSide
        let labelPriceInset = screenHeigth * 0.8
        
        view.backgroundColor = .white

        titleBook.frame = CGRect(x: inset, y: labelBlockInset, width: labelWidth, height: labelHeight)
        titleBook.text = "Название: \(book.title)"
        view.addSubview(titleBook)
        
        fullNameAuthor.frame = CGRect(x: inset, y: labelBlockInset + labelHeight, width: labelWidth, height: labelHeight)
        fullNameAuthor.text = "Автор: \(book.authorFullName ?? "")"
        view.addSubview(fullNameAuthor)
        
        dateAdmission.frame = CGRect(x: inset, y: labelBlockInset + labelHeight * 2, width: labelWidth, height: labelHeight)
        dateAdmission.text = "Дата поступления: \(book.admissionDate)"
        view.addSubview(dateAdmission)
        
        dateExpiration.frame = CGRect(x: inset, y: labelBlockInset + labelHeight * 3, width: labelWidth, height: labelHeight)
        dateExpiration.text = "Выдана до: \(book.expirationDate ?? "")"
        view.addSubview(dateExpiration)
        
        priceAdmission.frame = CGRect(x: insetIcon - labelWidth / 2, y: labelPriceInset, width: labelWidth, height: labelHeight)
        priceAdmission.text = "\(book.admissionPrice)"
        priceAdmission.font = .systemFont(ofSize: 40)
        priceAdmission.textAlignment = .center
        priceAdmission.textColor = .darkGray
        view.addSubview(priceAdmission)
        
        bookImage.image = UIImage(named: "bookImg.jpg")
        bookImage.frame.size = CGSize(width: iconBookImageSide, height: iconBookImageSide)
        bookImage.frame.origin.x = CGFloat(view.frame.midX - (bookImage.frame.size.width / 2))
        bookImage.frame.origin.y = CGFloat(inset)
        view.addSubview(bookImage)
        
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
        type.frame.size = CGSize(width: iconSide, height: iconSide)
        type.frame.origin.x = CGFloat(insetIcon - type.frame.size.width - inset)
        type.frame.origin.y = CGFloat(bookImage.frame.height + inset * 2)
        view.addSubview(type)

        
        ageLimit.image = UIImage(systemName: ageLimitIcon)
        ageLimit.frame.size = CGSize(width: iconSide, height: iconSide)
        ageLimit.frame.origin.x = CGFloat(insetIcon + inset)
        ageLimit.frame.origin.y = CGFloat(bookImage.frame.height + inset * 2)
        view.addSubview(ageLimit)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
