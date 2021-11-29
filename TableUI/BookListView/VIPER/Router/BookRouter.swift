//
//  RouterForViper.swift
//  TableUI
//
//  Created by Кристина Максимова on 25.11.2021.
//

import UIKit

protocol RouterProtocol: AnyObject {
    func showDetailsBook(_ book: Book, _ vc: UIViewController)
    func getFirstViewController() -> UIViewController
}

class BookRouter: RouterProtocol {
    
    func getFirstViewController() -> UIViewController {
        
        let vc = BookListControllerMVP()
        let navigationController = UINavigationController()
        navigationController.pushViewController(vc, animated: true)
        
        let bookPresenter = BooksPresenter()
        
        bookPresenter.interactor = BookInteractor()
        bookPresenter.view = vc
        vc.presenter = bookPresenter
        bookPresenter.router = self
        return vc
    }
    
    func showDetailsBook(_ book: Book, _ vc: UIViewController) {
        let bookInfo = DetailsViewController()
        bookInfo.setup(book: book)
        vc.present(bookInfo, animated: true)
    }
}
