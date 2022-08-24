import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="listing-map"
export default class extends Controller {
  connect() {
    console.log("hello from listing map")
    mapboxgl.accessToken = this.apiKeyValue;
    const x = this.latitude
    const y = this.longitude
    const map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v9",
      center: [y, x],
      zoom: 12
    })
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }
}
