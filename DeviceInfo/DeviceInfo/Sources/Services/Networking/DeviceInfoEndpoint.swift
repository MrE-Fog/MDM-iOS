//
//  DeviceInfoEndpoint.swift
//  DeviceInfo
//
//  Created by Piotr Fraccaro on 06/06/2021.
//

import Core

struct DeviceInfoEndpoint: Endpoint {

    var host: String
    var path: String

    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.port = 443
        components.path = "/api" + path

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }

    var headers: Headers {
        return [
            "x-apikey": "795ad45e4dc222bc0e5bd1c163bb885e3635e",
            "content-type": "application/json"
        ]
    }

    var queryItems: [URLQueryItem] = []
}

// MARK: - DeviceInfo API
extension DeviceInfoEndpoint {

    static var deviceInfo: Self {
        return DeviceInfoEndpoint(host: UserDefaults.mdmServerAddress ?? "", path: "/device/info")
    }
}
