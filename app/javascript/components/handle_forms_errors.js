const handleTodoFormErrors = () => {
  document.addEventListener('click', () => {
    const element = document.querySelector('#todo-form')

    if (element) {
      element.addEventListener('ajax:success', (event) => {
        const [data, _status, _xhr] = event.detail
        const errors = document.querySelector('.todo-errors-messages')
        errors.innerHTML = ''

        if (typeof(data) === 'object') {
          Object.keys(data).forEach((key) => {
            errors.insertAdjacentHTML('beforeend', `<li>${key} ${data[key]}</li>`)
          })
        }
      })

      element.addEventListener('ajax:error', () => {
        element.insertAdjacentHTML('beforeend', '<p>ERROR</p>')
      })
    }
  })
}

const handleCommentFormErrors = () => {
  document.addEventListener('click', () => {
    const elements = document.querySelectorAll('.comment-form')

    if (elements) {
      elements.forEach((element) => {
        element.addEventListener('ajax:success', (event) => {
        const [data, _status, _xhr] = event.detail
        const errors = element.querySelector('.comment-errors-messages')

        errors.innerHTML = ''

        if (typeof(data) === 'object') {
          Object.keys(data).forEach((key) => {
            errors.insertAdjacentHTML('beforeend', `<li>${key} ${data[key]}</li>`)
          })
        }
      })

        element.addEventListener('ajax:error', () => {
          element.insertAdjacentHTML('beforeend', '<p>ERROR</p>')
        })
      })
    }
  })
}

export { handleTodoFormErrors, handleCommentFormErrors }
