//
//  RouterForViper.swift
//  TableUI
//
//  Created by Кристина Максимова on 25.11.2021.
//

import UIKit

protocol RouterProtocol {
    func presentDetails()
}

class BookRouter: RouterProtocol {
    weak var view: BookListView?
    
    func presentDetails() {
        
    }
    
}
