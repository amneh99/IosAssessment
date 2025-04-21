//
//  MedicationDetailsUI.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct MedicationDetailsUI: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            List {
                Section(header: HStack {
                    Spacer()
                    headerView()
                    Spacer()
                }) {
                    detailsCell(viewModel.medDetails)
                }
            }
            
            MainFilledButton(title: "Add Medication to List")
                .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func headerView() -> some View {
        VStack {
            Image(viewModel.medDetails.image)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
            Text("Medicine 1")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.blackWhiteMode)
            
            Text("Generic Name")
        }
        .padding(.bottom)
    }
    
    private func detailsCell(_ details: MedicationDetails) -> some View {
        VStack(alignment: .leading) {
            Text("Details")
                .foregroundStyle(.gray)
            
            Text("Tablets:")
            
            ForEach(details.details, id: \.self) { point in
                pointView(point)
                    .padding(.bottom, 12)
            }
        }
    }
    
    private func pointView(_ point: String) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Image(.pointDot)
                .resizable()
                .scaledToFit()
                .frame(width: 8, height: 8)
                .padding(.bottom, 2)
            
            Text(point)
        }
    }
}

#Preview {
    MedicationDetailsUI()
}

private class ViewModel: ObservableObject {
    @Published var medDetails = MedicationDetails(name: "Test", image: .med, details: [
        "Adult: 1-2 tablets every 4 to 6 hours up to a maximum of 4 gm (8 tablets) daily.",
        "Children (6-12 years): ½ to 1 tablet 3 to 4 times daily. For long term treatment it is wise not to exceed the dose beyond 2.6 gm/day.",
        "Extended Release Tablet: Adults & Children over 12 years: Two tablets, swallowed whole, every 6 to 8 hours (maximum of 6 tablets in any 24 hours).The tablet must not be crushed.",
        " Syrup/Suspension: Children under 3 months: 10 mg/kg body weight (reduce to 5 mg/kg if"
    ])
}
