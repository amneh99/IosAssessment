//
//  MedicationSearchCellUI.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/23/25.
//

import SwiftUI
struct MedicationSearchCellUI: View {
    var medication: ConceptProperty
    
    var body: some View {
        HStack(spacing: 12) {
            Image(.med)
            
            Text(medication.name ?? "--")
                .font(.system(size: 16, weight: .medium))
            
            Spacer()
        }
    }
}

#Preview {
    MedicationSearchCellUI(medication: ConceptProperty(name: "title"))
}
