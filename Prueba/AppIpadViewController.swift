//
//  AppIpadViewController.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 25/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class AppIpadViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,ReloadTableDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var deserealizeService : DeserealizeService?
    var appList : AppList?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.deserealizeService = DeserealizeService.init()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        appList = AppList.init()
        deserealizeService?.delegate=self
        
        deserealizeService?.deserealizeItunesService();
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if(self.appList?.feed?.entry != nil)
        {
            return (self.appList?.feed?.entry!.count)!
            
        }
        else{
            return 0
        }
        
    }
    
    func reload()
    {
        self.collectionView.reloadData()
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(self.appList?.feed?.entry != nil)
        {
            return (self.appList?.feed?.entry!.count)!
            
        }
        else{
            return 0
        }
        
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellIdentifier = "AppCollectionViewCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! AppCollectionViewCell
        
        let app = appList!.feed?.entry![indexPath.row]
        cell.labelTitle.text=app?.title?.label
        cell.labelCategory.text=app?.category?.attributesCategory?.label
        let url: String = (app?.image![1].label)!
        cell.imageApp.downloadImageFromURL( url)
        cell.backgroundColor = UIColor.whiteColor()
        
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! AppCollectionViewCell
        
        print (cell.labelTitle.text)
        
        performSegueWithIdentifier("showDetail", sender: cell)
        
    }
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "showDetail" {
            return false
        }
        
        // by default, transition
        return true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        assert(sender as? UICollectionViewCell != nil, "sender is not a collection view")
        
        if let indexPath = self.collectionView?.indexPathForCell(sender as! AppCollectionViewCell) {
            if segue.identifier == "showDetail" {
                let detailVC: DetailViewController = segue.destinationViewController as! DetailViewController
                let app = appList!.feed?.entry![indexPath.row]
                detailVC.entry = app
                
            }
        } else {
            // Error sender is not a cell or cell is not in collectionView.
        }
    }
    
    
    
    
}
