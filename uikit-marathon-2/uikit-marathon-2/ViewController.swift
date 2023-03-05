//
//  ViewController.swift
//  uikit-marathon-2
//
//  Created by Timur Taneev on 04.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var button1: AnimatedButton!
    @IBOutlet private weak var button2: AnimatedButton!
    @IBOutlet private weak var button3: AnimatedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Конфигурируем общие свойства всех трех кнопок
        // Различаем только title
        [
            "First": button1,
            "Second Long Titled Button": button2,
            "Third button": button3
        ].forEach{(title: String, button: AnimatedButton) in
            // конфигурация кнопок
            button.configAnimatedButton(title:title)
            // Добавляем обработчики нажатий
            button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
            button.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        }
        button3.presentView = true // Включаем показ контроллера для третьей кнопки
    }

    @objc func buttonTouchDown(sender: AnimatedButton) {
        sender.buttonAnimationDown()
    }
    
    @objc func buttonTouchUpInside(sender: AnimatedButton) {
        sender.buttonAnimationBack()
        // Показываем модальный контроллер
        if sender.presentView {
            let newViewController = NewViewController()
            newViewController.view.backgroundColor = .white
            self.present(newViewController, animated: true)
        }
    }
    
}

class NewViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class AnimatedButton: UIButton {
    
    var presentView: Bool = false

    func buttonAnimationDown() {
        // Анимация уменьшения размера кнопки, взаимодействие с кнопкой разрешено
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .allowUserInteraction,
            animations: {self.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)}
        )
    }
    
    func buttonAnimationBack() {
        // Анимация возвращения размера кнопки в исходное состояние, взаимодействие с кнопкой разрешено
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .allowUserInteraction,
            animations: {self.transform = CGAffineTransform.identity}
        )
    }
    
    func configAnimatedButton(title: String) {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.baseBackgroundColor = .systemBlue
        // Текст + иконка
        buttonConfiguration.title = title
        buttonConfiguration.image = UIImage(systemName: "folder.circle")
        buttonConfiguration.imagePlacement = .trailing
        // Отступы
        // 1. Текст от иконки
        buttonConfiguration.imagePadding = CGFloat(CGFloat(8))
        // 2. Границы кнопки от контента (10 по вертикали, 14 по горизонтали)
        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 14,
            bottom: 10,
            trailing: 14)
        self.configuration = buttonConfiguration
    }
}
