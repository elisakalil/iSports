//
//  SportsView.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import UIKit

    class SportsView: UIView {
        
        // MARK: - Properties
                
        public lazy var searchBar: UISearchBar = {
            let search = UISearchBar()
            search.translatesAutoresizingMaskIntoConstraints = false
            return search
        }()
        
        private lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        private lazy var contentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        public lazy var tableView: UITableView = {
            let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            return tableView
        }()
        
        // MARK: - Initializer

        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupView()
        }
        
        // MARK: - Private Methods

        private func setupView() {
            addSubview(searchBar)
            addSubview(scrollView)
            scrollView.addSubview(contentView)
            contentView.addSubview(tableView)
            
            NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                scrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                
                tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                tableView.heightAnchor.constraint(greaterThanOrEqualToConstant: 800)
            ])
        }
    }
