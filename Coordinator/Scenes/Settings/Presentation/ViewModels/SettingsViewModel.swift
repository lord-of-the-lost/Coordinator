//
//  SettingsViewModel.swift
//  Coordinator
//
//  Created by Николай Игнатов on 09.11.2023.
//

import Foundation

final class SettingsViewModel {
    var settingsCount: Int {
        itemsSettingsViewModel.count
    }
    
    private var itemsSettingsViewModel: [ItemSettingsViewModel] = [
        ItemSettingsViewModel(title: "User Configuration",
                              icon: "person",
                              isNavigable: false,
                              navigation: .userConfiguration),
        ItemSettingsViewModel(title: "Account",
                              icon: "archivebox.circle",
                              isNavigable: true,
                              navigation: .account),
        ItemSettingsViewModel(title: "Theme",
                              icon: "paintbrush",
                              isNavigable: true,
                              navigation: .theme),
        ItemSettingsViewModel(title: "LogOut",
                              icon: "door.right.hand.open",
                              isNavigable: false,
                              navigation: .logOut),
        ItemSettingsViewModel(title: "Version App 1.0.1",
                              icon: "apps.iphone",
                              isNavigable: false,
                              navigation: .noNavigation)
    ]
    private var authorization: LogOutAuth?
    
    init(authorization: LogOutAuth?) {
        self.authorization = authorization
    }
    
    private func logOut() {
        authorization?.logOut()
    }
    
    func getItemSettingsViewModel(row: Int) -> ItemSettingsViewModel {
        itemsSettingsViewModel[row]
    }
    
    func cellSelected(row: Int) -> SettingsViewNavigation {
        let navigation = itemsSettingsViewModel[row].navigation
        if navigation == .logOut {
            logOut()
        }
        return navigation
    }
}
