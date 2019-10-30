//
//  SnakeHead.swift
//  Snake
//
//  Created by Marat Mikaelyan on 30/09/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import UIKit
class SnakeHead: SnakeBodyPart {
    override init(atPoint point: CGPoint){
        super.init(atPoint:point)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
