import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="query-form"
export default class extends Controller {
  static targets = [ "queryFormButton", "queryFormContainer", "queryFormTextField" ];

  showForm(event) {
    event.preventDefault();

    this.queryFormContainerTarget.classList.toggle("hidden");

    if ("hidden" in this.queryFormContainerTarget.classList) {
      this.queryFormButtonTarget.innerText = "New Query"
    } else {
      this.queryFormButtonTarget.innerText = "Cancel"
      this.queryFormTextFieldTarget.focus();
    }
  }
}
