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
        positions.forEach((position, index) => {
          position.innerText = todos[index].position
        })
      }
    })
  }
}
