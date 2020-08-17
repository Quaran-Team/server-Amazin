# server-Amazin

This is the server (back-end) side of our Amazin' project created by Talent Path's 'Quaran-Team!' of full stack developers.

<!-- Picture below of home page of our Amazin' App  -->

![alt text](https://github.com/Quaran-Team/client-Amazin/blob/master/amazinscreen.JPG "Screen shot from the Amazin' App mock e-commerce site")

---

The goal was to practice weekly agile sprints by creating an e-commerce product page(s) for 20-50 items in a very similar theme to that big one named after the giant river in South America.

Each team member has made contributions to both client (front - end) and server (back - end) sides of the project connecting their data to their components.

The client side can be found here _-_ GitHub Repo = https://github.com/Quaran-Team/client-Amazin .

And live deployed at ... {}.

---

We created the server in Java using Spring-Boot. Using Maven for our dependencies and Fly Way to manage our data migrations. 

Due to time constraints some parts are just static mocks, while others are fully dynamic.


---

To run it locally:
Before cloning down install Java (version 8 or higher), Install Maven, Install Postgres and PgAdmin

- clone down the repo

- run the program either in an ide (we used either intelli-J or vs code) by opening the folder you just cloned down into one and clicking the little green play button arrow for the file ApiApplication.java ... or ...

via CLI

- make sure you cd into the folder named API then in command line use 

 ```'mvn spring-boot:start'```

If updates have been made to the sql seed files a migration clean should be preformed.
This involves running the commands 

```'mvn flyway:clean' ```

followed by

``` 'mvn clean' ```

before starting the server.

If you get an error command not found MVN you will need to download and install it locally which can be done here: https://maven.apache.org/download.cgi

To see the raw Json while the server is running visit "http://localhost:8080/api/v1/items" or "http://localhost:8080/api/v1/totalstars/"



---

**The Quaran-Team! consists of:**

- Bilikis Orulebaja
  - https://github.com/borulebaja
- Brandt Campbell
  - https://github.com/Reboot82
- Brian Loveless
  - https://github.com/BrianLoveGa
- Juan Avalo-Santiago
  - https://github.com/avalojc
- Michal Terranova
  - https://github.com/mrterranova
- Neely Mann
  - https://github.com/NeelyAnne
- Trevor Taylor
  - https://github.com/Trevis42

**Led by management team:**

Fred Zirdung and Jothi Nedungadi

## **Languages/Technologies:**

- Java
- Spring-Boot
- Maven
- Fly Way
- PostgreSQL
- Pg-Admin
- Lombok
- Apache
- Velocity

---

All rights reserved by Talent Path 2020
a division of Genuent.

https://talentpath.com/what-we-do/

https://genuent.com/
