//
//  BookListViewController.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit


class BookListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var bookViewModel = BookViewModel()
    private let tableView = UITableView()
    
    override func loadView() {
        super.loadView()
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Library"
        self.view.backgroundColor = .white
        bookViewModel.fetchBooks()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "BookTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookViewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        cell.setup(book: book(by: indexPath))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let bookInfo = DetailsViewController()
        bookInfo.setup(book: self.bookViewModel.books[indexPath.row])
        present(bookInfo, animated: true)
    }
    
    private func book(by indexPath: IndexPath) -> Book {
        bookViewModel.books[indexPath.row]
    }
}
