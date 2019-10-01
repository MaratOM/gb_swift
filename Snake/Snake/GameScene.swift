import SpriteKit
import GameplayKit
class GameScene: SKScene {
    // наша змея
    var snake: Snake?
    var apple: Apple?
    static var colorScheme: ColorSchemeSwitch = .defaultScheme
    // вызывается при первом запуске сцены
    override func didMove(to view: SKView) {
        GameScene.colorScheme = .dark
        // цвет фона сцены
        backgroundColor = GameScene.colorScheme.scheme.background
        // вектор и сила гравитации
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        // добавляем поддержку физики
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        // выключаем внешние воздействия на игру
        self.physicsBody?.allowsRotation = false
        // включаем отображение отладочной информации
        view.showsPhysics = true
        self.physicsWorld.contactDelegate = self
        // устанавливаем категорию взаимодействия с другими объектами
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        // устанавливаем категории, с которыми будут пересекаться края сцены
        self.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
        
        createButtons()
        createApple()
        createSnake()
    }
    // вызывается при нажатии на экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // перебираем все точки, куда прикоснулся палец
        for touch in touches {
            // определяем координаты касания для точки
            let touchLocation = touch.location(in: self)
            // проверяем, есть ли объект по этим координатам, и если есть, то не наша ли это кнопка
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            // если это наша кнопка, заливаем ее зеленым
            touchedNode.fillColor = .green
            // определяем, какая кнопка нажата, и поворачиваем в нужную сторону
            if touchedNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            } else if touchedNode.name == "clockwiseButton" {
                snake!.moveClockwise()
            }
        }
    }
    // вызывается при прекращении нажатия на экран
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // повторяем все то же самое для действия, когда палец отрывается от экрана
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            // но делаем цвет снова серым
            touchedNode.fillColor = UIColor.gray
        }
    }
    // вызывается при обрыве нажатия на экран, например, если телефон примет звонок и свернет приложение
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    // вызывается при обработке кадров сцены
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    
    func createButtons(){
        let clockwiseButton = Button(position: CGPoint(x: (view?.scene!.frame.maxX)!-80, y: (view?.scene!.frame.minY)!+30), name: "clockwiseButton")
        self.addChild(clockwiseButton)
        let counterClockwiseButton = Button(position: CGPoint(x: (view?.scene!.frame.minX)!+30, y: (view?.scene!.frame.minY)!+30), name: "counterClockwiseButton")
        self.addChild(counterClockwiseButton)
    }

    func createApple(){
        // Случайная точка на экране
        let randX  = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX-5)) + 1)
        let randY  = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY-5)) + 1)
        // Создаем яблоко
        apple = Apple(position: CGPoint(x: randX, y: randY))
        // Добавляем яблоко на сцену
        self.addChild(apple!)
    }
    
    func createSnake(){
        // создаем змею по центру экрана и добавляем ее на сцену
        snake = Snake(atPoint: CGPoint(x: view?.scene!.frame.midX ?? 100, y: view?.scene!.frame.midY ?? 100))
        self.addChild(snake!)
    }
    
    func restartGame() {
        apple?.removeFromParent()
        snake?.removeFromParent()
        createApple()
        createSnake()
    }
}

// Имплементируем протокол
extension GameScene: SKPhysicsContactDelegate {
    // Добавляем метод отслеживания начала столкновения
    func didBegin(_ contact: SKPhysicsContact) {
        // логическая сумма масок соприкоснувшихся объектов
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        // вычитаем из суммы голову змеи, и у нас остается маска второго объекта
        let collisionObject = bodyes ^ CollisionCategories.SnakeHead
        // проверяем, что это за второй объект
        switch collisionObject {
        case CollisionCategories.Apple: // проверяем, что это яблоко
            // яблоко – это один из двух объектов, которые соприкоснулись. Используем тернарный оператор, чтобы вычислить, какой именно
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            // добавляем к змее еще одну секцию
            snake?.addBodyPart()
            // удаляем съеденное яблоко со сцены
            apple?.removeFromParent()
            // создаем новое яблоко
            createApple()
        case CollisionCategories.EdgeBody:
            restartGame()
        break
        default:
            break
        }
    }
}

// Категория пересечения объектов
struct CollisionCategories{
    // Тело змеи
    static let Snake: UInt32 = 0x1 << 0
    // Голова змеи
    static let SnakeHead: UInt32 = 0x1 << 1
    // Яблоко
    static let Apple: UInt32 = 0x1 << 2
    // Край сцены (экрана)
    static let EdgeBody: UInt32 = 0x1 << 3
}

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


