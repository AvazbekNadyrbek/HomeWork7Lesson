//
//  HorizontalView.swift
//  HomeWork7Lesson
//
//  Created by Авазбек Надырбек уулу on 21.05.25.
//

import UIKit

class HorizontalView: UIStackView {
    
    init(spacing: CGFloat?) {
        super.init(frame: .zero)
        axis = .horizontal
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .fillEqually
        self.spacing = spacing ?? 0.0
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
