//
//  Note+CoreDataProperties.swift
//  topView
//
//  Created by 鈴木健人 on 2016/11/17.
//  Copyright © 2016年 Kento Suzuki. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var title: NSObject?
    @NSManaged public var purpose: NSObject?
    @NSManaged public var good: NSObject?
    @NSManaged public var bad: NSObject?
    @NSManaged public var improvement: NSObject?
    @NSManaged public var practice: NSObject?
    @NSManaged public var start: NSObject?
    @NSManaged public var end: NSObject?

}
