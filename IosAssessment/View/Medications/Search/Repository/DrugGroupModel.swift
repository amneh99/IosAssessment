//
//  DrugGroupModel.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/23/25.
//

import Foundation

// MARK: - DrugGroup
struct DrugGroup: Codable {
    var name: String?
    var conceptGroup: [ConceptGroup]?
}

// MARK: - ConceptGroup
struct ConceptGroup: Codable {
    var tty: String?
    var conceptProperties: [ConceptProperty]?
}

// MARK: - ConceptProperty
struct ConceptProperty: Codable {
    var rxcui, name, synonym, tty: String?
    var language, suppress, umlscui: String?
}
