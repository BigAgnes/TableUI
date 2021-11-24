//
//  BookViewModel.swift
//  TableUI
//
//  Created by Кристина Максимова on 23.11.2021.
//

import UIKit
import Combine

class BookViewModel: ObservableObject {
    
    @Published var books: [Book] = []
    private var cancellableSet: Set<AnyCancellable> = []
    
    func fetchBooks() {
        books = BookDecoder().decode()
    }
}
