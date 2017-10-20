# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      The CLI allows users to browse remote job opportunities based on job categories. Upon choosing a category, users can see a list of all available jobs. Users can type list to see the list again or exit to leave.
- [x] Pull data from an external source
      I used https://weworkremotely.com to scrape data from the homepage. Due to the way the html is laid out I chose to create scraper methods per category and provide a category name to instantiate a Category and Job class.

- [x] Implement both list and detail views
      The app shows a list of job categories.
      Each category provides a list of jobs with more details.
