//
//  PageViewController.swift
//  UIPageView
//
//  Created by Karen Vardanian on 01.01.2023.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentsScreenContent = [
        "Первая страница презентации, рассказывающая о том, что наше приложение из себя представляет",
        "Вторая страница презентации, рассказывает о какой-то удобной фишке приложения",
        "Третья страница презентации тоже рассказывает о чем то очень интересном",
        "Ну и наконец последняя страница презентации с напутствием в добрый путь =)"
    ]
    
    let emojiArray = ["😀","😠","🤬","🫠",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true)
        }
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else {return nil}
        guard index < presentsScreenContent.count else {return nil}
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else {return nil}
        
        contentViewController.presentText = presentsScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentsScreenContent.count
        
        return contentViewController
    }
    
    
    
}
