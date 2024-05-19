//
//  SportHeaderView.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//
import UIKit

class SportHeaderView: UIView {
    
    private lazy var button: UIImageView = {
        let image = UIImage(named: "chevron")
        let button = UIImageView(image: image)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    public func setImageAnimated(to image: UIImage?) {
        UIView.transition(with: button, duration: 0.8, options: .transitionCrossDissolve, animations: {
            self.button.image = image
        }, completion: nil)
    }
}

