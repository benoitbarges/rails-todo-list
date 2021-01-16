import Rails from "@rails/ujs"

const handleCheck = () => {
  const checkboxes = document.querySelectorAll('.checkbox')

  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener('click', (event) => {

      const id = checkbox.dataset.todoId
      const todoTitle = document.querySelector(`#todo-title-${id}`)
      const faCheck = document.querySelector(`.fa-check-${id}`)
      const wellDone = "<p class='well-done my-auto'>WELL DONE !</p>"

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
  })
};

export { handleCheck }
