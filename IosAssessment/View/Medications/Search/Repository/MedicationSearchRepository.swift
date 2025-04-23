//
//  MedicationSearchRepository.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/22/25.
//

import Foundation
import Combine

protocol SearchMedServiceProtocol {
    func getUsers(medName: String) -> AnyPublisher<DrugGroupModel, Error>
}

class SearchMedService: SearchMedServiceProtocol {
    let apiClient = URLSessionAPIClient<SearchEndpoint>()
    
    func getUsers(medName: String) -> AnyPublisher<DrugGroupModel, Error> {
        return apiClient.request(.getUsers(name: medName))
    }
}

enum SearchEndpoint: APIEndpoint {
    case getUsers(name: String)
}

extension SearchEndpoint {
    var baseURL: String {
        return "https://rxnav.nlm.nih.gov/REST"
    }
    
    var path: String {
        switch self {
        case .getUsers(let name):
            return "/drugs.json?name=\(name)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getUsers:
            return ["Authorization": "Bearer TOKEN"]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getUsers: return [:]
            //return ["page": 1, "limit": 10]
        }
    }
}

struct DrugGroupModel: Codable {
    var drugGroup: DrugGroup?
}
