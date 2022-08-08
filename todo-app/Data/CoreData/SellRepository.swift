//
//  SellRepository.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import MagicalRecord
import RxSwift

protocol SellRepository: CoreDataRepository {
   
}

extension SellRepository where Self.ModelType == SellModel, Self.EntityType == CDSell {
    func getSells() -> Observable<[SellModel]> {
        return all()
    }
    
    func add(dto: AddSellDto) -> Observable<Void> {
        guard let sells = dto.sells else { return Observable.empty() }
        return addAll(sells)
    }
    
    static func map(from item: SellModel, to entity: CDSell) {
        entity.id = Int16(item.id)
        entity.name = item.name
        entity.price = Int64(item.price)
        entity.quantity = Int16(item.quantity)
        entity.type = Int16(item.type)
    }
    
    static func item(from entity: CDSell) -> SellModel? {
        return SellModel(
            id: Int(entity.id),
            name: entity.name ?? "",
            price: Int(entity.price),
            quantity: Int(entity.quantity),
            type: Int(entity.type)
        )
    }
}
