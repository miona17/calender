//
//  CalenderellCollectionViewCell.swift
//  calender
//
//  Created by 倉茂未央那 on 2017/12/09.
//  Copyright © 2017年 倉茂未央那. All rights reserved.
//

import UIKit

class CalenderellCollectionViewCell: UICollectionViewCell {
        public var textLabel:UILabel!
        
        required init(coder aDecoder:NSCoder){
            super.init(coder: aDecoder)!
        }
        
        override init(frame:CGRect){
            super.init(frame:frame)
            //UILabelを生成
            textLabel = UILabel()
            textLabel.frame = CGRect(x:0,y:0,width:self.frame.width,height:self.frame.height)
            textLabel.textAlignment = .center
            
            self.contentView.addSubview(textLabel!)
            
        }
    }
    

