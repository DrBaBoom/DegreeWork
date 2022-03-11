//
//  Consts.swift
//  DegreeWork_1
//
//  Created by Yura on 24.01.2022.
//

import Foundation
import UIKit

struct StationOnLine {
    var name: String
    var pos: Position
    var shift: (Double, Double)
    var lblLeft: Bool
    
    init(_ name: String, _ pos: Position, _ shift: (Double, Double)? = nil, lblLeft: Bool = false) {
        self.name = name
        self.pos = pos
        self.shift = shift ?? (1, 0)
        self.lblLeft = lblLeft
    }
}

class Consts {
    
    static let allLines = [blue, green, yellow, red, pink]
    static let lineNameList = ["blueLine", "greenLine", "yellowLine", "redLine", "pinkLine"]
    static let colorList: [UIColor] = [.blue, UIColor(red: 0, green: 128 / 255.0, blue: 0, alpha: 1), .orange, .red, .purple]
    
    static let blue: [StationOnLine] = [
        StationOnLine("Парнас", Position(35, 4), nil),
        StationOnLine("Пр Просвещения", Position(35, 7), nil),
        StationOnLine("Озерки", Position(35, 11), nil),
        StationOnLine("Удельная", Position(35, 15), nil),
        StationOnLine("Пионерская", Position(35, 18), nil),
        StationOnLine("Черная Речка", Position(35, 22), nil),
        StationOnLine("Петроградская", Position(35, 27), nil),
        StationOnLine("Горьковская", Position(35, 34), nil),
        StationOnLine("Невский пр", Position(35, 42), (1, -2)),
        StationOnLine("Сенная", Position(35, 48), (1, -2)),
        StationOnLine("Техно Инст 2", Position(35, 65), (2, 0), lblLeft: true),
        StationOnLine("Фрунзенская", Position(35, 70), nil),
        StationOnLine("Московские Ворота", Position(35, 74), nil),
        StationOnLine("Электросила", Position(35, 78), nil),
        StationOnLine("Парк Победы", Position(35, 82), nil),
        StationOnLine("Московская", Position(35, 86), nil),
        StationOnLine("Звездная", Position(35, 90), nil),
        StationOnLine("Купчино", Position(35, 95), nil)]
    
    static let green: [StationOnLine] = [
        StationOnLine("Беговая", Position(7, 20), nil),
        StationOnLine("Зенит", Position(7, 25), nil),
        StationOnLine("Приморская", Position(10, 35), nil),
        StationOnLine("Василиостровская", Position(18, 40), nil, lblLeft: true),
        StationOnLine("Гостиный двор", Position(35, 42), nil),
        StationOnLine("Маяковская", Position(48, 42), nil),
        StationOnLine("Пл.А.Невского1", Position(63, 48), (1, -2)),
        StationOnLine("Елизаровская", Position(64, 71), nil),
        StationOnLine("Ломоновская", Position(64, 76), nil),
        StationOnLine("Пролетарская", Position(64, 83), nil),
        StationOnLine("Обухово", Position(64, 87), nil),
        StationOnLine("Рыбацкое", Position(64, 90), nil)]
    
    static let yellow: [StationOnLine] = [
        StationOnLine("Спасская", Position(35, 48), (0, -2), lblLeft: true),
        StationOnLine("Достоевская", Position(48, 48), (-5, -1.5)),
        StationOnLine("Лиговский пр.", Position(56, 48), (-5, 2)),
        StationOnLine("Пл.А.Невского2", Position(63, 48), nil),
        StationOnLine("Новочеркасская", Position(70, 50), nil),
        StationOnLine("Ладожская", Position(72, 56), nil),
        StationOnLine("Пр Большевиков", Position(72, 62), nil),
        StationOnLine("Ул Дыбенко", Position(72, 67), nil)]
    
    static let red: [StationOnLine] = [
        StationOnLine("Девяткино", Position(48, 6), nil),
        StationOnLine("Гражданский пр", Position(48, 10), nil),
        StationOnLine("Академическая", Position(48, 14), nil),
        StationOnLine("Политехническая", Position(48, 17), nil),
        StationOnLine("Пл Мужества", Position(48, 20), nil),
        StationOnLine("Лесная", Position(48, 24), nil),
        StationOnLine("Выборгская", Position(48, 28), nil),
        StationOnLine("Пл Ленина", Position(48, 32), nil),
        StationOnLine("Чернышевская", Position(48, 36), nil),
        StationOnLine("Пл Востания", Position(48, 42), (1, -2)),
        StationOnLine("Владимирская", Position(48, 48), (-2, -2), lblLeft: true),
        StationOnLine("Пушкинская", Position(44, 55), (2, 1)),
        StationOnLine("Техно инст 1", Position(35, 65), (2, 0)),
        StationOnLine("Балтийская", Position(29, 69), nil, lblLeft: true),
        StationOnLine("Нарвская", Position(25, 73), nil, lblLeft: true),
        StationOnLine("Кировский ", Position(21, 79), nil, lblLeft: true),
        StationOnLine("Автово", Position(18, 83), nil),
        StationOnLine("Ленинский пр", Position(17, 87), nil),
        StationOnLine("Пр Ветеранов", Position(16, 90), nil)]
    
    static let pink: [StationOnLine] = [
        StationOnLine("Комендантский пр", Position(21, 15), nil),
        StationOnLine("Старая деревня", Position(21, 20), nil),
        StationOnLine("Крестовский остров", Position(21, 25), nil),
        StationOnLine("Чкаловская", Position(21, 29), nil),
        StationOnLine("Спортивная", Position(21, 33), nil),
        StationOnLine("Адмиралтейская", Position(28, 45), lblLeft: true),
        StationOnLine("Садовая", Position(35, 48), (1.5, 0), lblLeft: true),
        StationOnLine("Звенигородская", Position(44, 55), (2, -1)),
        StationOnLine("Обводный канал", Position(48, 62), nil),
        StationOnLine("Волковская", Position(50, 73), nil),
        StationOnLine("Бухарестская", Position(50, 77), nil),
        StationOnLine("Международная", Position(50, 82), nil),
        StationOnLine("Пр Славы", Position(50, 86), nil),
        StationOnLine("Дунайская", Position(50, 90), nil),
        StationOnLine("Шушары", Position(50, 94), nil)]
}
