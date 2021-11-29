//
//  RouterForViper.swift
//  TableUI
//
//  Created by Кристина Максимова on 25.11.2021.
//

import UIKit

protocol RouterProtocol {
    func showDetailsBook(_ book: Book, _ vc: UIViewController)
}

class BookRouter: RouterProtocol {
    
    func showDetailsBook(_ book: Book, _ vc: UIViewController) {
        let bookInfo = DetailsViewController()
        bookInfo.setup(book: book)
        vc.present(bookInfo, animated: true)
    }
}
