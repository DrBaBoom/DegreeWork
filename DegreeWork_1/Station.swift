//
//  Station.swift
//  DegreeWork_1
//
//  Created by Yura on 21.01.2022.
//

import Foundation

class Station: CustomStringConvertible, Equatable {
    
    let name: String
    let lineName: String
    let position: Position
    var closestStations: [Station] = []
    var visited = false
    var distance = Int.max
    var isSelected = false
    var shortestPath: [Station] = []
    
    
    init(name: String, lineName: String, placeOnMap: Position) {
        self.name = name
        self.lineName = lineName
        self.position = placeOnMap
    }
    
    var description: String {
        return "\n" + name + "(\(closestStations.map{station in station.name}))"
    }
    
    static func == (lhs: Station, rhs: Station) -> Bool {
        return lhs.name == rhs.name
    }
    
    static func != (lhs: Station, rhs: Station) -> Bool {
        return !(lhs == rhs)
    }
    
    var isSuper: Bool {
        for s in closestStations {
            if s.lineName != self.lineName {
                return true
            }
        }
        return false
    }
    
    var transfers: [Station] {
        var result: [Station] = []
        for s in closestStations {
            if s.lineName != self.lineName {
                result.append(s)
            }
        }
        return result
    }
    
}
