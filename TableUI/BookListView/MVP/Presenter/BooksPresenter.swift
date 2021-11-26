//
//  BooksPresenter.swift
//  TableUI
//
//  Created by Кристина Максимова on 24.11.2021.
//

import UIKit

protocol BookListView: AnyObject {
    func showBooks(_ books: [Book]) 
}

class BooksPresenter: BookListPresenterProtocol {
    weak var view: BookListView?
    weak var interactor: IneractorProtocol?
    
    func fetchBooks() {
        let books = (interactor?.decodeBook())!
        view?.showBooks(books)
    }
}
