# Swivel Coding Challenge
This README would normally document whatever steps are necessary to get the
application up and running.

## Tabel of Content

1. Ruby Version
2. Installation
3. Starting the server
4. API Endpoints
  - Index
  - Create
  - Update
  - Show
  - Destroy
5. Elasticsearch
6. Test Cases

## Ruby Version

To run this application you need to have ruby version of 3.2.2.

## Installation

To install all the system dependency and gems is required to start the application. Run the below command
```http 
bundle install
```
To create database in the application.
```http 
rails db:create
```
To create required tables in the database in application.
```http 
rails db:migrate
```

To sample data in the tables by using faker gem.
```http 
rails db:seed
```

## Start the server

To the server of the application run below command.
```sh
rails server
```
### Authenciate the user and Get Access Token:
You need to get the authenciation token by hitting below URL from the Postman. You need to opt for "raw" from the body section. 
```http
  POST /oauth/token
```

```ssh
{
  "grant_type": "password",
  "client_id": "my_uid",
  "client_secret": "my_secret",
  "email": "test@example.com",
  "password": "12345678"
}
```

Copy the URL from the access token from the response and then go to "Authorization" select "Bearer type" as type and paste the access token.

## API Endpoints
#### Index
To get all the verticals, select GET as request type and hit on below URL

```ssh
GET '/api/verticals'
```

#### Create
To create a vertical, select POST as request type and hit on below URL

```ssh
POST '/api/verticals'
```
You need to opt for "raw" from the body section.  Paste below Object in it.
```ssh 
{
  "vertical": {
    "name": "Harry",
    "categories_attributes": [
      {
        "name": "John",
        "state": "Active",
        "courses_attributes": [
          {
            "name": "Alex",
            "state": "Not Active",
            "author": "Yoram"
          }
        ]
      }
    ]
  }
}
```

### Update
To update a vertical, select Patch as request type and hit on below URL

```ssh
PATCH '/api/verticals/${id}'
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to Vertical |
| `id`      | `string` | **Required**. You need to edit id of item of category inside categories_attributes to update category.  |
| `id`      | `string` | **Required**. You need to edit id of item of course inside courses_attributes to update course. |

You need to opt for "raw" from the body section.  Paste below Object in it.

```ssh 
{
  "vertical": {
    "name": "Harry",
    "categories_attributes": [
      { 
        "name": "John",
        "state": "Active",
        "id": '1'
        "courses_attributes": [
          {
            "name": "Alex",
            "state": "Not Active",
            "author": "Yoram", 
            "id": 1
          }
        ]
      }
    ]
  }
}
```

#### Show
To get the detail of single vertical, select GET as request type and hit on below URL

```ssh
GET '/api/verticals${id}'
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to Vertical |

#### Destroy
To DELETE the single vertical, select DELETE as request type and hit on below URL

```ssh
DELETE '/api/verticals${id}'
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to Vertical |

## Elasticsearch
To search the record across all the models(Vertical, Category, Course). 

```ssh
GET '/api/search'
```
You need to select request type as 'GET' and hit on below URL With required params.
```ssh 
{
  "query": "harry"
 }
```

## Run Test Case
To run the test case. Run the below the command in the terminal.

```ssh
bundle exec rspec ./spec/controllers/verticals_controller_spec.rb
```

## Questions for future implementation 
- Things missing from the requirement.
 
 1. We can make more API for category and courses if the user wants to look at data only in these two tables. Suppose if the user wants to look at the name in category and courses we can make a search API for that
 2. We can make a Direct API for existing categories and course to update them by fetching their ids.

- How does your solution perform? 

 1. Response Time: Measure the time taken by the application to respond to requests under different loads. This helps assess if the application is responsive enough for users.

 
 2. Scalability: Assess how well the application scales as the user base grows. This involves testing the application under increasing loads to ensure it can handle increased traffic.

 3. Error Rate: I have measure the frequency of errors can encountered by users or occurring within the application. So I had tried to fix all the errors and bugs while testing.

 4. Database Performance: Evaluate the performance of database queries and transactions to ensure efficient data retrieval and storage.



- How does your solution scale?

  1. Vertical Scaling: My determine whether the solution can handle increased loads by upgrading the resources of the existing server, such as CPU, memory, or storage. 

  2. Horizontal Scaling: Evaluate whether the solution can be scaled horizontally by adding more instances of the application server or distributing the workload across multiple servers.

  3. Database Scaling: Assess the scalability of the database layer by considering options such as sharding, replication, or using distributed databases. Scaling the database ensures that it can handle increasing amounts of data and read/write operations without becoming any hurdle.

  4. Caching: Implement caching mechanisms to reduce the load on the server and improve response times for frequently accessed data. Caching can help alleviate pressure on the database by storing commonly accessed data in memory, reducing the need for expensive database queries.


- What would you improve next?
  Improvements to a solution can vary based on specific needs, but here are some general areas that could be considered for enhancement:

  1. Optimization: We can identify and optimize any performance hurdle in the code, database queries, or system architecture. This could involve refactoring inefficient code, optimizing database indexes, or improving caching strategies.

  2. Scalability: We can enhance the scalability of the solution by implementing horizontal scaling techniques, such as containerization with Docker or orchestration with Kubernetes. This allows the application to handle increased traffic and load by adding more instances dynamically.

  3. Security: We can strengthen the security posture of the application by implementing best practices for authentication, authorization, data encryption, and protection against common vulnerabilities such as SQL injection, cross-site scripting (XSS), and cross-site request forgery (CSRF).

  5. User Experience: We can enhance the user experience by incorporating user feedback and usability testing to identify areas for improvement. 
  



