//
//  SiteStatisticsViewController.swift
//  inspired
//
//  Created by Wux on 30/03/15.
//  Copyright (c) 2015 Wux. All rights reserved.
//

import UIKit
import Parse
//import Chart;

class SiteStatisticsViewController: UIViewController, UIGestureRecognizerDelegate, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var data: PFObject!
    var pageIndex: Int = 0;
    var titleText : String!
    var pageViewController : UIPageViewController?
    var pageTitles : Array<String> = ["Down Stats", "Response time", "other"]
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var pageLabel: UILabel!
    
    override func viewDidLoad() {
        pageControl.currentPage = pageIndex;
        
       
        
        pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageViewController!.dataSource = self
        pageViewController?.delegate = self
        
        let startingViewController: SiteStatisticsDownViewController = viewControllerAtIndex(0)!
        let viewControllers: NSArray = [startingViewController]
        pageViewController!.setViewControllers(viewControllers, direction: .Forward, animated: false, completion: nil)
        pageViewController!.view.frame = CGRectMake(0, 51, view.frame.size.width, view.frame.size.height)

        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
        
        updatePageControl()

    }
    
    func updatePageControl(){
        pageControl.currentPage = pageIndex
        pageLabel.text = pageTitles[pageIndex]
    }
    
  
    @IBAction func pageControldidChange(sender: AnyObject) {
        pageIndex = sender.currentPage
        updatePageControl()
        viewControllerAtIndex(pageIndex);
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as SiteStatisticsDownViewController).pageIndex
        NSLog("viewControllerBeforeViewController \(index)")
        pageIndex = index
        updatePageControl();
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        
        
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as SiteStatisticsDownViewController).pageIndex
        NSLog("viewControllerAfterViewController \(index)")
        pageIndex = index
        updatePageControl();
        if index == NSNotFound {
            return nil
        }
        
        index++
        
        if (index == self.pageTitles.count) {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }
    
    func viewControllerAtIndex(index: Int) -> SiteStatisticsDownViewController? {
        if self.pageTitles.count == 0 || index >= self.pageTitles.count {
            return nil
        }
        
        var vc = SiteStatisticsDownViewController()
        if(index == 0){
            vc = SiteStatisticsDownViewController()
        }else{
            vc = SiteStatisticsDownViewController()
        }
        
        // Create a new view controller and pass suitable data.
        
        vc.titleText = pageTitles[index]
        self.navigationItem.title = "test"
        vc.pageIndex = index
        vc.data = self.data
        
       
        return vc
    }

    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return 0;
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return self.pageTitles.count
        return 0;
    }
    
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        NSLog("did rotate");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}