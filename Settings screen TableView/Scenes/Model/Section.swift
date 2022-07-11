//
//  Section.swift
//  Settings screen TableView
//
//  Created by Anatoliy on 11.07.2022.
//

import Foundation
import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}
enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
    case greyLabel(model: SettingsGreyLabelOption)
    case redLogo(model: SettingsRedLogoOption)
    }

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsGreyLabelOption {
    let title: String
    let title2: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    
}
struct SettingsRedLogoOption {
    let title: String
    let icon: UIImage?
    let icon2: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    
}
