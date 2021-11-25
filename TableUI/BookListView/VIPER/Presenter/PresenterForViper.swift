//
//  PresenterForViper.swift
//  TableUI
//
//  Created by Кристина Максимова on 25.11.2021.
//

import UIKit

protocol PresenterProtocol {
    var router: RouterProtocol? {get set}
    func configureView()
}

class PresenterForViper: PresenterProtocol {
    var router: RouterProtocol?
    
    func configureView() {
        
    }
    
    
}
