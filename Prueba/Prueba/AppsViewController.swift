//
//  ViewController.swift
//  Prueba
//
//  Created by Wilson Ricardo Erira Correa on 23/02/16.
//  Copyright © 2016 Wilson Ricardo Erira Correa. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper


class AppsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,ReloadTableDelegate
{
    
    
    @IBOutlet weak var tableViewApps: UITableView!
    var deserealizeService : DeserealizeService?
    var appList : AppList?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deserealizeService = DeserealizeService.init()
        self.tableViewApps.delegate = self
        self.tableViewApps.dataSource = self
        appList = AppList.init()
        deserealizeService?.delegate=self
        deserealizeService?.deserealizeItunesService();
       
    }
    
    func reload()
    {
         self.tableViewApps.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TableView datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(self.appList?.feed?.entry != nil)
        {
            return (self.appList?.feed?.entry!.count)!
            
        }
        else{
            return 0
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "AppTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! AppTableViewCell
        let app = appList!.feed?.entry![indexPath.row]
        cell.labelTitle.text=app?.title?.label
        cell.labelCategory.text=app?.category?.attributesCategory?.label
        let url: String = (app?.image![1].label)!
        cell.imageApp.downloadImageFromURL( url)
        
        return cell
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let app = appList!.feed?.entry![indexPath.row]
        
        performSegueWithIdentifier("showDetail", sender: app)
        
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "showDetail" {
            return false
        }
        
        // by default, transition
        return true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let app = sender as! Entry
        
        let detailVC: DetailViewController = segue.destinationViewController as! DetailViewController
        
        detailVC.entry = app
        
        
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    
    
    
}

