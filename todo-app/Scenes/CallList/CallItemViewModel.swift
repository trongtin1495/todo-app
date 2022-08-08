//
//  CallItemViewModel.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import Foundation

struct CallItemViewModel {
    let name: String
    let number: String
    
    init(call: CallModel) {
        self.name = call.name
        self.number = call.number
    }
}
