//
//  APIResponse.swift
//  Boardroom
//
//  Created by Amaal Asiri on 26/07/1446 AH.
//

import Foundation

struct recordsResponse<T: Codable>: Codable {
    let records: [record<T>]
}

struct record<T: Codable>: Codable {
    let id: String
    let createdTime: String
    let fields: T
}
