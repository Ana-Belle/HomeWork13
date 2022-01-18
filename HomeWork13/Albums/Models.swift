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

let models = [
    Models(options: [.albumsCell(model: ItemOption(name: "Недавние",
                                                   number: 15198,
                                                   imageName: "recent")),
                     .albumsCell(model: ItemOption(name: "Sardinia",
                                                   number: 50,
                                                   imageName: "sardinia")),
                     .albumsCell(model: ItemOption(name: "Москва",
                                                   number: 30,
                                                   imageName: "moscow")),
                     .albumsCell(model: ItemOption(name: "Italy",
                                                   number: 100,
                                                   imageName: "italy")),
                     .albumsCell(model: ItemOption(name: "Море",
                                                   number: 35,
                                                   imageName: "sea")),
                     .albumsCell(model: ItemOption(name: "Путешествия",
                                                   number: 500,
                                                   imageName: "travels")),
                     .albumsCell(model: ItemOption(name: "Еда",
                                                   number: 10,
                                                   imageName: "food")),
                     .albumsCell(model: ItemOption(name: "Instagram",
                                                   number: 15,
                                                   imageName: "instagram"))
                    ]),
    Models(options: [.albumsCell(model: ItemOption(name: "Люди",
                                                   number: 0,
                                                   imageName: "people")),
                     .albumsCell(model: ItemOption(name: "Места",
                                                   number: 11794,
                                                   imageName: "places")),
                     .albumsCell(model: ItemOption(name: "Flowers",
                                                   number: 700,
                                                   imageName: "flowers")),
                     .albumsCell(model: ItemOption(name: "Design",
                                                   number: 100,
                                                   imageName: "design"))
                    ]),
    Models(options: [.standardCell(model: TableOption(title: "Видео",
                                                      icon: UIImage(systemName: "video"),
                                                      label: 1129)),
                     .standardCell(model: TableOption(title: "Селфи",
                                                      icon: UIImage(systemName: "person.crop.square"),
                                                      label: 672)),
                     .standardCell(model: TableOption(title: "Фото Live Photos",
                                                      icon: UIImage(systemName: "livephoto"),
                                                      label: 2021)),
                     .standardCell(model: TableOption(title: "Портреты",
                                                      icon: UIImage(systemName: "cube"),
                                                      label: 631)),
                     .standardCell(model: TableOption(title: "Панорамы",
                                                      icon: UIImage(systemName: "pano"),
                                                      label: 3)),
                     .standardCell(model: TableOption(title: "Таймлапс",
                                                      icon: UIImage(systemName: "timelapse"),
                                                      label: 2)),
                     .standardCell(model: TableOption(title: "Замедленно",
                                                      icon: UIImage(systemName: "slowmo"),
                                                      label: 10)),
                     .standardCell(model: TableOption(title: "Снимки экрана",
                                                      icon: UIImage(systemName: "camera.viewfinder"),
                                                      label: 560)),
                     .standardCell(model: TableOption(title: "Записи экрана",
                                                      icon: UIImage(systemName: "record.circle"),
                                                      label: 1))
                    ]),
    Models(options: [.standardCell(model: TableOption(title: "Импортированные",
                                                      icon: UIImage(systemName: "square.and.arrow.down"),
                                                      label: 35)),
                     .standardCell(model: TableOption(title: "Скрытые",
                                                      icon: UIImage(systemName: "eye.slash"),
                                                      label: 0)),
                     .standardCell(model: TableOption(title: "Недавно удаленные",
                                                      icon: UIImage(systemName: "trash"),
                                                      label: 0))
                    ])
]
