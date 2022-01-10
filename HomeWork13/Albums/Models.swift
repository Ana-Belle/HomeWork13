//
//  Models.swift
//  HomeWork13
//
//  Created by Anastasia Belyakova on 10.01.2022.
//

import UIKit

struct Models {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case albumsCell(model: ItemOption)
    case standardCell(model: TableOption)
}

struct ItemOption {
    let name: String
    let number: Int
    let imageName: String
}

struct TableOption {
    let title: String
    let icon: UIImage?
    var label: Int
}
