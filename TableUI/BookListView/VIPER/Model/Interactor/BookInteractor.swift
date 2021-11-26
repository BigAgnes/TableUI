//
//  BookInteractor.swift
//  TableUI
//
//  Created by Кристина Максимова on 26.11.2021.
//

import UIKit

protocol IneractorProtocol: AnyObject {
    func decodeBook() -> [Book]
}

class BookInteractor: IneractorProtocol {
    var books: [Book] = []
    
    func decodeBook() -> [Book] {
        books = BookDecoder().decode()
        return books
    }
    
    
}
