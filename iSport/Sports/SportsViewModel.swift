//
//  SportsViewModel.swift
//  iSport
//
//  Created by Elisa Kalil on 19/05/24.
//

import Foundation

class SportsViewModel {
    
    private var sports: [Sport]
    private var isSectionExpanded: [Bool]
    
    // Singleton pattern: Instância compartilhada da SportsViewModel
    static let shared = SportsViewModel()
    
    private init() {
        // Inicialize os esportes aqui ou passe-os como argumento
        self.sports = sportsStored
        self.isSectionExpanded = Array(repeating: true, count: sports.count)
    }
    
    // Número total de seções
    var numberOfSections: Int {
        return sports.count
    }
    
    // Verifica se uma seção está expandida ou não
    func isSectionExpanded(at index: Int) -> Bool {
        return isSectionExpanded[index]
    }
    
    // Retorna o número de eventos em uma determinada seção
    func numberOfEvents(inSection section: Int) -> Int {
        return isSectionExpanded[section] ? sports[section].events.count : 0
    }
    
    // Retorna o evento em um determinado índice de seção e linha
    func event(at indexPath: IndexPath) -> Event {
        return sports[indexPath.section].events[indexPath.row]
    }
    
    // Alterna a expansão de uma seção
    func toggleSectionExpansion(at index: Int) {
        isSectionExpanded[index].toggle()
    }
}

