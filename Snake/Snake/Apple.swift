//
//  Apple.swift
//  Snake
//
//  Created by Marat Mikaelyan on 30/09/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import UIKit
import SpriteKit
// Яблоко
class Apple: SKShapeNode {
    //определяем, как оно будет отрисовываться
    convenience init(position: CGPoint) {
        self.init()
        let scheme = GameScene.colorScheme.scheme
        // рисуем круг
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        // заливаем красным
        fillColor = scheme.apple
        // рамка тоже красная
        strokeColor = scheme.apple
        // ширина рамки 5 поинтов
        lineWidth = 5
        self.position = position

        // Добавляем физическое тело, совпадающее с изображением яблока
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center:CGPoint(x:5, y:5))
        // Категория - яблоко
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple
    }
}
