//
//  CLLocationView.swift
//  Sunny
//
//  Created by Karen Vardanian on 18.07.2023.
//

import UIKit
import CoreLocation


class CLLocationView {
    var locationManager: CLLocationManager = {
       let lm = CLLocationManager()
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()
}
