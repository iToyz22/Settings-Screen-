//
//  ViewController.swift
//  Settings screen TableView
//
//  Created by Anatoliy on 12.06.2022.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        
        table.register(GreyLabelTableViewCell.self, forCellReuseIdentifier: GreyLabelTableViewCell.identifier)
        
        table.register(RedLabelTableViewCell.self, forCellReuseIdentifier: RedLabelTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Настройки"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    
    }
    
    func configure() {
        models.append(Section(title:"General", options: [
            .switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
            }, isOn:  false)),
            
                .greyLabel(model: SettingsGreyLabelOption(title: "Wi-Fi", title2: "Не подключено", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue) {
                }),
            .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "bolt"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка bluetooth")
            }),
            .staticCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                print("Нажата ячейка Сотовая связь")
            }),
            .staticCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen) {
                print("Нажата ячейка Режим модема")
            }),
            .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(systemName: "network"), iconBackgroundColor: .systemBlue, handler: {
                
            }, isOn:  false)),
            
        ]))
        
        models.append(Section(title:"Information", options: [
            .staticCell(model: SettingsOption(title: "Уведомления", icon: UIImage(systemName: "message.circle"), iconBackgroundColor: .systemPink) {
                print("Нажата ячейка Notification")
            }),
            .staticCell(model: SettingsOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3"), iconBackgroundColor: .systemPink) {
                print("Нажата ячейка Звуки, тактильные сигналы")
            }),
            .staticCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemIndigo) {
                print("Нажата ячейка Airplane mode")
            }),
            .staticCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemIndigo) {
                print("Нажата ячейка Экранное время")
            }),
            
        ]))
        
        models.append(Section(title:"Apps", options: [
            .redLogo(model: SettingsRedLogoOption(title: "Основные", icon: UIImage(systemName: "gear"), icon2: UIImage(systemName: "1.circle"), iconBackgroundColor: .systemGray2) {
                
            }),
            .staticCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray2) {
                print("Пункт управления")
            }),
            .staticCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка Экран и яркость")
            }),
            .staticCell(model: SettingsOption(title: "Экран \("Домой")", icon: UIImage(systemName: "rectangle.on.rectangle"), iconBackgroundColor: .systemBlue) {
                print("Нажата ячейка Экран домой")
            }),
            .staticCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "hand.thumbsup.fill"), iconBackgroundColor: .systemBlue) {
                print("Универсальный доступ")
            }),
            
        ]))
    }
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
}

