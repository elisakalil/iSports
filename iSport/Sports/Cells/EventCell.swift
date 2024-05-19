//
//  EventCell.swift
//  iSport
//
//  Created by Elisa Kalil on 18/05/24.
//

import UIKit

class EventCell: UICollectionViewCell {
    static let identifier = "EventCell"
    var actualEventTime: Int = 0
    private var timer: Timer?
    
    var isFavorited: Bool = false {
        didSet {
            updateStarIcon()
        }
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Error"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Error"
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        timer?.invalidate()
    }
    
    // MARK: - Private Methods

    private func setupSubviews() {
        contentView.addSubview(imageView)
        contentView.addSubview(stackView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        
        stackView.addArrangedSubview(starIcon)
        stackView.addArrangedSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            starIcon.widthAnchor.constraint(equalToConstant: 15),
            starIcon.heightAnchor.constraint(equalToConstant: 15),
            
            firstLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 4),
            firstLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 2),
            secondLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        let starTapGesture = UITapGestureRecognizer(target: self, action: #selector(starTapped))
        starIcon.isUserInteractionEnabled = true
        starIcon.addGestureRecognizer(starTapGesture)
    }
    
    private func updateStarIcon() {
        let starImage = isFavorited ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        starIcon.image = starImage?.withRenderingMode(.alwaysTemplate)
        starIcon.tintColor = isFavorited ? .systemYellow : .gray
    }
    
    private func updateTimeStamp() {
        let currentTime = Int(Date().timeIntervalSince1970)
        let remainTimeEvent = actualEventTime - currentTime
        timeLabel.text = remainTimeEvent.unixTimeToHHMMSS()
    }
    
    @objc private func starTapped() {
        isFavorited.toggle()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimeLabel() {
        updateTimeStamp()
    }
    
    // MARK: - Public Methods

    public func configure(
        image: UIImage?,
        eventTime: Int,
        firstTitle: String,
        secondTitle: String,
        isFavorited: Bool
    ) {
        actualEventTime = eventTime
        imageView.image = image
        firstLabel.text = firstTitle
        secondLabel.text = secondTitle
        self.isFavorited = isFavorited
        
        contentView.backgroundColor = .systemBackground
        updateTimeStamp()
        startTimer()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        timer?.invalidate()
        timer = nil
    }
}
