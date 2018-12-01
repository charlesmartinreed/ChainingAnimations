//
//  ViewController.swift
//  ChainingAnimations
//
//  Created by Charles Martin Reed on 11/30/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Setup the UI to contain two labels
    let headerLabel = UILabel()
    let flavorTextLabel = UILabel()
    var labelsStackView = UIStackView()
    
    fileprivate func setupLabels() {
        //label properties
        headerLabel.font = UIFont(name: "Futura", size: 40)
        headerLabel.numberOfLines = 0
        headerLabel.text = "Welcome to my application!"
        headerLabel.tag = 0
        
        flavorTextLabel.font = UIFont(name: "Futura", size: 24)
        flavorTextLabel.numberOfLines = 0
        flavorTextLabel.text = "If you're able to read this then I was able to code this properly. Hooray for base-level competence! Coming soon to an app store near you, of course."
        flavorTextLabel.tag = 1
    }
    
    fileprivate func setupStackView() {
        //create a stackview to hold the UI elements
        labelsStackView = UIStackView(arrangedSubviews: [headerLabel, flavorTextLabel])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 8
        view.addSubview(labelsStackView) //needs to be placed BEFORE constraints added
        
        //position stackView in center of view using AutoLayout
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false //enables autolayout
        labelsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        labelsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true //fixes out-of-boundary issue, 50px of padding on the left and right side each
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupStackView()
        
        //click anywhere in the view
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(funAnimation)))
    }
    
    @objc func funAnimation() {
        //making a chain by translating to the left, then translating to the top
        var delay = 0.5
        
        labelsStackView.arrangedSubviews.forEach { (subview) in
            if subview.tag != 0 {
                delay += 0.5 //should be a delay of 0.0 for the inital call
            }
            
            UIView.animate(withDuration: 1.5, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: .curveEaseOut, animations: {
                subview.transform = CGAffineTransform(translationX: -30, y: 0)
                subview.transform = subview.transform.translatedBy(x: 0, y: -200)
            }) { (_) in
                //subview.alpha = 0
                UIView.animate(withDuration: 0.5, animations: {
                    subview.alpha = 0
                })
            }
        }
    }

}

