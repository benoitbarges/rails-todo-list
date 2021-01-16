// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
    const checkbox = this.element
    checkbox.addEventListener('click', (event) => {

      const id = checkbox.dataset.todoId
      const todoTitle = document.querySelector(`#todo-title-${id}`)
      const faCheck = document.querySelector(`.fa-check-${id}`)
      const wellDone = "<p class='well-done'>WELL DONE !</p>"

      if (checkbox.classList.contains('checked')) {
        todoTitle.classList.remove('todo-title-checked')
        checkbox.classList.remove('checked')
        faCheck.classList.remove('fa-check-checked')
        checkbox.parentNode.querySelector('.well-done')?.remove()

        Rails.ajax({
          url: `/todos/${id}/mark_as_not_done`,
          type: 'POST',
        })

      } else {
        todoTitle.classList.add('todo-title-checked')
        checkbox.classList.add('checked')
        faCheck.classList.add('fa-check-checked')

        checkbox.parentNode.insertAdjacentHTML('afterbegin', wellDone)

        Rails.ajax({
          url: `/todos/${id}/mark_as_done`,
          type: 'POST',
        })
      }
    })
  };
}
