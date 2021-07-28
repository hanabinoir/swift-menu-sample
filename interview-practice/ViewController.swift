//
//  ViewController.swift
//  interview-practice
//
//  Created by Hiroshi Shin on 2021/04/13.
//

import UIKit
import SideMenu

class ViewController: UIViewController, MenuDelegate {
    
    // MARK: init
    private var sideMenu: SideMenuNavigationController?
    private let btnMenu = UIBarButtonItem()

    // MARK: override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // First time settings
        title = "Home"
        view.addSubview(HomeView())
        
        // Navigation Button for Side Menu
        btnMenu.title = "Menu"
        btnMenu.target = self
        btnMenu.action = #selector(self.toggleSideMenu)
        navigationItem.leftBarButtonItem = btnMenu
        
        // Side Menu
        let mc = SideMenuController()
        mc.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: mc)
        sideMenu?.leftSide = true
        sideMenu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Hold the main view inside container
        view.subviews.first?.frame = view.frame
    }
    
    // MARK: menu delegate
    func didSelectItem(item: SideMenuModel) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            guard let self = self else { return }
            self.title = item.name
            self.view.subviews.first?.removeFromSuperview()
            self.view.addSubview(item.view)
            
            if item.name == SideMenuItem.web.rawValue {
                (item.view as! WebGateView).openWebAction = { [weak self] in
                    guard let self = self else { return }
                    self.navigationController?.pushViewController(WebViewController(), animated: false)
                }
            }
        })
    }

    // MARK: actions
    @objc func toggleSideMenu() {
        if let menu = sideMenu {
            menu.isHidden ? present(menu, animated: true, completion: {
                print("Menu is showing")
            }) : menu.dismiss(animated: true, completion: {
                print("Menu is hidden")
            })
        } else { return }
    }

}

