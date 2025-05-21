//
//  BtnView.swift
//  HomeWork7Lesson
//
//  Created by Авазбек Надырбек уулу on 21.05.25.
//

import UIKit

class BtnView: UIButton {
    
    init(title: String? = "show details") {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        self.backgroundColor = .black
        self.layer.cornerRadius = 25
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
