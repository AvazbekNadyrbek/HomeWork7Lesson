//
//  bigImgView.swift
//  HomeWork7Lesson
//
//  Created by Авазбек Надырбек уулу on 21.05.25.
//

import UIKit

class ImgView: UIImageView {
    init(image: UIImage?, cornerRadius: CGFloat = 10) {
        super.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
