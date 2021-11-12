//
//  Book.swift
//  TableUI
//
//  Created by Кристина Максимова on 11.11.2021.
//

import Foundation

struct Library: Codable {
    let items: [BookItem]
    
    enum CodingKeys: String, CodingKey {
        case items = "features"
    }
}

struct BookItem: Codable {
    let book: Book
    
    enum CodingKeys: String, CodingKey {
        case book = "properties"
    }
}

struct Book: Codable {
    var id: Int
    var title: String
    var typeDesc: String
    var author: String?
    var authorFullName: String?
    var ageLimitDesc: Int
    var admissionDate: String
    var admissionPrice: Double
    var numberOfProvided: Int
    var inventoryNumber: Double
    var expirationDate: String?
    var genre: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Название"
        case typeDesc = "Тип"
        case author = "Автор"
        case authorFullName = "Автор (ФИО)"
        case ageLimitDesc = "Возрастное ограничение на книгу"
        case admissionDate = "Дата поступления"
        case admissionPrice = "Цена поступления"
        case numberOfProvided = "Кол-во выдач"
        case inventoryNumber = "Инвентарный номер"
        case expirationDate = "Выдана до"
        case genre = "Жанр книги"
    }
}
