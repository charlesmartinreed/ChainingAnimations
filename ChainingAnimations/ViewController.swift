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
    
    fileprivate func setupLabels() {
        //label properties
        headerLabel.font = UIFont(name: "Futura", size: 40)
        headerLabel.numberOfLines = 0
        headerLabel.text = "Welcome to my application!"
        
        flavorTextLabel.font = UIFont(name: "Futura", size: 24)
        flavorTextLabel.numberOfLines = 0
        flavorTextLabel.text = "If you're able to read this then I was able to code this properly. Hooray for base-level competence! Coming soon to an app store near you, of course."
    }
    
    fileprivate func setupStackView() {
        //create a stackview to hold the UI elements
        let labelsStackView = UIStackView(arrangedSubviews: [headerLabel, flavorTextLabel])
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
        //funAnimations()
        
        //click anywhere in the view
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(funAnimations)))
    }
    
    @objc func funAnimations(gesture: UITapGestureRecognizer) {
        //making a chain by translating to the left, then translating to the top
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.headerLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            //our second animation
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.headerLabel.alpha = 0 //fade the label out
                self.headerLabel.transform = self.headerLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        
        //obviously needs a refactor - flavorTextLabel
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.flavorTextLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            //our second animation
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.flavorTextLabel.alpha = 0 //fade the label out
                self.flavorTextLabel.transform = self.flavorTextLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
    }

}

