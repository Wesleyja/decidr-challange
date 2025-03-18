# Decidr Coding Test - Actual Version

## Thoughts/Description

With the test saying that it required to be in Ruby on Rails / Typescript
i took it that it should be both. Projects ive worked on in the past have
followed this structure. Might have overcomplicated parts of the API as i
am always thinking about the path of adding stuff in future.

If i was to spend more time on this making it close to "perfect" i would
do the following:

- Tests for API requests 
  - adding better stubs for these [Vcr] (https://github.com/vcr/vcr)
  - can expand on error cases for the importer
- Full test coverage
- Google sheets url importer
  - Would involve making google account/auth codes
  - Spending more time on a work around for the auth
- Custom Errors
  - Then can test for these custom errors
- All imports using background jobs
  - json importer maybe?!
- Front end testing
  - click through/puppeteer 


### Requirements
Below is a list of user stories and requirements for each section of this
application.

**PART 1**

1. As a user, I should be able to upload this sample CSV and import the data
   into a database.

   IMPORTER REQUIREMENTS
    
   a. The data needs to load into 3 tables. **People**, **Locations** and
      **Affiliations**<br />
   b. A **Person** can belong to many **Locations**<br />
   c. A **Person** can belong to many **Affiliations**<br />
   d. A **Person** without an **Affiliation** should be skipped<br />
   e. A **Person** should have both a _first_name_ and _last_name_. All fields
      need to be validated except for _last_name_, _weapon_ and _vehicle_ which
      are optional.<br />
   f. Names and Locations should all be titlecased

**PART 2**

1. As a user, I should be able to view these results from the importer in a
   table.
2. As a user, I should be able to paginate through the results so that I can see
   a maximum of 10 results at a time.
3. As a user, I want to type in a search box so that I can filter the results I
   want to see.
4. As a user, I want to be able to click on a table column heading to reorder
   the visible results.


## Getting Started

If you dont have a sutible CSV downloaded it will default to the following
[CsvFile] (https://docs.google.com/spreadsheets/d/10c7r-kjdWM4L8kWK0nfE6JgHskzqp7DTF8MkUIo7-_o/edit?gid=0#gid=0)

### Dependencies

* Rails 7.1.5
* Ruby 3.2.2
* Node.js ( v18 or later)

** Im personally using pnpm, change to yarn/npm for execution

### Executing program

Application is split as a Ruby on Rails API backend and a Next.js frontend
Make to to start each side in a serpate terminal to ensure both are running

#### Frontend 

```bash
cd frontend
pnpm install
```

```bash
pnpm dev
```

Frontend is running on <http://localhost:3000>

#### Backend

```bash
cd backend
bundle install
rails db:create
rails db:migrate
```

```bash
rails server 
# or 
rails s
```

API is running on <http://localhost:3002>


Open <http://localhost:3000> in a browser to see working app


## Tests

### Backend
```bash
   cd backend
   bundle exec rspec
```
### Frontend

Sadly no frontend tests



