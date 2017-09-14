# NCLocation
# Get location in a easy steps.
Copy the NCLocationManager.swift to your project, when you need location just use this code
NCLocationManager.shared.getCurrentLocation { (manager, location) in
            if let current:CLLocation = location { // This is an Optional Check
               // do your stuff here
            }
        }
