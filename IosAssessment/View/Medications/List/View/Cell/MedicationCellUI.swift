//
//  MedicationCellUI.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct MedicationCellUI: View {
    var medication: Medication
    
    var body: some View {
        HStack(spacing: 12) {
            Image(medication.image)
            
            Text(medication.name)
                .font(.system(size: 16, weight: .medium))
            
            Spacer()
        }
    }
}

#Preview {
    MedicationCellUI(medication: Medication(name: "Medication", image: "MedImage"))
        .padding()
}
