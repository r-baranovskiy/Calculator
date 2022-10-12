

import UIKit

class MainViewController: UIViewController {
    
    private let mainStackView = MainStackView()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 60)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .white
        label.textAlignment = .right
        label.minimumScaleFactor = 0.3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStackView.delegate = self
        
        setupView()
        setConstraints()
        
    }
    
    private func setupView() {
        view.backgroundColor = .black
        view.addSubview(mainStackView)
        view.addSubview(resultLabel)
    }
}

extension MainViewController: MainStackViewProtocol {
    func tapNumberButton(tag: Int) {
        print(tag)
    }
    
    func tapActionButton(tag: Int) {
        print(tag)
    }
    
    
}

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1),
            
            resultLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -10),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}

