//
//  ViewController.swift
//  uikit-marathon-2
//
//  Created by Тимур Танеев on 04.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var button1: UIButton!
    @IBOutlet private weak var button2: UIButton!
    @IBOutlet private weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Конфигурируем общие свойства всех трех кнопок
        // Различаем только title
        [
            "First": button1,
            "Second Long Titled Button": button2,
            "Third button": button3
        ].forEach{
            configAnimatedButton(button: $0.value, title:$0.key)
        }

    }
    
    private func configAnimatedButton(button: UIButton, title: String) {
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
        button.configuration = buttonConfiguration
        
        // Добавляем обработчики нажатий
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    }
    
    @objc func buttonTouchDown(sender: UIButton) {
        // Анимация уменьшения размера кнопки, взаимодействие с кнопкой разрешено
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .allowUserInteraction,
            animations: {sender.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)}
        )
    }
    
    @objc func buttonTouchUpInside(sender: UIButton) {
        // Анимация возвращения размера кнопки в исходное состояние, взаимодействие с кнопкой разрешено
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .allowUserInteraction,
            animations: {sender.transform = CGAffineTransform.identity}
        )
    }
    
}

//class AnimatedButton: UIButton {

//    func configAnimatedButton(title: String) {

//    }
//}
