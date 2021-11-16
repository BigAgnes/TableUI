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
        static let insetIcon = screenWidth * 0.5
        static let iconBookImageSide = screenWidth * 0.6
        static let iconSide = screenWidth * 0.1
        
        static let horizontalMargin: CGFloat = 12
        static let marginTop: CGFloat = 12
        
        static let labelBlockInset = marginTop * 3 + iconBookImageSide + iconSide
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
        titleBookLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        titleBookLabel.frame.origin.y = CGFloat(Const.labelBlockInset)
        titleBookLabel.sizeToFit()
        
        fullNameAuthorLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        fullNameAuthorLabel.frame.origin.y = CGFloat(Const.labelBlockInset + titleBookLabel.frame.height)
        fullNameAuthorLabel.sizeToFit()
        
        dateAdmissionLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        dateAdmissionLabel.frame.origin.y = CGFloat(Const.labelBlockInset + fullNameAuthorLabel.frame.height * 2)
        dateAdmissionLabel.sizeToFit()
        
        dateExpirationLabel.frame.origin.x = CGFloat(Const.horizontalMargin)
        dateExpirationLabel.frame.origin.y = CGFloat(Const.labelBlockInset + dateAdmissionLabel.frame.height * 3)
        dateExpirationLabel.sizeToFit()
        
        priceAdmissionLabel.frame.origin.y = CGFloat(Const.labelPriceInset)
        priceAdmissionLabel.font = .systemFont(ofSize: 40)
        priceAdmissionLabel.sizeToFit()
        priceAdmissionLabel.frame.origin.x = CGFloat(Const.insetIcon - (priceAdmissionLabel.frame.width / 2))
        priceAdmissionLabel.textColor = .darkGray

        
        bookImage.image = UIImage(named: "bookImg.jpg")
        bookImage.frame.size = CGSize(width: Const.iconBookImageSide, height: Const.iconBookImageSide)
        bookImage.frame.origin.x = CGFloat(view.frame.midX - (bookImage.frame.size.width / 2))
        bookImage.frame.origin.y = CGFloat(Const.marginTop)
        
        
        typeImage.frame.size = CGSize(width: Const.iconSide, height: Const.iconSide)
        typeImage.frame.origin.x = CGFloat(Const.insetIcon - typeImage.frame.size.width - Const.horizontalMargin)
        typeImage.frame.origin.y = CGFloat(bookImage.frame.height + Const.marginTop * 2)
        
        ageLimitImage.frame.size = CGSize(width: Const.iconSide, height: Const.iconSide)
        ageLimitImage.frame.origin.x = CGFloat(Const.insetIcon + Const.horizontalMargin)
        ageLimitImage.frame.origin.y = CGFloat(bookImage.frame.height + Const.marginTop * 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
