//
//  CallListUseCase.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import RxSwift
import MGArchitecture

protocol CallListUseCaseType {
    func getCallList(page: Int) -> Observable<PagingInfo<CallModel>>
}

struct CallListUseCase: CallListUseCaseType, GettingCallList {
    let callGateway: CallGatewayType
    
    func getCallList(page: Int) -> Observable<PagingInfo<CallModel>> {
        return getCallList(dto: GetPageDto(page: page, perPage: 10, usingCache: false))
    }
}
