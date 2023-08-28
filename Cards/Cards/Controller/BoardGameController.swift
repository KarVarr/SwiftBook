//
//  BoardGameController.swift
//  Cards
//
//  Created by Karen Vardanian on 28.08.2023.
//

import UIKit

class BoardGameController: UIViewController {
    var cardsPairsCounts = 8
    lazy var game: Game = getNewGame()
    
    lazy var startButtonView = getStartButtonView()
    lazy var boardGameView = getBoardGameView()
    
    
    override func loadView() {
        super.loadView()
        view.addSubview(startButtonView)
        view.addSubview(boardGameView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    private func getBoardGameView() -> UIView {
        let margin: CGFloat = 10
        let boardView = UIView()
        
        boardView.frame.origin.x = margin
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        boardView.frame.origin.y = topPadding + startButtonView.frame.height +
        margin
        boardView.frame.size.width = UIScreen.main.bounds.width - margin*2
        
        let bottomPadding = window.safeAreaInsets.bottom
        boardView.frame.size.height = UIScreen.main.bounds.height - boardView.frame.origin.y - margin - bottomPadding
        
        boardView.layer.cornerRadius = 5
        boardView.backgroundColor = UIColor(red: 0.1, green: 0.9, blue: 0.1,
                                            alpha: 0.3)
        return boardView
    }
    
    
    
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairsCounts
        game.generateCards()
        return game
        
    }
    
    private func getStartButtonView() -> UIButton { // 1
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        //        let window = UIApplication.shared.windows[0] depricated
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            let topPadding = window.safeAreaInsets.top
            button.frame.origin.y = topPadding
        }
        button.center.x = view.center.x
        button.setTitle("Начать игру", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 10
        
        button.addTarget(nil, action: #selector(startGame(_:)), for: .touchUpInside)
        //        button.addAction(UIAction(handler: { _ in
        //            print("button was pressed")
        //        }), for: .touchUpInside)
        return button
    }
    
    @objc func startGame(_ sender: UIButton) {
        print("button was pressed")
    }
    
}
