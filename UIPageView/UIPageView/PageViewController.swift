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
        "Ну и наконец последняя страница презентации с напутствием в добрый путь =)",
        ""
    ]
    
    let emojiArray = ["😀","😠","🤬","🫠",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        // Do any additional setup after loading the view.
       
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true)
        }
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else {return nil}
        guard index < presentsScreenContent.count - 1 else {
            let userDefault = UserDefaults.standard
            userDefault.set(true, forKey: "Done")
            dismiss(animated: true)
            return nil
            
        }
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else {return nil}
        
        contentViewController.presentText = presentsScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentsScreenContent.count
        
        return contentViewController
    }
    
    
    
}


extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    
}
