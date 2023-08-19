//
//  ViewController.swift
//  MachineTestTC
//
//  Created by Rajeshwari Sharma on 17/08/23.
//


import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var mTableView: UITableView!
    
   
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Call TableView Setup
        tableviewSetup()
       
        
    }
    
    //TableView SetUp
    func tableviewSetup(){
        mTableView.delegate=self
        mTableView.dataSource=self
        mTableView.register(UINib(nibName:"TableViewCell" , bundle: Bundle.main), forCellReuseIdentifier: "TableViewCell")
    }
    
    
//    Tableview Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        switch section{
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
            
            return cell
    
        default:
            break
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        switch section{
            
            
        case 0 :
            return 500
        default:
            break
            
        }
        
        return 0
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("StartViewController")
        
        //CALL START VIEW CONTROLLER
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(identifier: "StartViewController") as! StartViewController
            nextVC.hidesBottomBarWhenPushed = true
        nextVC.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
