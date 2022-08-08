//
//  GettingCallList.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import RxSwift
import MGArchitecture

protocol GettingCallList {
    var callGateway: CallGatewayType { get }
}

extension GettingCallList {
    func getCallList(dto: GetPageDto) -> Observable<PagingInfo<CallModel>> {
        return callGateway.getCallList(dto: dto)
    }
}
