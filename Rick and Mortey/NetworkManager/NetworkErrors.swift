//
//  NetworkErrors.swift
//  Rick and Mortey
//
//  Created by Сапронов Игорь on 07.06.2022.
//

import Foundation
import UIKit

enum NetworkError: String, Error {
   
    case urlError  = "invalid URL"
    
    case responceError = "responce error"
        
    case decodeError = "couldn't parse JSON"

}
