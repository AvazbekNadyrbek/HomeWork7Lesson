//
//  SecondViewController.swift
//  HomeWork7Lesson
//
//  Created by Авазбек Надырбек уулу on 21.05.25.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK: - Public
    private let model: DataModel        // <-- injected model

    // Convenience initializer -----------------------------------
    init(model: DataModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - UI -------------------------------------------------
    private lazy var scrollView: UIScrollView = {
        $0.backgroundColor = .gray
        $0.contentInsetAdjustmentBehavior = .never
        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.delegate = self
        $0.addSubview(scrollViewContent)
        return $0
    }(UIScrollView())
    
    private lazy var titleMain = TextView(text: model.textTitle, font: .boldSystemFont(ofSize: 20), color: .black)
    private lazy var dataTitle = TextView(text: "20/05/2025", font: .systemFont(ofSize: 15), color: .black)
    
    private lazy var descpTitle = TextView(text: model.bigdescription ?? "Empty", font: .systemFont(ofSize: 15), color: .black)
    private lazy var imgMain = ImgView(image: UIImage(named: model.bigImg))
    
    private lazy var scrollViewContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.addSubview(imgMain)
        $0.addSubview(titleMain)
        $0.addSubview(dataTitle)
        $0.addSubview(descpTitle)
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        setupUI()
    }
    
    func setupUI() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imgMain.topAnchor.constraint(equalTo: scrollViewContent.topAnchor, constant: 70),
            imgMain.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 20),
            imgMain.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            imgMain.heightAnchor.constraint(equalToConstant: 150),
            
            
            titleMain.topAnchor.constraint(equalTo: imgMain.bottomAnchor, constant: 20),
            titleMain.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 20),
            titleMain.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            
            dataTitle.topAnchor.constraint(equalTo: imgMain.bottomAnchor, constant: 25),
            dataTitle.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            
            descpTitle.topAnchor.constraint(equalTo: titleMain.bottomAnchor, constant: 20),
            descpTitle.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 20),
            descpTitle.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            descpTitle.bottomAnchor.constraint(equalTo: scrollViewContent.bottomAnchor, constant: -20),
            
        ])
    }
}

#Preview {
    SecondViewController(model: DataModel(textTitle: "Имя Фамилия 1", textDescription: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", bigImg: "bigImg1", smallImg1: "smallImg11", smallImg2: "smallImg12", smallImg3: "smallImg13"))
}
