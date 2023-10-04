//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 02/10/23.
//

import UIKit

final class RMTableViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTabs()
    }
    
    private func setUpTabs()
    {
        let characterVc = RMCharacterViewController()
        let LocationVc = RMLocationViewController()
        let EpisodeVc = RMEpisodeViewController()
        let SettingVc = RMSettingViewController()
        
        characterVc.navigationItem.largeTitleDisplayMode = .automatic
        LocationVc.navigationItem.largeTitleDisplayMode = .automatic
        EpisodeVc.navigationItem.largeTitleDisplayMode = .automatic
        SettingVc.navigationItem.largeTitleDisplayMode = .automatic
        
        
        let nav1 = UINavigationController(rootViewController: characterVc)
        let nav2 = UINavigationController(rootViewController: LocationVc)
        let nav3 = UINavigationController(rootViewController: EpisodeVc)
        let nav4 = UINavigationController(rootViewController: SettingVc)
        
        
        nav1.tabBarItem = UITabBarItem(title: "Character",
                                       image: UIImage(systemName: "person"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Location",
                                       image: UIImage(systemName:"globe"),
                                       tag: 2)
        
        nav3.tabBarItem = UITabBarItem(title: "Episode",
                                       image: UIImage(systemName: "tv"),
                                       tag: 3)
        
        nav4.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"), tag: 4)
        
        for nav in [nav1 ,nav2 , nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        
        setViewControllers([nav1 ,nav2 , nav3, nav4], animated: true)
    }


}

