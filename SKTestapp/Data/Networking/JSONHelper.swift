//
//  JSONHelper.swift
//  SKTestapp
//
//  Created by Jonatan Ariel Marcos Gonzalez on 01/07/2022.
//

import Foundation

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    return encoder
}
