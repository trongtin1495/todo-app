//
//  AppSettings.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit

enum AppSettings {
    
    @Storage(key: "didInit", defaultValue: false)
    static var didInit: Bool // swiftlint:disable:this let_var_whitespace
}
