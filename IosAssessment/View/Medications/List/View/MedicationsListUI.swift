//
//  MedicationsListUI.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct MedicationsListUI: View {
    @StateObject private var viewModel = ViewModel()
    @State private var showSheet = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            List {
                ForEach(viewModel.meds) { med in
                    MedicationCellUI(medication: med)
                        .padding(.vertical, 4)
                }
                .onDelete(perform: viewModel.delete)
            }

            searchMadications()
        }
        .navigationTitle("My Medications")
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $showSheet) {
            MedicationsSearchUI()
        }
    }
    
    func searchMadications() -> some View {
        HStack {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 24))

            Text("Search Medications")
                .font(.system(size: 16, weight: .semibold))
        }
        .foregroundStyle(.mainBlue)
        .padding()
        .onTapGesture {
            showSheet.toggle()
        }
    }
}

#Preview {
    NavigationStack {
        MedicationsListUI()
    }
}

private class ViewModel: ObservableObject {
    @Published var meds: [Medication] = [
        Medication(name: "Medicine 1", image: "MedImage"),
        Medication(name: "Medicine 2", image: "MedImage"),
        Medication(name: "Medicine 3", image: "MedImage"),
        Medication(name: "Medicine 4", image: "MedImage"),
        Medication(name: "Medicine 5", image: "MedImage"),
    ]
    
    func delete(at offsets: IndexSet) {
            meds.remove(atOffsets: offsets)
        }
}
