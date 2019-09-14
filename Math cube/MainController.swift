//
//  MainController.swift
//  Math cube
//
//  Created by Kuts, Andrey on 7/31/19.
//

import UIKit
import GameKit

class MainController: UITableViewController {

    @IBOutlet weak var payButton: UIButton!
    var menuExpanded:Bool = false
    var dataSourse = [localized("Start"),
                     localized("Rules"),
                     localized("Modes")]

    var complexity = Complexity(rawValue: 0)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell: UITableViewCell = sender as! UITableViewCell
        let path: IndexPath = tableView.indexPath(for: cell)!
        let controller: CalculateController = segue.destination as! CalculateController;
        controller.complexity = Complexity(rawValue: UInt8(path.row))!;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (!self.menuExpanded || (self.menuExpanded && (indexPath.row < 3 || indexPath.row > 9))) {
            return UIDevice.current.userInterfaceIdiom == .pad ? 100 : 68
        }
        return 44
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (!self.menuExpanded || (self.menuExpanded && (indexPath.row < 3 || indexPath.row > 9))) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell")!
            if let button = cell.viewWithTag(111) as? UIButton {
                button.setTitle(dataSourse[indexPath.row], for: .normal)
                button.removeTarget(nil, action: nil, for: .touchUpInside)
                
                switch indexPath.row {
                case 1:
                    button.addTarget(self, action: #selector(help), for: .touchUpInside)
                case 2:
                    button.addTarget(self, action: #selector(expand), for: .touchUpInside)
                case 0:
                    button.addTarget(self, action: #selector(start), for: .touchUpInside)
                default:
                    break;
                }
                
                // button.tag = indexPath.row
            }
            cell.separatorInset = UIEdgeInsets(top: 0, left: tableView.frame.size.width, bottom: 0, right: 0);
            cell.backgroundColor = .clear
            return cell
        }
        
        let cell:UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "textCell")
        cell.textLabel?.text = dataSourse[indexPath.row]
        cell.textLabel?.textColor = .white
        let offset = UIDevice.current.userInterfaceIdiom == .pad ? 220 : 25
        cell.separatorInset = UIEdgeInsets(top: 0, left: CGFloat(offset), bottom: 0, right: CGFloat(offset))
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        if (indexPath.row == Int(self.complexity.rawValue) + 3) {
            cell.textLabel?.text = NSString(format: "✔︎ %@",dataSourse[indexPath.row]) as String
            //cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.textLabel?.text = dataSourse[indexPath.row]
            //cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (!self.menuExpanded || (self.menuExpanded && (indexPath.row < 3 || indexPath.row > 9))) {
            return
        }
        self.complexity = Complexity(rawValue: UInt8(indexPath.row - 3))!
        self.tableView.reloadData()
    }
    
    @IBAction func menuButtonTap (sender :UIButton) {
        
        switch sender.tag {
        case 1:
            self.help()
        case 2:
            self.expand()
        case 0:
            self.start()
        default:
            break;
        }
    }
    
    @objc func expand() {
        self.menuExpanded.toggle()

        if menuExpanded {
            dataSourse = [localized("Start"),
                         localized("Rules"),
                         localized("Modes"),
                         localized("2 digits"),
                         localized("3 digits"),
                         localized("4 digits"),
                         localized("Line"),
                         "2х2",
                         "2х3",
                         "3х3"]
        } else {
            dataSourse = [localized("Start"),
                         localized("Rules"),
                         localized("Modes")]
        }
        let indices: IndexSet = [0]
        self.tableView.reloadSections(indices, with: .automatic)
    }
    
    @objc func help() {
        let sbName = "Main"
        let storyBoard = UIStoryboard(name: sbName, bundle: nil)
        let controller: InstructionController = storyBoard
            .instantiateViewController(withIdentifier: "InstructionController") as! InstructionController
        self.navigationController?.pushViewController(controller, animated: true)
    }

    @objc func start() {
        let sbName = "Main"
        let storyBoard = UIStoryboard(name: sbName, bundle: nil)
        let controller: CalculateController = storyBoard
            .instantiateViewController(withIdentifier: "PlayViewController") as! CalculateController
        controller.complexity = complexity;
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

