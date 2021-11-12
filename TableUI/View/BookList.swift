//
//  BookList.swift
//  TableUI
//
//  Created by Кристина Максимова on 11.11.2021.
//

import UIKit

class BookList: UITableViewController {

    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        books = BookDecoder().decode()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookCell
        let book = books[indexPath.row]
        cell.setup(book: book)
        
        
        return cell
    }
    
}
