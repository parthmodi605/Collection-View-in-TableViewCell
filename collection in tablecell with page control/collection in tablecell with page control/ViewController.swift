//
//  ViewController.swift
//  collection in tablecell with page control
//
//  Created by Mac on 14/04/18.
//  Copyright © 2018 TOPS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var page: UIPageControl!
    @IBOutlet weak var upimage: UIImageView!
    var category = ["Dessert","Food"]
    var arr = [#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "5"),#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "7")]
    var arr1 = ["Chesse cake","Three Layer cake","Cupcake","Stawberry cake","Moose cake","Lava cake","Cut cake"]
    var timer: Timer!
    var updateCount: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCount = 0
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){
        if(updateCount<=6){
            page.currentPage = updateCount
            upimage.image = UIImage(named: String(updateCount+1) + ".jpg")
            updateCount = updateCount + 1
            
        }else{
            updateCount = 0
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return category[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell table", for: indexPath) as! TableViewCell
        cell.collection.reloadData()
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell collection", for: indexPath)  as! CollectionViewCell
        cell.img1.image = arr[indexPath.row]
        cell.lbl1.text = arr1[indexPath.row]
        return cell
    }
    
   


}


