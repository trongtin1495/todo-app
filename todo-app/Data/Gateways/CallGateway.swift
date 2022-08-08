//
//  CallGateway.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import RxSwift
import MGArchitecture

protocol CallGatewayType {
    func getCallList(dto: GetPageDto) -> Observable<PagingInfo<CallModel>>
}

struct CallGateway: CallGatewayType {
    func getCallList(dto: GetPageDto) -> Observable<PagingInfo<CallModel>> {
        let (page, perPage, usingCache) = (dto.page, dto.perPage, dto.usingCache)
        
        let input = API.GetCallListInput(page: page, perPage: perPage)
        input.usingCache = usingCache
        
        return API.shared.getCallList(input).map({ PagingInfo(page: 1, items: $0) })
    }
}
