//
//  SideMenuController.swift
//  interview-practice
//
//  Created by Hiroshi Shin on 2021/04/14.
//

import Foundation
import UIKit
import SideMenu

class SideMenuModel {
    let name: String
    let view: UIView
    
    init(name: String, view: UIView) {
        self.name = name
        self.view = view
    }
}

enum SideMenuItem: String, CaseIterable {
    case home = "Home"
    case web = "Web"
    case ocr = "OCR"
}


protocol MenuDelegate {
    func didSelectItem(item: SideMenuModel)
}

class SideMenuController: UITableViewController {
    
    var delegate: MenuDelegate?
    
    private let items = SideMenuItem.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuItem")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItem", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].rawValue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        delegate?.didSelectItem(item: getModel(item: items[indexPath.row]))
    }
    
    private func getModel(item: SideMenuItem) -> SideMenuModel {
        let model : SideMenuModel
        
        switch item {
        case .home:
            model = SideMenuModel(name: item.rawValue, view: HomeView())
        case .ocr:
            model = SideMenuModel(name: item.rawValue, view: OCRView())
        case .web:
            model = SideMenuModel(name: item.rawValue, view: WebGateView())
        }
        
        return model
    }
    
}
