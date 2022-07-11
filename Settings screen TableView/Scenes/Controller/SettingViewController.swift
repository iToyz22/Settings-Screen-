//
//  SettingViewController.swift
//  Settings screen TableView
//
//  Created by Anatoliy on 11.07.2022.
//
import UIKit

var models = [Section]()

func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let section = models[section]
    return section.title
}


func numberOfSections(in tableView: UITableView) -> Int {
    return models.count
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models[section].options.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let model = models[indexPath.section].options[indexPath.row]
    
    
    switch model.self {
        
    case .staticCell(let model):
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath)
                as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
        
    case .switchCell(let model):
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath
        ) as? SwitchTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
        
        
    case .greyLabel(let model):
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GreyLabelTableViewCell.identifier, for: indexPath)
                as? GreyLabelTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
        
        
    case .redLogo(let model):
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RedLabelTableViewCell.identifier, for: indexPath)
                as? RedLabelTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let type = models[indexPath.section].options[indexPath.row]
    switch type.self {
    case .staticCell(let model):
        model.handler()
    case .switchCell(let model):
        model.handler()
    case .greyLabel(model: let model):
        model.handler()
    case .redLogo(model: let model):
        model.handler()
    }
}
