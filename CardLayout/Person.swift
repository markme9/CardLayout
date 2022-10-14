//
//  Person.swift
//  CardLayout
//
//  Created by zoya me on 10/13/22.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
    var image: UIImage?
    var moreAboutYou: String
    
}
class Model: ObservableObject {
    @Published var newPerson: [Person] = []
    
    
}
