# My Details 
    Below will explain installation under #  Instructions. Once complete, if you go to http://localhost:4000 it will 
    have example links to choose from and even more simple documentation.
 
    I have used Elixir 1.6.6 version with Postgres and the latest version of Phoenix framework.
    
	As examples for this project, I included queries that vary with the usage of Ecto to display multiple
    ways and at times syntax choices that can be done here.

 	 
# Instructions

To start your Phoenix server:
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Seeding. `mix run priv/repo/seeds.exs`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


# Assumptions and time acomplishments
    I wanted to do this task in a functional programming language and an mvc so I choose Elixir and Phoenix Framework.
    If I had time, I would have liked to have done range with the Postgrex(spelt right) wrapper to allow access to special postgres
    types using Ecto.type.


# Question 8: 
    My current application uses belongs_to and has_many and is possible to do has_many through with an inbetween database for
    one-click relationships. Relationable databases are pretty well defined (bit more restrictive) 
	but Nosql has a bit more scalability when it comes to adding more data fields without affecting the current data structure 
	but can get cluttered if not maintained.


# Question 9: 
     Erlang and Elixir applications were built to handle soft realtime, concurrent applications.
     Because we are doing one-click ship, it's best for the items to be sold first come first served checkout until the item(s) sell out.
     Would be best to use machine learning to determine if the item availabilty is a bit further from the customer, and might
     take longer for delivery, to utilize resources where items might be more abundant during times of high demand. Possible to
     have quantity limits per customer if it's a must. Try to keep customers happy with best chances of obtaining their order.




Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


