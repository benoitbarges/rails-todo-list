const handleCheck = () => {
  const checks = document.querySelectorAll('.checkbox');

  checks.forEach((check) => {
    check.addEventListener('click', (event) => {
      const id = check.dataset.todoId
      const todoTitle = document.querySelector(`#todo-title-${id}`)
      const faCheck = document.querySelector(`.fa-check-${id}`)

      if (check.classList.contains('checked')) {
        todoTitle.classList.remove('todo-title-checked')
        check.classList.remove('checked')
        faCheck.classList.remove('fa-check-checked')
      } else {
        todoTitle.classList.add('todo-title-checked')
        check.classList.add('checked')
        faCheck.classList.add('fa-check-checked')
      }
    })
  })
}

export { handleCheck };

