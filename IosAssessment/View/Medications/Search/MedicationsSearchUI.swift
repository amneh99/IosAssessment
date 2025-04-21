//
//  MedicationsSearchUI.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct MedicationsSearchUI: View {
    @StateObject private var viewModel = ViewModel()
    @State var pushDet = false
    
    var body: some View {
        NavigationStack {
            List {
                Section(header:
                            Text("Search Results")
                    .foregroundColor(.gray)
                    .font(.footnote)
                ) {
                    ForEach(viewModel.filteredMeds) { med in
                        MedicationCellUI(medication: med)
                            .padding(.vertical, 4)
                            .navLink(destination: MedicationDetailsUI())
                    }
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Search Medication")
            .navigationBarTitleDisplayMode(.inline)
        }
     }
 }

#Preview {
    NavigationStack {
        MedicationsSearchUI()
    }
}

private class ViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var meds: [Medication] = [
        Medication(name: "Medicine - 1", image: .med),
        Medication(name: "Medicine - 2", image: .med),
        Medication(name: "Medicine - 3", image: .med),
        Medication(name: "Medicine - 4", image: .med),
        Medication(name: "Medicine - 5", image: .med),
    ]
    
    var filteredMeds: [Medication] {
        if searchText.isEmpty {
            return meds
        } else {
            return meds.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) == true
            }
        }
    }
}
