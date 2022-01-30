//
//  Subway.swift
//  DegreeWork_1
//
//  Created by Yura on 22.01.2022.
//

import Foundation

class Subway {
    
    static private var subway: [Station] = []
    static private(set) var superStations: [Station] = []

    
    static func getSubway() -> [Station] {
        if subway.count == 0 {
            subway = createSubway()
        }
        return subway
    }
    
    static private func createLine(of stationNamesAndPos: [(String, Position)], lineName: String) -> [Station] {
        var result = [Station]()
        for (index, s) in stationNamesAndPos.enumerated() {
            let station = Station(name: s.0, lineName: lineName, placeOnMap: s.1)
            result.append(station)
            
            if index - 1 >= 0 {
                let previousStation = result[index - 1]
                connectStations(st1: station, st2: previousStation)
            }
        }
        return result
    }
    
    
    static private func connectStations(st1: Station, st2: Station) {
        st1.closestStations.append(st2)
        st2.closestStations.append(st1)
    }
    
    
    static private func createSubway() -> [Station] {
        var result: [Station] = []
        let yellowLine = createLine(of: Consts.yellow, lineName: "yellowLine")
        let greenLine = createLine(of: Consts.green, lineName: "greenLine")
        let blueLine = createLine(of: Consts.blue, lineName: "blueLine")
        let pinkLine = createLine(of: Consts.pink, lineName: "pinkLine")
        let redLine = createLine(of: Consts.red, lineName: "redLine")
        
        connectStations(st1: blueLine[8], st2: greenLine[4])
        superStations.append(blueLine[8])
        
        connectStations(st1: blueLine[9], st2: yellowLine[0])
        connectStations(st1: blueLine[9], st2: pinkLine[6])
        connectStations(st1: yellowLine[0], st2: pinkLine[6])
        superStations.append(blueLine[9])
        
        connectStations(st1: greenLine[6], st2: yellowLine[3])
        superStations.append(greenLine[6])
        
        connectStations(st1: redLine[9], st2: greenLine[5])
        superStations.append(redLine[9])
        
        connectStations(st1: redLine[10], st2: yellowLine[1])
        superStations.append(redLine[10])
        
        connectStations(st1: redLine[11], st2: pinkLine[7])
        superStations.append(redLine[11])
        
        connectStations(st1: redLine[12], st2: blueLine[10])
        superStations.append(redLine[12])
        
        result = greenLine + blueLine + yellowLine + pinkLine + redLine
        return result
    }
    
    
//    Алгоритм Деикстра по нахождению кротчайшего пути в граффе
    static func shortestPath (startStation: Station, destination: Station) -> [Station] {
        
        var currentStation = startStation
        currentStation.visited = true
        currentStation.distance = 0
        currentStation.shortestPath.append(startStation)
        
        var toVisit = subway
        
        while ( !toVisit.isEmpty) {
            toVisit = toVisit.filter{ station in station != currentStation }
            currentStation.visited = true
            for conectedStation in currentStation.closestStations {
                if conectedStation.visited {
                    continue
                }
                let newDistance = currentStation.distance + 1
                let newPath = currentStation.shortestPath + [conectedStation]
                
                if (newDistance < conectedStation.distance) {
                    conectedStation.distance = newDistance
                    conectedStation.shortestPath = newPath
                    if (conectedStation.visited == true) {
                        conectedStation.visited = false
                    }
                }
            }

            currentStation.visited = true
            if !toVisit.isEmpty {
                currentStation = toVisit.min(by: { (a, b) -> Bool in
                    return a.distance < b.distance
                })!
            }
            
            if (currentStation == destination) {
                return currentStation.shortestPath
            }
        }
        
        return []
    }
}
