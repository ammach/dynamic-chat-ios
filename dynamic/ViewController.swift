//
//  ViewController.swift
//  dynamic
//
//  Created by adhoc on 18/11/1437 AH.
//  Copyright © 1437 AH ammach. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {


    
    var messages=[Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.backgroundColor=UIColor.redColor()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.registerClass(MyCell.self, forCellWithReuseIdentifier: "cell")
        messages.append(Message(message: "yeah man how r u ?", opt: "1"))
        messages.append(Message(message: "i think u should use this application to grow your knowledge in development genrally and understand some thechniques behind", opt: "2"))
        messages.append(Message(imgMessage: "twitter", opt: "1"))
        messages.append(Message(message: "hala", opt: "1"))
        messages.append(Message(message: "hala madriiiid", opt: "2"))
        messages.append(Message(imgMessage: "cristiano.jpg", opt: "2"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let message=messages[indexPath.item]
        var height:CGFloat=100
        if let text=message.text {
            height=estimateFrameForText(text).height+20
        }
        
        return CGSizeMake(self.view.frame.width, height)
    }
    
    func estimateFrameForText(text:String)->CGRect{
    
        let size=CGSize(width: 200, height: 1000)
        let options=NSStringDrawingOptions.UsesFontLeading.union(.UsesLineFragmentOrigin)
        return NSString(string: text).boundingRectWithSize(size, options: options, attributes: [NSFontAttributeName:UIFont.systemFontOfSize(16)], context: nil)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MyCell
        
        let message=messages[indexPath.item]
        if let text=message.text {
            cell.widthBack?.constant=estimateFrameForText(text).width+15
            cell.txtView.text=message.text
            cell.imgMessage.hidden=true
            cell.txtView.hidden=false
        } else if let img=message.imgMessage{
            cell.txtView.hidden=true
            cell.imgMessage.hidden=false
            cell.imgMessage.image=UIImage(named: img)
        }
        if message.optionall=="2" {
            cell.imgProfil.hidden=false
            cell.posleadingBackView?.active=true
            cell.posleadingTxtView?.active=true
            cell.postrealingBackView?.active=false
            cell.postreaingTxtView?.active=false
            cell.backView.backgroundColor=UIColor.blueColor()
        } else {
            cell.imgProfil.hidden=true
            cell.posleadingBackView?.active=false
            cell.posleadingTxtView?.active=false
            cell.postrealingBackView?.active=true
            cell.postreaingTxtView?.active=true
        }

        return cell
    }


    class MyCell:UICollectionViewCell{
        
        var widthBack:NSLayoutConstraint?
        var posleadingBackView:NSLayoutConstraint?
        var posleadingTxtView:NSLayoutConstraint?
        var postrealingBackView:NSLayoutConstraint?
        var postreaingTxtView:NSLayoutConstraint?
    
        let txtView:UITextView={
           let txtV=UITextView()
            txtV.translatesAutoresizingMaskIntoConstraints=false
            txtV.text="yeaah baby yeaah baby yeaah baby yeaah baby yeaah babyyeaah baby"
            txtV.backgroundColor=UIColor.clearColor()
            txtV.font=UIFont.systemFontOfSize(16)
            txtV.textColor=UIColor.whiteColor()
            return txtV
        }()
        
        let backView:UIView={
            let myView=UIView()
            myView.backgroundColor=UIColor.grayColor()
            myView.translatesAutoresizingMaskIntoConstraints=false
            myView.layer.cornerRadius=8
            myView.layer.masksToBounds=true
            return myView
        }()
        
        let imgMessage:UIImageView={
            let img=UIImageView()
            img.backgroundColor=UIColor.brownColor()
            img.translatesAutoresizingMaskIntoConstraints=false
            img.contentMode = .ScaleToFill
            img.layer.cornerRadius=8
            img.layer.masksToBounds=true
            return img
            
        }()
        
        let imgProfil:UIImageView={
        
            let img=UIImageView()
            img.image=UIImage(named: "twitter")
            img.translatesAutoresizingMaskIntoConstraints=false
            img.contentMode = .ScaleToFill
            img.layer.cornerRadius=16
            img.layer.masksToBounds=true
            return img
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(backView)
            addSubview(imgMessage)
            addSubview(txtView)
            addSubview(imgProfil)
            
            //imgProfil
            imgProfil.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 8).active=true
            imgProfil.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active=true
            imgProfil.widthAnchor.constraintEqualToConstant(32).active=true
            imgProfil.heightAnchor.constraintEqualToConstant(32).active=true
            
            
            //backView
            posleadingBackView=backView.leadingAnchor.constraintEqualToAnchor(imgProfil.trailingAnchor,constant:8)
            posleadingBackView!.active=true
            postrealingBackView=backView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor,constant:-8)
            postrealingBackView!.active=true
            backView.topAnchor.constraintEqualToAnchor(self.topAnchor).active=true
            widthBack=backView.widthAnchor.constraintEqualToConstant(200)
            widthBack!.active=true
            backView.heightAnchor.constraintEqualToAnchor(self.heightAnchor).active=true
            
            
            //imgMessage
            
            imgMessage.leadingAnchor.constraintEqualToAnchor(backView.leadingAnchor).active=true
            imgMessage.trailingAnchor.constraintEqualToAnchor(backView.trailingAnchor).active=true
            imgMessage.topAnchor.constraintEqualToAnchor(backView.topAnchor).active=true
            imgMessage.bottomAnchor.constraintEqualToAnchor(backView.bottomAnchor).active=true
            
            //txtView
            posleadingTxtView=txtView.leadingAnchor.constraintEqualToAnchor(backView.leadingAnchor)
            posleadingTxtView!.active=true
            postreaingTxtView=txtView.trailingAnchor.constraintEqualToAnchor(backView.trailingAnchor)
            postreaingTxtView!.active=true
            txtView.topAnchor.constraintEqualToAnchor(backView.topAnchor).active=true
            txtView.widthAnchor.constraintEqualToAnchor(backView.widthAnchor).active=true
            txtView.heightAnchor.constraintEqualToAnchor(backView.heightAnchor,constant:-8).active=true
            
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
}

