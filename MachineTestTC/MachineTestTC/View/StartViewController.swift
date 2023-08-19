//
//  StartViewController.swift
//  MachineTestTC
//
//  Created by Rajeshwari Sharma on 17/08/23.
//


import UIKit

class StartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource{

//    Variable declaration
//
    @IBOutlet weak var Secondviewcircle: UIButton!
    @IBOutlet weak var one: UIButton!

    @IBOutlet weak var confirmbutton: UIButton!
    @IBOutlet weak var two: UIButton!

    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var FirstButtonCircle: UIButton!

    @IBOutlet weak var SeconfNext: UIButton!
    @IBOutlet weak var ThirdButton: UIButton!
//
    @IBOutlet weak var SecondButton: UIButton!
  

    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!

   @IBOutlet var nextbutton:UIButton!
    @IBOutlet var secondbutton:UIButton!

    @IBOutlet var ShowView:UIView!
    @IBOutlet var SecondView:UIView!
    @IBOutlet var ThirdView:UIView!
    
    var selectedindex:Int?
        var iscollapse=false
    
    let animationDuration: Double = 1.0
    let delayBase: Double = 1.0
    @IBOutlet weak var mTableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableviewSetup()
        //        first view Variable Declaration
//
        FirstButtonCircle.layer.cornerRadius = FirstButtonCircle.frame.size.width / 2
        Secondviewcircle.layer.cornerRadius = Secondviewcircle.frame.size.width / 2
        ThirdButton.layer.cornerRadius = ThirdButton.frame.size.width / 2

//        //        Second view variable declarations
//
        one.layer.cornerRadius = one.frame.size.width / 2
        two.layer.cornerRadius = two.frame.size.width / 2
        three.layer.cornerRadius = three.frame.size.width / 2

//        //        Third View Declaration

        ThirdView.isHidden=true
        SecondView.isHidden=true
        ShowView.isHidden=true
        tableviewSetup()
        mTableView.reloadData()

//CORNER RADIUS
        confirmbutton.layer.cornerRadius = 25
        nextbutton.layer.cornerRadius = 25
        SeconfNext.layer.cornerRadius=25

    }
    
    
//    Button Actions
    @IBAction func FirstNextAction(_ sender: Any) {
        SecondView.isHidden=false
        UIView.animate(withDuration: 1.0, animations: {
                  // Change the label's properties here
                  self.FirstButtonCircle.alpha = 0.0 // Fade out
                  self.FirstButtonCircle.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Scale up
            self.Secondviewcircle.alpha = 0.0 // Fade out
            self.Secondviewcircle.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Scale up
            self.ThirdButton.alpha = 0.0 // Fade out
            self.ThirdButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Scale



              }) { (completed) in
                  if completed {
                      self.FirstButtonCircle.alpha = 1 // Fade out
                 //     self.FirstButtonCircle.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Scale up
                self.Secondviewcircle.alpha = 1 // Fade out
              //  self.Secondviewcircle.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Scale up
                self.ThirdButton.alpha = 1// Fade out
              //  self.ThirdButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Scale up
                  }
              }

    }

    @IBAction func ConfirmAction(_ sender: Any) {
        SecondView.isHidden=true
        ShowView.isHidden=true
        ThirdView.isHidden=true
    }

    @IBAction func SecondNextAction(_ sender: Any) {
        ThirdView.isHidden=false

    }
    
    //TableView SetUp
    
    func tableviewSetup(){
        mTableView.delegate=self
        mTableView.dataSource=self
        
        
      
        
      setCollectionViewLayouts()
        
       
        mTableView.register(UINib(nibName:"StartTableCell1" , bundle: Bundle.main), forCellReuseIdentifier: "StartTableCell1")
        mTableView.register(UINib(nibName:"StartTableCell2" , bundle: Bundle.main), forCellReuseIdentifier: "StartTableCell2")
       
    }
    
    func setCollectionViewLayouts(){
        collectionview.delegate=self
        collectionview.dataSource=self
            let flowLayout=UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal

   flowLayout.itemSize=CGSize(width: 120, height: 150)
            flowLayout.minimumLineSpacing = 5
         flowLayout.minimumInteritemSpacing = 5
            collectionview.setCollectionViewLayout(flowLayout, animated: true)
           /// CollectiobView1.setCollectionViewLayout(flowLayout, animated: true)
        collectionview.register(NewViewCell.nib, forCellWithReuseIdentifier: NewViewCell.identifier)
        }


//    Tableview Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        switch section{
            
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StartTableCell1") as! StartTableCell1
            cell.readmorebutton.addTarget(self, action: #selector(readmore), for: .touchUpInside)
            cell.Cancel.addTarget(self, action: #selector(cancle), for: .touchUpInside)
            cell.readmorebutton.tag = indexPath.row
            cell.alpha = 0
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StartTableCell2") as! StartTableCell2
           
            cell.PlayButton.addTarget(self, action: #selector(New), for: .touchUpInside)
            cell.alpha = 0
            return cell
            
        default:
            break
        }
    
        return UITableViewCell()
        
    }
    
//    collection View methods
//    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewViewCell.identifier, for: indexPath) as? NewViewCell else { return UICollectionViewCell() }


        cell.alpha = 0
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {


                UIView.animate(withDuration: 1, delay: 0.5*Double(indexPath.item), animations: {
                    cell.alpha=1

                })
    }
//

    @objc func New(){
//       
        ShowView.isHidden=false

    }
    
    @objc func readmore(sender:UIButton){
       
            let index = sender.tag
            let indexpath1 = IndexPath(row:sender.tag,section: 0)
            if selectedindex == index{
                selectedindex = nil
            }else{
                selectedindex = index
            }
        mTableView.reloadRows(at:[indexpath1],with:.automatic)
        mTableView.endUpdates()

    }
    @objc func cancle(sender:UIButton){
        self.navigationController?.popViewController(animated: true)
         //   dismiss(animated: true)
       
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let section = indexPath.section
        
        switch section{
            
            
        case 0 :
            print("selectedindex::\(selectedindex)")
            cell.alpha = 0
            
            UIView.animate(withDuration: 0.5, delay: 0.5*Double(indexPath.row),animations: {
                cell.alpha = 1
            })
        case 1 :
            
         //   cell.alpha = 0
                    cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y:cell.contentView.frame.height)
        cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y:0)
            UIView.animate(withDuration: 1, delay: 0.05*Double(indexPath.row), options: .allowAnimatedContent) {
                        cell.transform =  CGAffineTransform(translationX:  cell.contentView.frame.height, y: cell.contentView.frame.width)
                cell.alpha=1
                    }
            
        default:
            break
            
        }
    }
        
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        switch section{
            
            
        case 0 :
            print("selectedindex::\(selectedindex)")
            if self.selectedindex == indexPath.section{
                return 400
            }else{
                return 220
            }
        case 1 :
            return 500
        default:
            break
            
        }
        
        return 0
        
        
    }
    
    
    
}

//NIB AND IDENTIFIER FOR COLLECTION VIEW

extension UICollectionViewCell {
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
