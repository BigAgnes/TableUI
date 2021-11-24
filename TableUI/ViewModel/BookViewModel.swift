//
//  BookViewModel.swift
//  TableUI
//
//  Created by Кристина Максимова on 23.11.2021.
//

import UIKit

class BookViewModel {
    
    private(set) var books: [Book] = []
    
    func decodeBook () -> [Book] {
        let books = BookDecoder().decode()
        return books
    }
}
