import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  "locale": {
      "firstDayOfWeek": 1 // start week on Monday
  },
  minDate: "today"
});
