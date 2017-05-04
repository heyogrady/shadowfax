document.addEventListener("turbolinks:load", function(){
  // Initialize Semantic UI dropdowns
  $("[data-ui-behavior=dropdown]").dropdown();

  // Initialize Semantic UI calendar component for date selection
  $("[data-ui-behavior=calendar_date]")
    .calendar(
      {
        type: "date",
        today: true,
      }
    );

  // Initialize Semantic UI calendar component for time selection
  $("[data-ui-behavior=calendar_time]")
    .calendar(
      {
        type: "time",
      }
    );

  // Initialize Semantic UI tabs
  $('[data-ui-behavior=tab]').tab();

  // Initialize Semantic UI checkboxes
  $('[data-ui-behavior=checkbox]').checkbox();
});
