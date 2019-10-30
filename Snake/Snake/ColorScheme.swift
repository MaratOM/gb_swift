//
//  ColorScheme.swift
//  Snake
//
//  Created by Marat Mikaelyan on 01/10/2019.
//  Copyright © 2019 Marat Mikaelyan. All rights reserved.
//

import SpriteKit
import GameplayKit

struct ColorScheme {
    var background: SKColor
    var apple: UIColor
    var snake: UIColor
    
    init(background: SKColor, apple: UIColor, snake: UIColor) {
        self.background = background
        self.apple = apple
        self.snake = snake
    }
}

let darkColorScheme = ColorScheme(background: SKColor.black, apple: UIColor.red, snake: UIColor.green)
let lightColorScheme = ColorScheme(background: SKColor.white, apple: UIColor.yellow, snake: UIColor.blue)

enum ColorSchemeSwitch {
    case dark
    case light
    case defaultScheme
    
    var scheme: ColorScheme {
        switch self {
        case .dark:
            return darkColorScheme
        case .light:
            return lightColorScheme
        case .defaultScheme:
            return lightColorScheme
        }
    }
}
