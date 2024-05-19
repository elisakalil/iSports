//
//  SportsViewModel.swift
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
    func events(at indexPath: IndexPath) -> [EventModel]
}

class SportsViewModel {
    
    // MARK: - Properties

    var sports: [SportModel] = []
    private var isSectionExpanded: [Bool]
    private var originalSports: [SportModel] = []
    static let shared = SportsViewModel()
    
    // MARK: - Initializer

    private init() {
        isSectionExpanded = Array(repeating: true, count: sports.count)
        loadSportsData()
    }
    
    // MARK: - Private Methods
    
    private func loadSportsData() {
        if let url = Bundle.main.url(forResource: "mock_data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let sports = try JSONDecoder().decode([Sport].self, from: data)
                self.sports = sports.map { $0.toSport() }
                self.originalSports = self.sports
                self.isSectionExpanded = Array(repeating: true, count: self.sports.count)
            } catch {
                print("Error loading mock data:", error)
            }
        }
    }
}

// MARK: - SportsViewModelProtocol

extension SportsViewModel: SportsViewModelProtocol {
    func filterContentForSearchText(searchText: String) {
        if searchText.isEmpty {
            sports = originalSports
        } else {
            var filteredSports: [SportModel] = []
            
            for sport in originalSports {
                let filteredEvents = sport.events.filter { event in
                    let isFavorited = event.isFavorited
                    let containsSearchText = event.description.lowercased().contains(searchText.lowercased())
                    return isFavorited && containsSearchText
                }
                
                if !filteredEvents.isEmpty {
                    let filteredSport = SportModel(id: sport.id, description: sport.description, events: filteredEvents)
                    filteredSports.append(filteredSport)
                }
            }
            sports = filteredSports
        }
    }
    
    func numberOfSections() -> Int {
        var uniqueSport = Set<String>()
        
        for sport in sports {
            uniqueSport.insert(sport.id)
        }
        return uniqueSport.count
    }
    
    func getColapsableImage(with section: Int) -> UIImage {
        let imageName = isSectionExpanded[section] ? "chevron-selected" : "chevron"
        let image = UIImage(named: imageName)
        return image ?? .baseball1
    }
    
    func numberOfRowsInSection(with section: Int) -> Int {
        return isSectionExpanded[section] ? 1 : 0
    }
    
    func sectionHeaderTitle(with section: Int) -> String {
        return SportType(rawValue: sports[section].description)?.fullName() ?? "Error"
    }
    
    func events(at indexPath: IndexPath) -> [EventModel] {
        return sports[indexPath.section].events
    }
    
    func toggleSectionExpansion(at index: Int) {
        isSectionExpanded[index].toggle()
    }
    
    func didFavoritedEvent(with id: String) {
        for (sportIndex, sport) in sports.enumerated() {
            if let eventIndex = sport.events.firstIndex(where: { $0.id == id }) {
                sports[sportIndex].events[eventIndex].isFavorited.toggle()
                break
            }
        }
        
        for (sportIndex, originalSport) in originalSports.enumerated() {
            if let eventIndex = originalSport.events.firstIndex(where: { $0.id == id }) {
                originalSports[sportIndex].events[eventIndex].isFavorited.toggle()
                break
            }
        }
    }
}
