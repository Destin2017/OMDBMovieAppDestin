//
//  Film+CoreDataProperties.swift
//  OMDBMovieApp
//  Created by ilabafrica on 01/04/2017.
//  Copyright © 2017 VODACOM. All rights reserved.
//

import Foundation
import CoreData


extension Film {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Film> {
        return NSFetchRequest<Film>(entityName: "Film");
    }

    @NSManaged public var title: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var type: String?
    @NSManaged public var poster: String?
    @NSManaged public var year: String?

}
