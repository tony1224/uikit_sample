//
//  UIMenuSampleViewController.swift
//  UIKitSample
//
//  Created by Jun Morita on 2023/10/26.
//

import UIKit

class UIMenuSampleViewController: UIViewController {
    
    @IBOutlet private var button: UIButton! {
        didSet {
            var config = UIButton.Configuration.plain()
            config.title = "Button"
            config.image = UIImage(resource: .arrow)
            config.imagePadding = 8
            config.imagePlacement = .trailing
            config.baseForegroundColor = .black
            button.configuration = config
        }
    }
    
    private enum MenuType: String, CaseIterable {
        case all = "All"
        case myPoint = "myPoint"
        case pointOff = "PointOff"
        case ePoint = "EPoint"
        case d1Point = "D1Point"
    }
    private var selectedMenuTyep = MenuType.all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenuButton()
    }
    
    private func configureMenuButton() {
        var actions = [UIMenuElement]()
        MenuType.allCases.forEach {
            actions.append(configureAction(type: $0))
        }
        button.menu = UIMenu(title: "", options: .displayInline, children: actions)
        button.showsMenuAsPrimaryAction = true
        button.setTitle(selectedMenuTyep.rawValue, for: .normal)
    }
    
    private func configureAction(type: MenuType) -> UIAction {
        UIAction(title: type.rawValue, image: nil, state: selectedMenuTyep == type ? .on : .off, handler: { _ in
            self.selectedMenuTyep = type
            self.configureMenuButton()
        })
    }

}
