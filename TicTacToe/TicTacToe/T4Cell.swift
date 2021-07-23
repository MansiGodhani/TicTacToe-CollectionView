//
//  T4Cell.swift
//  TicTacToe
//
//  Created by DCS on 17/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class T4Cell: UICollectionViewCell {
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .purple
        return imageView
    }()
    
    func setupCell(with status:Int) {
        
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        contentView.addSubview(myImageView)
        
        myImageView.frame = CGRect(x: 10, y: 10, width: 60, height: 60)
        
        let name = status == 0 ? "circle" : status == 1 ? "multiple" : ""
        
        myImageView.image = UIImage(named : name)
        
        
    }
    
}
