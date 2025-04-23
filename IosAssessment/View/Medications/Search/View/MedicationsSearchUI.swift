//
//  MedicationsSearchUI.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI
import Combine

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
                    if viewModel.searchText.isEmpty {
                        emptyListImage()
                    } else {
                        ForEach(viewModel.filteredMeds, id: \.name) { med in
                            MedicationSearchCellUI(medication: med)
                                .padding(.vertical, 4)
                                .navLink(destination: MedicationDetailsUI())
                        }
                    }
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Search Medication")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func emptyListImage() -> some View {
        HStack {
            Spacer()
            Image(.emptyList)
            Spacer()
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
    @Published var meds: [ConceptProperty] = []
    
    var filteredMeds: [ConceptProperty] {
        if searchText.isEmpty {
            return meds
        } else {
            return meds.filter {
                $0.name?.localizedCaseInsensitiveContains(searchText) == true
            }
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    let searchService: SearchMedServiceProtocol
    
    init() {
        self.searchService = SearchMedService()
        
        $searchText
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] newText in
                guard !newText.isEmpty else { return }
                self?.fetchMeds(medName: newText)
            }
            .store(in: &cancellables)
    }
    
    func fetchMeds(medName: String) {
        searchService.getUsers(medName: medName)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] data in
                self?.meds = data.drugGroup?.conceptGroup?.compactMap {
                    $0.conceptProperties
                }.flatMap{$0} ?? []
            })
            .store(in: &cancellables)
    }
}
