//
//  CardView.swift
//  HomeWork7Lesson
//
//  Created by Авазбек Надырбек уулу on 21.05.25.
//

import UIKit

class CardView: UIViewController {
    
    var dataInCard: DataModel
    
    init(data: DataModel) {
        self.dataInCard = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var uiViewMain: UIView = {
        $0.backgroundColor = .systemFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        return $0
    }(UIView())
    
    lazy var textTitle = TextView(text: dataInCard.textTitle)
    lazy var descrTitle = TextView(text: dataInCard.textDescription)

    
    lazy var bigImg = ImgView(image: UIImage(named: dataInCard.bigImg), cornerRadius: 20)
    
    lazy var smallImg1 = ImgView(image: UIImage(named: dataInCard.smallImg1), cornerRadius: 20)
    lazy var smallImg2 = ImgView(image: UIImage(named: dataInCard.smallImg2), cornerRadius: 20)
    lazy var smallImg3 = ImgView(image: UIImage(named: dataInCard.smallImg3), cornerRadius: 20)
    
    lazy var mainBtn = BtnView()
             
    lazy var horizontalStackView = HorizontalView(spacing: 15)
    
    
    lazy var verticalStackView = VerticalView(spacing: 15)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Configure button & action
        mainBtn.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        
        view.addSubview(uiViewMain)
        uiViewMain.addSubview(verticalStackView)
        uiViewMain.addSubview(textTitle)
        uiViewMain.addSubview(descrTitle)
        
        verticalStackView.addArrangedSubview(bigImg)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(mainBtn)
        
        
    
        horizontalStackView.addArrangedSubview(smallImg1)
        horizontalStackView.addArrangedSubview(smallImg2)
        horizontalStackView.addArrangedSubview(smallImg3)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            uiViewMain.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            uiViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            uiViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            uiViewMain.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            verticalStackView.topAnchor.constraint(equalTo: uiViewMain.topAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: uiViewMain.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: uiViewMain.trailingAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: uiViewMain.bottomAnchor, constant: -20),

            textTitle.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 55),
            textTitle.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 20),
            textTitle.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -20),

            descrTitle.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: 10),
            descrTitle.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 20),
            descrTitle.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: -20),

            mainBtn.heightAnchor.constraint(equalToConstant: 50),
           
        ])
    }

    // MARK: - Navigation
    @objc private func showDetails() {
        let vc = SecondViewController(model: dataInCard)   // <- pass the same model

        // Prefer a navigation push; fall back to modal if no nav-stack
        if let nav = navigationController {
            nav.pushViewController(vc, animated: true)
        } else {
            present(vc, animated: true)
        }
    }
}

#Preview {
    CardView(data: DataModel.mocData1().first!)
}
