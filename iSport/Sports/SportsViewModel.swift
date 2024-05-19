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
    func events(at indexPath: IndexPath) -> [EventModel]
}

class SportsViewModel {
    
    // MARK: - Properties

    var sports: [Sport] = []
    private var isSectionExpanded: [Bool]
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
                self.sports = try JSONDecoder().decode([Sport].self, from: data)
                self.isSectionExpanded = Array(repeating: true, count: self.sports.count)
            } catch {
                print("Error loading mock data:", error)
            }
        }
    }
    
//    func isSectionExpanded(at index: Int) -> Bool {
//        return isSectionExpanded[index]
//    }
    
//    func numberOfEvents(inSection section: Int) -> Int {
//        return isSectionExpanded[section] ? sports[section].events.count : 0
//    }
}

// MARK: - SportsViewModelProtocol

extension SportsViewModel: SportsViewModelProtocol {
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
        return sports[indexPath.section].events.toEvents()
    }
    
    func toggleSectionExpansion(at index: Int) {
        isSectionExpanded[index].toggle()
    }
}
