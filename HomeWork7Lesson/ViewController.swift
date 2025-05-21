import UIKit

protocol ControllerProtocol: AnyObject {
    func setupUI()
}

protocol ViewControllerDelegate: ControllerProtocol {
    var scrollView: UIScrollView { get set }
    var scrollViewContent: UIView { get set }
}

class ViewController: UIViewController, ViewControllerDelegate {
    
    lazy var scrollViewContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = true
        $0.backgroundColor = .white
        $0.delegate = self
        return $0
    }(UIScrollView())
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addCards()
    }
    
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            // Расположение самого scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Контент (stackView) – к contentLayoutGuide
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: 10),
            
            // Ширина контента – к видимой ширине scrollView
            stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -40)
        ])
    }
    
    private func addCards() {
        let cards = DataModel.mocData1()
        
        cards.forEach { data in
            let cardView = CardView(data: data)
            addChild(cardView)
            stackView.addArrangedSubview(cardView.view)
            cardView.didMove(toParent: self)
        }
    }
    
    private func addCardsUIView() {
        let cards = DataModel.mocData1()
        
        cards.forEach { data in
            let cardView = CardView(data: data)
            addChild(cardView)
            stackView.addArrangedSubview(cardView.view)
            cardView.didMove(toParent: self)
        }
    }
}
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}

#Preview {
    ViewController()
}
