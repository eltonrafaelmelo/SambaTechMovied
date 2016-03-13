//
//  UtilDate.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 3/13/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit

class UtilDate: NSObject {
    
    class func dataCom(dia :Int, mes :Int, ano :Int, hora: Int, minuto :Int, segundo: Int) -> NSDate {
        let dataComponents = NSDateComponents()
        dataComponents.day = dia
        dataComponents.month = mes
        dataComponents.year = ano
        dataComponents.hour = hora
        dataComponents.minute = minuto
        dataComponents.second = segundo
        return dataDoComponente(dataComponents)
    }
    
    class func dataDoComponente(dataComponents :NSDateComponents) -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        return calendar.dateFromComponents(dataComponents)!
    }

}
