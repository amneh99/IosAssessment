//
//  NetworkManager.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/22/25.
//

import Foundation
import Combine

/// Sends a network request to the provided endpoint and decodes the response into the expected type.
    ///
    /// - Parameter endpoint: The API endpoint to request.
    /// - Returns: A publisher that emits a decoded response of type `T` or an error.
    ///
    /// - Important:
    ///   - The `T` type must conform to `Decodable`.
    ///   - The request is performed asynchronously and the result is returned via Combine.
    ///
class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
        guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
            return Fail(error: APIError.invalidResponse)
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
