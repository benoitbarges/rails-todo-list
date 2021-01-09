import flatpickr from "flatpickr";
import Rails from "@rails/ujs"


const initFlatpickr = () => {

  flatpickr(".datepicker", {
    "locale": {
        "firstDayOfWeek": 1 // start week on Monday
    },
    minDate: "today",
    altInput: true
  });

  const selectDate = (selectedDates, dateStr, instance) => {
    let data =  new FormData()
    data.append('deadline', dateStr)
    let id = instance.element.dataset.id

    Rails.ajax({
        url: `/todos/${id}/update_deadline`,
        type: 'PATCH',
        data: data
      })
  }

  flatpickr(".changeDate", {
    "locale": {
        "firstDayOfWeek": 1 // start week on Monday
    },
    minDate: "today",
    altInput: true,
    onClose: selectDate
  });
}

export { initFlatpickr }

