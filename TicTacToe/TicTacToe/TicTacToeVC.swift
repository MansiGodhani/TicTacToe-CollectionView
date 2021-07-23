//
//  TicTacToeVC.swift
//  TicTacToe
//
//  Created by DCS on 17/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController {
    
    private var state = [2,2,2,2,
                         2,2,2,2,
                         2,2,2,2,
                         2,2,2,2]
    
    public var player1 = 0,player2 = 0
    
    private let winningCombinations = [[0, 1, 2, 3], [4, 5 ,6 ,7], [8 ,9 ,10 ,11],[12 ,13 ,14 ,15], [0, 4, 8 ,12], [1, 5, 6, 7], [2, 6, 10, 14], [12, 13, 14, 15], [0, 5, 10, 15], [3, 6, 9, 12]]
    
    private var zeroFlag = false
    
    private let myBackgroundImg: UIImageView = {
        let myImageView = UIImageView()
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        myImageView.image = UIImage(named: "bgimg")
        return myImageView
        
    }()
    
    private let TicTacToeLabel:UILabel = {
        
        let myLabel = UILabel()
        myLabel.text = "Tic-Tac-Toe"
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.backgroundColor = .clear
        myLabel.font = .boldSystemFont(ofSize: 30)
        return myLabel
    }()
    
    private let turntitleLabel:UILabel = {
        let label = UILabel()
        label.text = " Turn : "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    private let turnLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    private let Player1Label:UILabel = {
        
        let myLabel = UILabel()
        myLabel.text = "Player 1(X)"
        myLabel.textColor = .red
        myLabel.textAlignment = .center
        myLabel.backgroundColor = .clear
        myLabel.font = .boldSystemFont(ofSize: 18)
        
        return myLabel
    }()
    private let myLableVs:UILabel = {
        
        let myLabel = UILabel()
        myLabel.text = "Vs"
        myLabel.textColor = .white
        myLabel.textAlignment = .center
        myLabel.backgroundColor = .clear
        myLabel.font = .boldSystemFont(ofSize: 20)
        return myLabel
    }()
    
    private let Player2Label:UILabel = {
        
        let myLabel = UILabel()
        myLabel.text = "Player 2(O)"
        myLabel.textColor = .blue
        myLabel.textAlignment = .center
        myLabel.backgroundColor = .clear
        myLabel.font = .boldSystemFont(ofSize: 18)
        return myLabel
    }()
    
    private let player1_score : UITextView = {
        
        let textView = UITextView()
        textView.text = ""
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.textColor = .red
        textView.isEditable = false
        textView.font = .boldSystemFont(ofSize: 18)
        return textView
    }()
    
    private let player2_score : UITextView = {
        
        let textView = UITextView()
        textView.text = ""
        textView.textAlignment = .center
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.font = .boldSystemFont(ofSize: 18)
        textView.textColor = .blue
        
        return textView
    }()
    
   
    
    private let myCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 120, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 80, height: 80)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myCollectionView.backgroundView = myBackgroundImg
        view.addSubview(myBackgroundImg)
        view.addSubview(myCollectionView)
        view.addSubview(TicTacToeLabel)
        view.addSubview(turntitleLabel)
        view.addSubview(turnLabel)
        view.addSubview(Player1Label)
        view.addSubview(myLableVs)
        view.addSubview(Player2Label)
        player1_score.text = String(player1)
        player2_score.text = String(player2)
        view.addSubview(player1_score)
        view.addSubview(player2_score)
        
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myCollectionView.frame = view.bounds
        TicTacToeLabel.frame = CGRect(x: 0, y: 90, width: view.width, height: 40)
        turntitleLabel.frame = CGRect(x: 15, y: TicTacToeLabel.bottom + 10, width: view.width - 70, height: 20)
        turnLabel.frame = CGRect(x: 50, y: TicTacToeLabel.bottom + 10, width: view.width - 40, height: 20)
        Player1Label.frame = CGRect(x: 20, y: view.height - 110, width: 100, height: 40)
        myLableVs.frame = CGRect(x: 180, y: view.height - 110, width: 30, height: 40)
        Player2Label.frame = CGRect(x: 260, y: view.height - 110, width: 100, height: 40)
        player1_score.frame = CGRect(x: 20, y: Player1Label.bottom + 3, width: 100, height: 40)
        player2_score.frame = CGRect(x: 260, y: Player2Label.bottom + 3, width: 100, height: 40)
        
    }
    
}

extension TicTacToeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    private func setupCollectionView() {
        myCollectionView.register(T4Cell.self, forCellWithReuseIdentifier: "t4cell")
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "t4cell", for: indexPath) as! T4Cell
        cell.setupCell(with: state[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if state[indexPath.row] != 0 && state[indexPath.row] != 1 {
            state.remove(at: indexPath.row)
            
            if zeroFlag {
                turnLabel.text = "X"
                turnLabel.textColor = .red
                state.insert(0, at: indexPath.row)
            } else {
                turnLabel.text = "O"
                turnLabel.textColor = .blue
                state.insert(1, at: indexPath.row)
            }
            
            zeroFlag = !zeroFlag
            collectionView.reloadData()
            checkWinner()
        }

    }
    
    private func checkWinner() {
        
        if !state.contains(2) {
            let alert = UIAlertController(title: "Game over!", message: "Draw. Try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { [weak self] _ in
                self?.resetState()
            }))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        for i in winningCombinations {
            
            if state[ i[0] ] == state[ i[1] ] && state[ i[1] ] == state[ i[2] ] && state[ i[2] ] == state[ i[3] ] && state[ i[0] ] != 2 {
                announceWinner(player: state[ i[0] ] == 0 ? "O" : "X")
                break
            }
        }
    }
    
    private func announceWinner(player: String) {
//        let alert = UIAlertController(title: "Game over!", message: "\(player) won", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { [weak self] _ in
//            self?.resetState()
//        }))
//        DispatchQueue.main.async {
//            self.present(alert, animated: true, completion: nil)
//        }
        if player == "X"
        {
            player1+=1
            player1_score.text = String(player1)
            
            let alert = UIAlertController(title: "Game Over!", message: "Player 1 won", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { [weak self] _ in
                self?.resetState()
            }))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        else
        {
            player2+=1
            player2_score.text = String(player2)
            
            let alert = UIAlertController(title: "Game Over!", message: "Player 2 won", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { [weak self] _ in
                self?.resetState()
            }))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func resetState() {
        state = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
        zeroFlag = false
        myCollectionView.reloadData()
    }
}
