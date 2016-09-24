//
//  Message.swift
//  dynamic
//
//  Created by adhoc on 19/11/1437 AH.
//  Copyright © 1437 AH ammach. All rights reserved.
//

import Foundation


class Message{


    var text:String?
    var optionall:String?
    var imgMessage:String?
    
    
    init(message:String?,opt:String?){
    
        self.text=message
        self.optionall=opt
    }
    
    init(imgMessage:String?,opt:String?){
        
        self.imgMessage=imgMessage
        self.optionall=opt
    }
}