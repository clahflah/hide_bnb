import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = [ "marker" ]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
      this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v11',
      });
      this.#addMarkersToMap()
      this.#fitMapToMarkers()

      this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      console.log(marker)
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      const customMarker = document.createElement("div")
      const lati = marker.lat
      customMarker.className = `${lati}`
      customMarker.dataset.action = "click->map#focus"
      customMarker.dataset.mapTarget = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.backgroundRepeat = "no-repeat"
      customMarker.style.color = "red"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  // Run this method within the addMarkersToMap method, make it require a paramter
  // the parameter of lat will be passed to this method from the addmarler method
  focus(event) {
    console.log("Hello! I am updtaed again")
    console.log()
  }
}
