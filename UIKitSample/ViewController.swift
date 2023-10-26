//
//  ViewController.swift
//  UIKitSample
//
//  Created by Jun Morita on 2023/10/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    private let items: [String] = [
        "UIMenu"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc: UIViewController = UIStoryboard(name: "UIMenuSampleViewController", bundle: nil).instantiateViewController(identifier: "UIMenuSampleViewController") { coder in
                    return UIMenuSampleViewController(coder: coder)
            }
            present(vc, animated: true, completion: nil)
        default:
            break
        }
    }
    
}

