import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    console.log("hello");
    new Typed(this.element, {
      strings: ["Create your list"],
      typeSpeed: 100,
      loop: true
    })
  }
}
