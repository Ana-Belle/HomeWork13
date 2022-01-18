//
//  TabBarController.swift
//  HomeWork13
//
//  Created by Anastasia Belyakova on 10.01.2022.
//

import UIKit

extension AppDelegate {

    func setTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let mediaLibraryViewController = UIViewController()
        mediaLibraryViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        
        let forYouViewController = UIViewController()
        forYouViewController.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square.fill"), tag: 1)
        
        let albumsViewController = AlbumsViewController()
        let albumsNavigationController = UINavigationController(rootViewController: albumsViewController)
        albumsViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        albumsNavigationController.title = "Альбомы"
        albumsNavigationController.navigationBar.prefersLargeTitles = true
        albumsNavigationController.navigationBar.shadowImage = UIImage()
        albumsNavigationController.navigationBar.isTranslucent = true
        albumsNavigationController.view.backgroundColor = .white
        
        let searchViewController = UIViewController()
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        tabBarController.setViewControllers([
            mediaLibraryViewController,
            forYouViewController,
            albumsNavigationController,
            searchViewController
        ], animated: true)
        
        tabBarController.selectedIndex = 2
        
        return tabBarController
    }

}
