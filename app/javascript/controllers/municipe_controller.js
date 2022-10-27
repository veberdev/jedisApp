import { Controller } from '@hotwired/stimulus'
import { Datepicker } from 'vanillajs-datepicker';

export default class extends Controller {
  static targets = ['dateField'];
  connect() {
    let date_field = new Datepicker(this.dateFieldTarget, {format: "dd/mm/yyyy"})
  }
}