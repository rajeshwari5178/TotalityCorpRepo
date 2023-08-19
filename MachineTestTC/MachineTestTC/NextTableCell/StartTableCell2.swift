//
//  StartTableCell2.swift
//  MachineTestTC
//
//  Created by Rajeshwari Sharma on 17/08/23.
//

import UIKit
import Loady
import IBAnimatable


class StartTableCell2: UITableViewCell {
  
    @IBOutlet var CancleButton : LoadyButton!
    @IBOutlet var PlayButton : AnimatableButton!
    @IBOutlet var StackView : UIStackView!
    var tempTimer1 : Timer?
       var tempTimer2 : Timer?
       var tempTimer3 : Timer?
       var tempTimer4 : Timer?
       var fourPhaseTempTimer : Timer?
    @IBOutlet var fourPhases : LoadyFourPhaseButton!
   // var ButtonAccess=ButtonProgressBar()
    @IBOutlet weak var downloadbutton: LoadyButton!
    @IBOutlet weak var mCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    collectionViewSetup()
        CancleButton.isHidden=true
        PlayButton.isHidden=true
        self.downloadbutton.addTarget(self, action:#selector(animateView(_:)), for:.touchUpInside)
        self.downloadbutton.setAnimation(LoadyAnimationType.backgroundHighlighter())
    }
//
//    @IBAction func DownloadButtonAction(_ sender: ButtonProgressBar) {
//        ButtonAccess.startIndeterminate()
//
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
              
    }
    @IBAction func play(_ sender : UIButton){
        
        
        
        
        
    }
    
    @IBAction func animateView(_ sender : UIButton){
        if let button = sender as? LoadyFourPhaseButton {
            if button.loadingIsShowing() {
                button.stopLoading()
                return
            }
            button.startLoading()
            self.fourPhaseTempTimer?.invalidate()
            self.fourPhaseTempTimer = nil
            self.fourPhases.loadingPhase()
            if #available(iOS 10.0, *) {
                self.fourPhaseTempTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true){(t) in
                    if self.fourPhases.tag  == 0 {
                        self.fourPhases.errorPhase()
                        self.fourPhases.tag = 1
                    }else if self.fourPhases?.tag  == 1{
                        self.fourPhases.successPhase()
                        self.fourPhases.tag = 2
                    } else{
                        self.fourPhases.normalPhase()
                        self.fourPhases.tag = 0
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.fourPhaseTempTimer?.fire()
            }
            return
        }
        
        guard let button = sender as? LoadyButton else {
            return
        }
        if button.loadingIsShowing() {
            button.stopLoading()
            return
        }
        button.startLoading()
        var percent : CGFloat = 0
        switch button.animationType {
        case LoadyBackgroundHighlighterAnimation.animationTypeKey:
            self.tempTimer1?.invalidate()
            self.tempTimer1 = nil
            if #available(iOS 10.0, *) {
                self.tempTimer1 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (t) in
                    percent += CGFloat.random(in: 0...10)
                    button.update(percent: percent)
                    if percent > 105 {
                        percent = 60
                        self.tempTimer1?.invalidate()
                        print("Download")
                        self.CancleButton.setImage(UIImage(named: "checkmark.seal.fill"), for: .normal)
                        self.CancleButton.setImage(UIImage(systemName: "checkmark.seal.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal), for: .normal)
                        
                       
                        
//                        self.downloadbutton.setTitle("Play", for: .normal)
//                        self.downloadbutton.setTitleColor(.white, for: .normal)
//                        self.downloadbutton.backgroundColor = .systemBlue
//                        self.downloadbutton.backgroundFillColor = .systemBlue
//                        self.downloadbutton.loadingColor = .systemBlue
                        percent = 100
                        print("Download100")
                        self.CancleButton.isHidden=true
                        self.StackView.isHidden=true
                        self.PlayButton.isHidden=false
                       
                        
                      //  self.downloadbutton.ba = .systemBlue
                       // print("Download1")
                    }
                    print("Download1")
                    
//                    self.CancleButton.isHidden=true
//
//                    self.downloadbutton.setTitle("Play", for: .normal)
//                    self.downloadbutton.setTitleColor(.white, for: .normal)
//                    self.downloadbutton.backgroundColor = .systemBlue
//                    print("Download1")
                  //  self.CancleButton.image(for: "checkmark.seal.fill")
                   // self.CancleButton.setImage(UIImage?, for: <#T##UIControl.State#>)
                   

                    //self.CancleButton.tintColor = UIColor.yellow

                }
                self.CancleButton.isHidden=false
                print("Download2")
            }
            print("Download3")

            self.tempTimer1?.fire()
        case LoadyCircleAndTickAnimation.animationTypeKey:
            self.tempTimer2?.invalidate()
            self.tempTimer2 = nil
            if #available(iOS 10.0, *) {
                self.tempTimer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (t) in
                    percent += CGFloat.random(in: 0...10)
                    button.update(percent: percent)
                    if percent > 105 {
                        percent = 100
                        self.tempTimer2?.invalidate()
                       
                    }
                   
                }
              
            }
            print("Download")
            self.tempTimer2?.fire()
        case LoadyAppStoreAnimation.animationTypeKey:
            self.tempTimer3?.invalidate()
            self.tempTimer3 = nil
            if #available(iOS 10.0, *) {
                self.tempTimer3 = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
                    percent += CGFloat.random(in: 0...10)
                    button.update(percent: percent)
                    
                    if percent > 105 {
                        percent = 100
                        self.tempTimer3?.invalidate()
                    }
                    
                }
            }
            self.tempTimer3?.fire()
        case LoadyDownloadingAnimation.animationTypeKey:
            self.tempTimer4?.invalidate()
            self.tempTimer4 = nil
            if #available(iOS 10.0, *) {
                self.tempTimer4 = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){(t) in
                    percent += CGFloat.random(in: 5...10)
                    
                    button.update(percent: percent)
                    if percent > 105 {
                        percent = 100
                        self.tempTimer4?.invalidate()
                    }
                }
            }
            self.tempTimer4?.fire()
        default:
            break;
        }
    }
    
    
    
    
    
    
    private func collectionViewSetup(){
        mCollectionView.delegate=self
        mCollectionView.dataSource=self
        mCollectionView.isScrollEnabled = true
        mCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CollectionViewCell")
    setCollectionViewLayouts()
    }
    func setCollectionViewLayouts(){
            let flowLayout=UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            
   flowLayout.itemSize=CGSize(width: 240, height: 440)
            flowLayout.minimumLineSpacing = 5
         flowLayout.minimumInteritemSpacing = 5
            mCollectionView.setCollectionViewLayout(flowLayout, animated: true)
           /// CollectiobView1.setCollectionViewLayout(flowLayout, animated: true)
          
        }

}


extension StartTableCell2:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
}
