//
//  EmptyDataView.swift
//  todo-app
//
//  Created by Lê Trần Trọng Tín on 07/08/2022.
//

import UIKit
import Reusable

final class EmptyDataView: UIView, NibOwnerLoadable {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNibContent()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibContent()
    }

}
