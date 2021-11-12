//
//  BookDecoder.swift
//  TableUI
//
//  Created by Кристина Максимова on 11.11.2021.
//

import Foundation

class BookDecoder {
    
    let resource = "file"
    let ext = "json"
    
    func decode () -> [Book] {
        guard let url = Bundle.main.url(forResource: resource, withExtension: ext) else { return [] }
        var library: Library?
        do {
            let data = try Data(contentsOf: url)
            library = try JSONDecoder().decode(Library.self, from: data)
        } catch {
            print(error)
            return []
        }
        
        return library!.items.map { $0.book }
    }
}
