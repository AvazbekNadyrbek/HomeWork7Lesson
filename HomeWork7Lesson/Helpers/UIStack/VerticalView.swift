//
//  VerticalStackView.swift
//  HomeWork7Lesson
//
//  Created by Авазбек Надырбек уулу on 21.05.25.
//

import UIKit

class VerticalView: UIStackView {
    
    init(spacing: CGFloat? = 0) {
        super.init(frame: .zero)
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
        distribution = .equalSpacing
        self.spacing = spacing ?? 0.0
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
