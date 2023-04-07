//
//  RequestBuilder.swift
//  PrimeNumberApp
//
//  Created by Nikita Kirshin on 30.03.2023.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest {get}
}
