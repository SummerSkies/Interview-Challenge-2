//
//  ImageController.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/18/23.
//

import UIKit

class GenerationController {
    enum GenerationError: Error, LocalizedError {
        case couldNotDoTheThing
    }
    

    /**
     Will make a request to authenticate the users credentials. If successful the User.current object will hold the signed in user.
     
     - Throws: If the user does not exist or if the API.url is invalid
     - Returns: A boolean depending on whether or not the operation was successful
     */
    func generateUsers(count: Int) async throws -> APIResponse {
        let session = URLSession.shared
        let request = URLRequest(url: URL(string: "https://randomuser.me/api/?results=\(count)")!)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw GenerationError.couldNotDoTheThing
        }
        
        let decoder = JSONDecoder()
        let decodedResponse = try decoder.decode(APIResponse.self, from: data)

        return decodedResponse
    }
}
