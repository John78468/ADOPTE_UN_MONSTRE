import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  open() {
    this.modalTarget.classList.add('modal-display')
  }

  close() {
    this.modalTarget.classList.remove('modal-display')
  }
}
