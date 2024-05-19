//
//  SportsViewModelProtocol.swift
//  iSport
//
//  Created by Elisa Kalil on 19/05/24.
//

import UIKit

protocol SportsViewModelProtocol {
    func numberOfSections() -> Int
    func numberOfRowsInSection(with section: Int) -> Int
    func getColapsableImage(with section: Int) -> UIImage
    func sectionHeaderTitle(with section: Int) -> String
    func toggleSectionExpansion(at index: Int)
    func filterContentForSearchText(searchText: String)
    func didFavoritedEvent(with id: String)
    func reload()
    func events(at indexPath: IndexPath) -> [EventModel]
}
