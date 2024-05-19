//
//  SportCell.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import UIKit

protocol SportCellDelegate: AnyObject {
    func didFavoriteEvent(_ cell: SportCell, eventID: String)
}

class SportCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CustomTableViewCell"
    weak var delegate: SportCellDelegate?
    var items: [EventModel] = []
    
    private let separator: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Initializer

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupCollectionView() {
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: EventCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupUI() {
        contentView.addSubview(collectionView)
        contentView.addSubview(separator)
        
        NSLayoutConstraint.activate([
            separator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            collectionView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    public func configureUI(items: [EventModel]) {
        self.items = items
        collectionView.reloadData()
    }
    
    func getFavoriteEvents() -> [EventModel] {
        return items
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension SportCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.identifier, for: indexPath) as? EventCell else {
            fatalError("The collection view could not dequeue a custom cell")
        }
        
        let item = items[indexPath.item]
        
        if let (firstLabel, secondLabel) = item.description.separatedByDash() {
            cell.configure(
                image: UIImage(named: item.image),
                eventTime: item.timestamp,
                firstTitle: firstLabel,
                secondTitle: secondLabel,
                isFavorited: item.isFavorited
            )
        } else {
            print("A string não está no formato esperado.")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let event = items[indexPath.item]
        let maxWidth: CGFloat = 120

        let titleWidth = event.description.size(withAttributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .light)
        ]).width

        let cellWidth = min(titleWidth + 20, maxWidth)
        return CGSize(width: cellWidth, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        items[indexPath.item].isFavorited.toggle()
        collectionView.reloadItems(at: [indexPath])
        
        let id = items[indexPath.item].id
        
        delegate?.didFavoriteEvent(self, eventID: id)
    }
}
