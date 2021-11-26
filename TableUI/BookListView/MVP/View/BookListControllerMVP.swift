//
//  BookListViewController.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit

protocol BookListPresenterProtocol {
    func fetchBooks()
}

class BookListControllerMVP: UIViewController, UITableViewDataSource, UITableViewDelegate, BookListView {
    
    private var bookPresenter = BooksPresenter()
    private let ineractor = BookInteractor()
    private let tableView = UITableView()
    private var books: [Book] = []
    
    override func loadView() {
        super.loadView()
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Library"
        self.view.backgroundColor = .white
        self.bookPresenter.interactor = ineractor
        self.bookPresenter.view = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.bookPresenter.fetchBooks()
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "BookTableViewCell")
    }
    
    func showBooks(_ books: [Book]) {
        self.books = books
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        cell.setup(book: book(by: indexPath))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let bookInfo = DetailsViewController()
        bookInfo.setup(book: self.books[indexPath.row])
        present(bookInfo, animated: true)
    }
    
    private func book(by indexPath: IndexPath) -> Book {
        books[indexPath.row]
    }
}

