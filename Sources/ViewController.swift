import UIKit

class ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Theos! 🚀"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Built with Swift & Theos"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.text = "Taps: 0"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tapButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tap Me!", size: .large)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", size: .large)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        return button
    }()
    
    private var tapCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(counterLabel)
        view.addSubview(tapButton)
        view.addSubview(resetButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapButton.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: 40),
            tapButton.widthAnchor.constraint(equalToConstant: 200),
            tapButton.heightAnchor.constraint(equalToConstant: 56),
            
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: tapButton.bottomAnchor, constant: 20),
            resetButton.widthAnchor.constraint(equalToConstant: 150),
            resetButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc private func buttonTapped() {
        tapCount += 1
        counterLabel.text = "Taps: \(tapCount)"
        
        // Animation effect
        UIView.animate(withDuration: 0.1, animations: {
            self.tapButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.tapButton.transform = .identity
            }
        }
        
        // Change color based on count
        if tapCount % 10 == 0 {
            view.backgroundColor = UIColor(
                red: CGFloat.random(in: 0.8...1.0),
                green: CGFloat.random(in: 0.8...1.0),
                blue: CGFloat.random(in: 0.8...1.0),
                alpha: 1.0
            )
        }
    }
    
    @objc private func resetTapped() {
        tapCount = 0
        counterLabel.text = "Taps: 0"
        view.backgroundColor = .white
        
        // Animation effect
        UIView.animate(withDuration: 0.2, animations: {
            self.resetButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.resetButton.transform = .identity
            }
        }
    }
}