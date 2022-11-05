import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Get all the most renowned heroes worldwide", "in one unique place!"],
      typeSpeed: 50,
      loop: true
    })
  }
}
