// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from 'sortablejs';
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end,
      animation: 150,
      ghostClass: 'blue-background-class'
    })
  }

  end(event) {
    console.log(event)
    let data =  new FormData()
    data.append('position', event.newIndex + 1)
    let id = event.item.dataset.id

    Rails.ajax({
      url: `/todos/${id}/move`,
      type: 'PATCH',
      data: data
    })

    const positions = document.querySelectorAll('.position')

    fetch('/todos.json')
      .then(response => response.json())
      .then(todos => {
        positions.forEach((position, index) => {
          position.innerText = todos[index].position
        })
      })
  };
}
