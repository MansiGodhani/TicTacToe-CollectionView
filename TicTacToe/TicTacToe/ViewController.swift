//
//  ViewController.swift
//  TicTacToe
//
//  Created by DCS on 17/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Hey! Welcome"
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.textColor = .red
        return label
    }()
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "titlteimg")
        return imageView
    }()
    
    private let myLabel2:UILabel = {
        let label = UILabel()
        label.text = "Play With Your Friend"
        label.textAlignment = .center
        label.font = label.font.withSize(18)
        label.textColor = .blue
        return label
    }()
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Let's Play", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = TicTacToeVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        
        //title = "Start Game"
        view.addSubview(myLabel)
        view.addSubview(myImageView)
        view.addSubview(myLabel2)
        view.addSubview(myButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: 160, width: view.width - 40, height: 20)
        myImageView.frame = CGRect(x: 20, y: myLabel.bottom + 20, width: view.width - 40, height: 240)
        myLabel2.frame = CGRect(x: 20, y: myImageView.bottom + 20, width: view.width - 40, height: 20)
        myButton.frame = CGRect(x: 50, y: myLabel2.bottom + 20, width: view.width - 100, height: 35)
    }
}

