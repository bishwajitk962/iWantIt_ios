import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()

    override init() {
        super.init()
        setupLocationManager()
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // You can also set desiredAccuracy and other properties based on your requirements.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Reverse geocoding error: \(error.localizedDescription)")
                return
            }

            if let country = placemarks?.first?.country,
               let phoneCode = self.getPhoneCode(for: country),
               let flag = self.getCountryFlag(for: country),
               let isoCode = self.getCountryISOCode(for: country) {
                print("Country: \(country)")
                print("Phone Code: \(phoneCode)")
                print("Flag: \(flag)")
                print("ISO Code: \(isoCode)")
            } else {
                print("Unable to retrieve location information.")
            }
        }

        // Stop updating location to save battery
        locationManager.stopUpdatingLocation()
    }

    private func getPhoneCode(for country: String) -> String? {
        // Implement your logic to get the phone code based on the country name
        // You can use a library like PhoneNumberKit or maintain a dictionary with country codes.
        print("country:",country)
        return nil
    }

    private func getCountryFlag(for country: String) -> String? {
        // Implement your logic to get the country flag based on the country name
        // You can use a library or maintain a dictionary with country flags.
        return nil
    }

    private func getCountryISOCode(for country: String) -> String? {
        // Use Locale to get the ISO code for the country
        let locale = Locale.current
        let isoCode = locale.regionCode
        return isoCode
    }
}


