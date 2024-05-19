//
//  SportsViewController.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import UIKit

class SportsViewController: UIViewController {
    
    // MARK: - Properties
    
    var isSectionExpanded: [Bool] = []
    var favoritedEvents:[EventModel] = []
    var hiddenSections = Set<Int>()
    
    // MARK: - Initializer
    private var contentView: SportsView?
    private var viewModel: SportsViewModelProtocol
    
    init(viewModel: SportsViewModel, contentView: SportsView?) {
        self.viewModel = viewModel
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupScrollView()
        setupTableView()
        setupSearchBar()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        guard let tableView = contentView?.tableView else { return }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        tableView.register(SportCell.self, forCellReuseIdentifier: SportCell.identifier)
    }
    
    private func setupSearchBar() {
        contentView?.searchBar.delegate = self
    }
    
    private func setupScrollView() {
        guard let contentView = contentView else { return }
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "iSport"
        let searchButton = UIBarButtonItem(systemItem: .search)
        searchButton.tintColor = .black
        navigationItem.rightBarButtonItem = searchButton
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

// MARK: - UITableViewDataSource

extension SportsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(with: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SportCell.identifier, for: indexPath) as? SportCell else {
            fatalError("The TableView could not dequeue a custom cell")
        }
        
        let events = viewModel.events(at: indexPath)
        cell.configureUI(items: events)
        
        favoritedEvents = cell.getFavoriteEvents()
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SportsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SportHeaderView()
        headerView.backgroundColor = .systemBackground
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:)))
        headerView.addGestureRecognizer(tapGesture)
        headerView.tag = section
        
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: tableView.frame.size.width - 20, height: 20))
        label.text = viewModel.sectionHeaderTitle(with: section)
        headerView.addSubview(label)
        
        headerView.setImageAnimated(to: viewModel.getColapsableImage(with: section))
        
        return headerView
    }
    
    @objc func headerTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let headerView = gestureRecognizer.view as? SportHeaderView else { return }
        
        if let section = gestureRecognizer.view?.tag {
            viewModel.toggleSectionExpansion(at: section)
            
            headerView.setImageAnimated(to: viewModel.getColapsableImage(with: section))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.contentView?.tableView.reloadSections(IndexSet(integer: section), with: .automatic)
            }
        }
    }
}

// MARK: - UISearchBarDelegate

extension SportsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel.filterContentForSearchText(searchText: searchText, favoritesEvents: favoritedEvents)
        contentView?.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
