//
//  FunnelModel.swift
//  FunnelChartDemo
//
//  Created by ShrawanKumar Sharma on 07/12/16.
//  Copyright © 2016 com.demoapp. All rights reserved.
//

import Foundation
import UIKit

class HeightDistribution {
    
    
   class func  height(percentages: [Float] , TotalHeight:Float ) -> [Float] {
    
        var heights = [Float]()
     
        for percentage in   percentages
        {
           let height = (percentage/100)*TotalHeight
            heights.append(height)
        }
        return heights
        
    }
    
    
    
}
