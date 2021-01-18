// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller='hello'>
//   <h1 data-target='hello.output'></h1>
// </div>

import { Controller } from 'stimulus'
import Sortable from 'sortablejs'
import Rails from '@rails/ujs'

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      animation: 200,
      ghostClass: 'sortable-background-class',
      onEnd: this.end
    })
  }

  end(event) {
    const data =  new FormData()
    data.append('position', event.newIndex + 1)

    const id = event.item.dataset.id

    const positions = document.querySelectorAll('.position')

    Rails.ajax({
      url: `/todos/${id}/move`,
      type: 'PATCH',
      data: data,
      success: (todos) => {
        console.log(todos)
        positions.forEach((position, index) => {
          position.innerText = todos[index].position
        })
      }
    })
  }
}
