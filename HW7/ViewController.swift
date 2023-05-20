//
//  ViewController.swift
//  HW7
//
//  Created by Nikolai  on 20.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    var label: UILabel!
    var headerImageView: UIView!
    var imageView: UIImageView!
    var testArray: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testArray.append(0.0)
        setupScrollView()
        setupContentView()
        setupHeader()
        setupImageView()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.indicatorStyle = .black
        scrollView.delegate = self
        scrollView.contentInsetAdjustmentBehavior = .never
        
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        scrollView.verticalScrollIndicatorInsets.top = 270
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setupHeader() {
        headerImageView = UIView()
        headerImageView.backgroundColor = .red
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(headerImageView)
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        let headerImageViewBottom : NSLayoutConstraint!
        headerImageViewBottom = self.headerImageView.bottomAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0)
        headerImageViewBottom.priority = UILayoutPriority(rawValue: 900)
        headerImageViewBottom.isActive = true
    }
    
    func setupImageView() {
        imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "orange")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        headerImageView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.headerImageView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.headerImageView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.headerImageView.bottomAnchor)
        ])
        
        let imageViewTopConstraint: NSLayoutConstraint!
        imageViewTopConstraint = self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor)
        imageViewTopConstraint.priority = UILayoutPriority(rawValue: 900)
        imageViewTopConstraint.isActive = true
    }
    
    func setupContentView() {
        contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 270),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 2000)
        ])
        
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= 0.0 {
            let currentValue = scrollView.contentOffset.y
            var valueToMoveIndicator = 0.0
            testArray.append(currentValue)
            valueToMoveIndicator = testArray[0] - testArray[1]
            
            scrollView.verticalScrollIndicatorInsets.top += valueToMoveIndicator
            testArray.remove(at: 0)
        }
    
    }
    
}

