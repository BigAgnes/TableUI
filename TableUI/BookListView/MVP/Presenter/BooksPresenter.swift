//
//  BooksPresenter.swift
//  TableUI
//
//  Created by Кристина Максимова on 24.11.2021.
//

import UIKit

protocol BookListView {
    func showBooks(_ books: [Book]) 
}

class BooksPresenter: BookListPresenterProtocol {
//    private(set) var books: [Book] = []
    
    func fetchBooks() -> [Book] {
        BookDecoder().decode()
    }
}
