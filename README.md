# VHS STORE

* Ruby version - 2.5.7

## Getting started

`bundle install`

### Database creation

`rake db:create`

`rake db:migrate`

### Functionality
#### Build the following functionality:

### Rental
#### Rental#due_date - returns a date one week from when the record was created
#### Rental.past_due_date - returns a list of all the rentals past due date
### Client
#### Client.most_active - returns a list of top 5 most active clients (i.e. those who had the most non-current / returned rentals)
#### Client#favorite_genres - lists three genres that the client rented the most
#### Client.non_grata - returns a list of all the clients who have a vhs past the due date (or, more difficult: who ever missed the return date)
#### Client#return_one - accepts an argument of a movie instance, finds the corresponding rental and updates the rental's current attribute from true to false
#### Client#return_all- updates current attribute from true to false on all client's rentals
#### Client.paid_most - returns an instance who has spent most money at the store; one rental is $5,35 upfront (bonus: additional $12 charge for every late return — do not count those that have not yet been returned)
#### Client.total_watch_time - returns an Integer of all movies watched by the all clients combined (assume that a rented movie is a watched movie)
## Vhs
#### Vhs.most_used - prints a list of 3 vhs that have been most rented in the format: "serial number: 1111111 | title: 'movie title'
#### Vhs.all_genres - returns a list of all genres available at the store
#### Vhs.available_now - returns a list of all vhs currently available at the store
#### Vhs.hot_from_the_press - accepts arguments used to create a new instance of a Movie and a name of a genre; creates the movie, associates it with appropriate genre and creates three instances of a vhs associated with that Movie
## Movie
#### Movie.most_clients - returns a list of TOP3 All Time favorites based on number of different clients who watched it
#### Movie.most_rentals - returns a list of TOP3 All Time favorites based on number of rentals
#### Movie.newest_first - returns a list of all the movies from the most recent ones to the oldies but goldies based on the release year
#### Movie.longest - returns a list of the movies from the longest to the shortest
#### Movie#recommendation - prints a recommendation that includes a random emoji, the movie description, its length, director and year of release
#### Movie.surprise_me - prints a recommendation for a random movie
#### Movie#report_stolen - deletes a random vhs instance associated with this movie that's currently not rented out and prints information: "THANK YOU FOR YOUR REPORT. WE WILL LAUNCH AN INVESTIGATION."
## Genre
#### Genre.most_popular - returns a list of 5 most popular genres based on number of movies
#### Genre.longest_movies - returns a genre whose movies length average is the highest
## Non-model
#### shop_fun_statistics - should print out information about the store: how many vhs there are in total, how many clients, how many movies available at this store (not all Movies in the database are available), how many genres, how much time clients watched the movies in total, what genre is the most popular among the clients, etc.