//
//  SportsStored.swift
//  iSport
//
//  Created by Elisa Kalil on 19/05/24.
//

import Foundation

public let sportsStored = [
    Sport(id: "089067", description: "FOOT", events: [
        Event(id: "1234", sportId: "1234", image: "foot1", description: "Greece-Spain", timestamp: 1732890260),
        Event(id: "1235", sportId: "1234", image: "foot2", description: "Italy-France", timestamp: 1657944685)
    ]),
    Sport(id: "089068", description: "BASKT", events: [
        Event(id: "2234", sportId: "2234", image: "basketball1", description: "USA-Canada", timestamp: 1657944686),
        Event(id: "2235", sportId: "2234", image: "basketball2", description: "Germany-Spain", timestamp: 1657944687)
    ]),
    // Adicione mais esportes aqui...
]

//let sportsStored = [
//    .init(id: "089067", description: "FOOT", events: [
//        .init(id: "1234", sportId: "1234", image: "foot1", description: "Greece-Spain", timestamp: 1732890260),
//        .init(id: "1235", sportId: "1234", image: "foot2", description: "Italy-France", timestamp: 1657944685),
//        .init(id: "1234", sportId: "1234", image: "foot3", description: "Greece-Spain", timestamp: 1658002684)
////        .init(id: "1235", sportId: "1234", image: "foot4", description: "Italy-France", timestamp: 1658011084),
////        .init(id: "1234", sportId: "1234", image: "foot5", description: "Greece-Spain", timestamp: 1658025484),
////        .init(id: "1235", sportId: "1234", image: "foot6", description: "Italy-France", timestamp: 1657982284)
//    ]),
//    .init(id: "089068", description: "BASKT", events: [
//        .init(id: "2234", sportId: "2234", image: "basketball1", description: "USA-Canada", timestamp: 1657944686),
//        .init(id: "2235", sportId: "2234", image: "basketball2", description: "Germany-Spain", timestamp: 1657944687),
//        .init(id: "2236", sportId: "2234", image: "basketball3", description: "France-Italy", timestamp: 1657944688),
//        .init(id: "2237", sportId: "2234", image: "basketball4", description: "Australia-Brazil", timestamp: 1657944689),
//        .init(id: "2238", sportId: "2234", image: "basketball5", description: "Japan-Argentina", timestamp: 1657944690),
//        .init(id: "2239", sportId: "2234", image: "basketball3", description: "Russia-Greece", timestamp: 1657944691)
////        .init(id: "2240", sportId: "2234", image: "basketball2", description: "China-France", timestamp: 1657944692),
////        .init(id: "2241", sportId: "2234", image: "basketball4", description: "Canada-Australia", timestamp: 1657944693),
////        .init(id: "2242", sportId: "2234", image: "basketball3", description: "Brazil-Germany", timestamp: 1657944694)
//    ]),
//    .init(id: "089069", description: "TENIS", events: [
//        .init(id: "3234", sportId: "3234", image: "tennis1", description: "Nadal-Djokovic", timestamp: 1657944688),
//        .init(id: "3235", sportId: "3234", image: "tennis2", description: "Federer-Murray", timestamp: 1657944689),
//        .init(id: "3236", sportId: "3234", image: "tennis3", description: "Williams-Osaka", timestamp: 1657944690),
//        .init(id: "3237", sportId: "3234", image: "tennis4", description: "Nishikori-Thiem", timestamp: 1657944691)
////        .init(id: "3238", sportId: "3234", image: "tennis5", description: "Barty-Halep", timestamp: 1657944692),
////        .init(id: "3239", sportId: "3234", image: "tennis6", description: "Zverev-Medvedev", timestamp: 1657944693),
////        .init(id: "3240", sportId: "3234", image: "tennis7", description: "Sabalenka-Swiatek", timestamp: 1657944694)
//    ]),
//    .init(id: "089070", description: "VOLLY", events: [
//        .init(id: "4234", sportId: "4234", image: "volleyball1", description: "Brazil-Argentina", timestamp: 1657944690),
////        .init(id: "4235", sportId: "4234", image: "volleyball2", description: "Russia-USA", timestamp: 1657944691),
////        .init(id: "4236", sportId: "4234", image: "volleyball3", description: "Italy-Poland", timestamp: 1657944692),
//        .init(id: "4237", sportId: "4234", image: "volleyball4", description: "Serbia-France", timestamp: 1657944693),
//        .init(id: "4238", sportId: "4234", image: "volleyball5", description: "China-Japan", timestamp: 1657944694),
//        .init(id: "4239", sportId: "4234", image: "volleyball6", description: "Canada-Cuba", timestamp: 1657944695)
//    ]),
//    .init(id: "089071", description: "BASEB", events: [
//        .init(id: "5234", sportId: "5234", image: "baseball1", description: "Yankees-Red Sox", timestamp: 1657944692),
//        .init(id: "5235", sportId: "5234", image: "baseball2", description: "Dodgers-Giants", timestamp: 1657944693),
////        .init(id: "5236", sportId: "5234", image: "baseball3", description: "Cubs-Cardinals", timestamp: 1657944694),
////        .init(id: "5237", sportId: "5234", image: "baseball4", description: "Astros-Braves", timestamp: 1657944695),
//        .init(id: "5238", sportId: "5234", image: "baseball5", description: "Angels-Mariners", timestamp: 1657944696),
//        .init(id: "5239", sportId: "5234", image: "baseball2", description: "Mets-Phillies", timestamp: 1657944697),
//        .init(id: "5240", sportId: "5234", image: "baseball1", description: "Rays-Blue Jays", timestamp: 1657944698)
//    ]),
//    .init(id: "089072", description: "SOCCR", events: [
//        .init(id: "6234", sportId: "6234", image: "foot1", description: "Barcelona-Real Madrid", timestamp: 1657944694),
////        .init(id: "6235", sportId: "6234", image: "foot2", description: "Liverpool-Manchester United", timestamp: 1657944695),
////        .init(id: "6236", sportId: "6234", image: "foot1", description: "Bayern Munich-Borussia Dortmund", timestamp: 1657944696),
////        .init(id: "6239", sportId: "6234", image: "foot3", description: "Chelsea-Arsenal", timestamp: 1657944699),
//        .init(id: "6240", sportId: "6234", image: "foot1", description: "Manchester City-Tottenham Hotspur", timestamp: 1657944700),
//        .init(id: "6241", sportId: "6234", image: "foot2", description: "Atletico Madrid-Sevilla", timestamp: 1657944701)
//    ]),
//    .init(id: "089073", description: "SWIM", events: [
//        .init(id: "7234", sportId: "7234", image: "swimming1", description: "100m-Freestyle", timestamp: 1657944696),
//        .init(id: "7235", sportId: "7234", image: "swimming2", description: "200m-Butterfly", timestamp: 1657944697),
////        .init(id: "7236", sportId: "7234", image: "swimming3", description: "400m-Individual Medley", timestamp: 1657944698),
////        .init(id: "7237", sportId: "7234", image: "swimming4", description: "50m-Freestyle", timestamp: 1657944699),
//        .init(id: "7238", sportId: "7234", image: "swimming5", description: "800m-Freestyle", timestamp: 1657944700),
//        .init(id: "7239", sportId: "7234", image: "swimming6", description: "4x100m-Freestyle Relay", timestamp: 1657944701)
//    ]),
//    .init(id: "089074", description: "BDMNT", events: [
//        .init(id: "8234", sportId: "8234", image: "badminton1", description: "Lin Dan-Lee Chong Wei", timestamp: 1657944698),
//        .init(id: "8235", sportId: "8234", image: "badminton2", description: "Chen Long-Kento Momota", timestamp: 1657944699),
////        .init(id: "8236", sportId: "8234", image: "badminton3", description: "Viktor Axelsen-Anthony Ginting", timestamp: 1657944700),
////        .init(id: "8237", sportId: "8234", image: "badminton4", description: "Anders Antonsen-Shi Yuqi", timestamp: 1657944701),
//        .init(id: "8238", sportId: "8234", image: "badminton5", description: "Kevin Sanjaya-Marcus Gideon", timestamp: 1657944702),
//        .init(id: "8239", sportId: "8234", image: "badminton6", description: "Hendra Setiawan-Mohammad Ahsan", timestamp: 1657944703)
//    ])
////    .init(id: "089075", description: "TRCKF", events: [
////        .init(id: "9234", sportId: "9234", image: "track1", description: "100m-Dash", timestamp: 1657944700),
////        .init(id: "9235", sportId: "9234", image: "track2", description: "4x100m-Relay", timestamp: 1657944701),
////        .init(id: "9236", sportId: "9234", image: "track3", description: "400m", timestamp: 1657944702),
////        .init(id: "9237", sportId: "9234", image: "track4", description: "1500m", timestamp: 1657944703),
////        .init(id: "9238", sportId: "9234", image: "track5", description: "110m-Hurdles", timestamp: 1657944704)
////    ])
//]
