//
//  Pokemon+CoreDataProperties.swift
//  Kadama_v_1
//
//  Created by Kapil Dev on 13/06/21.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var ability: [String]?
    @NSManaged public var image: Data?
    @NSManaged public var relationship: Pokemon?

}

extension Pokemon : Identifiable {

}
