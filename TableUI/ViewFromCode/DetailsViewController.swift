//
//  DetailsViewController.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit

class DetaulsViewController: UIViewController {
    
    private let dateExpirationLabel = UILabel()
    private let dateAdmissionLabel = UILabel()
    private let priceAdmissionLabel = UILabel()
    private let fullNameAuthorLabel = UILabel()
    private let titleBookLabel = UILabel()
    
    private let typeImage = UIImageView()
    private let bookImage = UIImageView()
    private let ageLimitImage = UIImageView()
    
    struct Const {
        static var screenWidth: CGFloat {
            UIScreen.main.bounds.size.width
        }
        static var screenHeigth: CGFloat {
            UIScreen.main.bounds.size.height
        }
        static let labelWidth: CGFloat = screenWidth * 0.8
        static let labelHeight: CGFloat = 40
        
        static let insetIcon = screenWidth * 0.5
        static let iconBookImageSide = screenWidth * 0.6
        static let iconSide = screenWidth * 0.1
        
        static let marginLeft: CGFloat = 12
        static let marginTop: CGFloat = 12
        
        static let labelBlockInset = marginLeft * 3 + iconBookImageSide + iconSide
        static let labelPriceInset = screenHeigth * 0.8
    }
    
        
    init() {
        super.init(nibName: nil, bundle: nil)
        view.addSubview(titleBookLabel)
        view.addSubview(fullNameAuthorLabel)
        view.addSubview(dateAdmissionLabel)
        view.addSubview(dateExpirationLabel)
        view.addSubview(priceAdmissionLabel)
        view.addSubview(bookImage)
        view.addSubview(typeImage)
        view.addSubview(ageLimitImage)
        }
    
    func setup(book: Book) {
        
        view.backgroundColor = .white

        titleBookLabel.text = "Название: \(book.title)"
        fullNameAuthorLabel.text = "Автор: \(book.authorFullName ?? "")"
        dateAdmissionLabel.text = "Дата поступления: \(book.admissionDate)"
        dateExpirationLabel.text = "Выдана до: \(book.expirationDate ?? "")"
        priceAdmissionLabel.text = "\(book.admissionPrice)"
        
        typeImage.image = UIImage(systemName: book.type.imageBookTypeName)
        ageLimitImage.image = UIImage(systemName: book.ageLimit.imageAgeLimit)
        
        layout()
    }
    
    private func layout() {
        titleBookLabel.frame = CGRect(x: Const.marginLeft, y: Const.labelBlockInset, width: Const.labelWidth, height: Const.labelHeight)
        
        fullNameAuthorLabel.frame = CGRect(x: Const.marginLeft, y: Const.labelBlockInset + Const.labelHeight, width: Const.labelWidth, height: Const.labelHeight)
        
        dateAdmissionLabel.frame = CGRect(x: Const.marginLeft, y: Const.labelBlockInset + Const.labelHeight * 2, width: Const.labelWidth, height: Const.labelHeight)
        
        dateExpirationLabel.frame = CGRect(x: Const.marginLeft, y: Const.labelBlockInset + Const.labelHeight * 3, width: Const.labelWidth, height: Const.labelHeight)
        
        priceAdmissionLabel.frame = CGRect(x: Const.insetIcon - Const.labelWidth / 2, y: Const.labelPriceInset, width: Const.labelWidth, height: Const.labelHeight)
        priceAdmissionLabel.font = .systemFont(ofSize: 40)
        priceAdmissionLabel.textAlignment = .center
        priceAdmissionLabel.textColor = .darkGray
        
        bookImage.image = UIImage(named: "bookImg.jpg")
        bookImage.frame.size = CGSize(width: Const.iconBookImageSide, height: Const.iconBookImageSide)
        bookImage.frame.origin.x = CGFloat(view.frame.midX - (bookImage.frame.size.width / 2))
        bookImage.frame.origin.y = CGFloat(Const.marginTop)
        
        
        typeImage.frame.size = CGSize(width: Const.iconSide, height: Const.iconSide)
        typeImage.frame.origin.x = CGFloat(Const.insetIcon - typeImage.frame.size.width - Const.marginLeft)
        typeImage.frame.origin.y = CGFloat(bookImage.frame.height + Const.marginTop * 2)
        
        ageLimitImage.frame.size = CGSize(width: Const.iconSide, height: Const.iconSide)
        ageLimitImage.frame.origin.x = CGFloat(Const.insetIcon + Const.marginLeft)
        ageLimitImage.frame.origin.y = CGFloat(bookImage.frame.height + Const.marginTop * 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
