//
//  BookListViewController.swift
//  TableUI
//
//  Created by Кристина Максимова on 12.11.2021.
//

import UIKit
import Combine

class BookListViewControllerMVVN: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var bookViewModel = BookViewModel()
    private var cancellables: Set<AnyCancellable> = []
    private let tableView = UITableView()
    
    override func loadView() {
        super.loadView()
        self.view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        binding()
        self.title = "Library"
        self.view.backgroundColor = .white
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.bookViewModel.fetchBooks()
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "BookTableViewCell")
    }
    
    func binding() {
        bookViewModel.$books.sink { books in
            print(books.count)
            print(self.bookViewModel.books.count)
            self.tableView.reloadData()
        }.store(in: &cancellables)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bookViewModel.books.count
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
