//
//  Medication.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import Foundation

struct Medication: Identifiable, Codable {
    var id = UUID().uuidString
    var name: String
    var image: String
}

struct MedicationDetails {
    var name: String
    var image: ImageResource
    var details: [String]
}
