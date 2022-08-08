//
//  AppGateway.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit

protocol AppGatewayType {
    func checkFirstRun() -> Bool
    func setFirstRun()
}

struct AppGateway: AppGatewayType {
    func checkFirstRun() -> Bool {
        return !AppSettings.didInit
    }
    
    func setFirstRun() {
        AppSettings.didInit = true
    }
}
