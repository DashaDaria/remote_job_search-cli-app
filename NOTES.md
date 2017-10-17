Remote Job Search

User Interaction:
1. Welcome to this week's remote job opportunities
2. Choose a category you want to see jobs for
  a. user sees a list of job categories only
3. Choose which job you'd like to see more information on
  a. user sees a list with: job title - company name - job type (freelancer/contractor/ft) - post date(7 days ago)
4. Job info to include
  a. user sees a header with job title - company name - job type (freelancer/contractor/ft)
  b. user sees the job's 'bottom line'
  c. user sees the job's 'how to apply' link

Program Architecture
1. CLI controller - deals with user input/output
2. A Job class - provides an instance of a job with:
  a. job title - company name - job type (freelancer/contractor/ft) - post date
    1. job.title, job.company_name, job.type, job.post_date
  b. can call a job info method -> job.info
  c. filters job results to this week ONLY -> job.this_week
2. Scraper class - provides information to initiate into the Job class
  a. provides information that is ONLY 1 week old

? Who is responsible for outputting job information that is only 1 week old?
    - Should the scraper class only pull info 1 week old or should the job class have a method that filters the job instances by date?
