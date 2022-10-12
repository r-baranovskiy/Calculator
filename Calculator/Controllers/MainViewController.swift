

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Constants
    
    private let mainStackView = MainStackView()
    private let calculationModel = CalculationModel()
    
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
    
    //MARK: - Lifecycles
    
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

//MARK: - Extensions

extension MainViewController: MainStackViewProtocol {
    func tapNumberButton(tag: Int) {
        calculationModel.setNumber(number: tag)
        resultLabel.text = calculationModel.getCurrentNumber()
    }
    
    func tapActionButton(tag: Int) {
        switch tag {
        case 10: // .
            print(10)
        case 11: // =
            resultLabel.text = calculationModel.getResult()
        case 12: // +
            calculationModel.setOperation(operation: .addition)
        case 13: // -
            calculationModel.setOperation(operation: .substraction)
        case 14: // x
            calculationModel.setOperation(operation: .multiplication)
        case 15: // /
            calculationModel.setOperation(operation: .division)
        case 16: // %
            print(16)
        case 17: // +/-
            print(17)
        case 18: // AC
            calculationModel.resetValues()
            resultLabel.text = "0"
        default:
            print("error tag")
        }
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

