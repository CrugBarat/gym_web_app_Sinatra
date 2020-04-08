#Gym.

Gym. is an app I created using the following:

**Programming Language**: Ruby
**Database Management System**: PostgreSQL
**Web App Framework**: Sinatra
**Markup/Styling**: HTML5/CSS3

The project was tasked to me by CodeClan, Glasgow where I studied towards a PDA Level 8 in Professional Software Development. I was given 5 days to complete it. The project spec can be found below.


#CodeClan - Gym Spec

A local gym has asked you to build a piece of software to help them manage memberships and register members for sessions.

**MVP**:
- The app should allow the gym to create and edit Members
- The app should allow the gym to create and edit Sessions
-	The app should allow the gym to book members on specific sessions
-	The app should show a list of all upcoming sessions
-	The app should show all members that are booked in for a particular class

**Possible Extensions**:
-	Sessions could have a maximum capacity, and users can only be added while there is space remaining.
- The gym could be able to give its members Premium or Standard membership. Standard members can only be signed up for sessions during off-peak hours.
- The Gym could mark members and sessions as active/deactivated. Deactivated members/sessions will not appear when creating bookings.ß

[Download](https://github.com/CrugBarat/my_files/blob/master/codeclan_week5_project_spec.pdf?raw=true)


#About the App

The 'Admin.' section of the web app is accessed via the 'spanner' icon in the navbar. Typically this section would be password protected, which provides a quasi-CMS for Gym. employees. This section allows users to create/view/edit members, sessions, studios, instructors, equipment and bookings.

The 'Member.' section of the app is accessed via the 'home' & 'face' icons in the navbar. These sections allow members to signup, view sessions/studios/equipment and book sessions.


#Development

Developing the app was an enjoyable experience and allowed me to utilise all the knowledge and training I received during my time studying the Ruby module at CodeClan.

**Planning Techniques**:
- Case Diagram
- Object Diagram
- Class Diagram
- Activity Diagram
- Implementations Constraints Plan
- User Site Map
- Wireframe Diagrams

**The Spec**:
All requirements of the spec were fulfilled.

**Additional Extensions**:
Extensions designed and executed by me included:
- create/edit/view instructors, rooms and equipments
- Member Interface
- Interactive Calendar on Homepage

**Challenges**:
- Utilising data stored and retrieved from a database using types such as date/time. Managing, sorting and displaying this data in the most user-friendly way possible.
- Preventing standard members from booking Premium sessions.
- No HTML/CSS was taught as part of the course so the styling of the app was self-taught during the 5 days allowed to complete the project. Styling challenges included; flexbox, parallax image, scaling for mobile.


#App Setup

If you would like to use or explore the app, please complete the following steps:

**MAC OS**:

- Clone/save the repository

- Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/) and [PostgreSQL](http://www.postgresqltutorial.com/install-postgresql/)

**In Terminal**:

- Install Sinatra

```
gem install sinatra

```

- Create a gym database

```
createdb gym

```

- Access the gym directory and create the database tables

```
psql -d gym -f db/gym.sql

```
- Populate the tables

```
ruby seeds.rb

```

- Run the app

```
ruby app.rb

```

**In Browser (Recommended: Google Chrome)**:

- Access the app

http://localhost:4567

- Exiting the app from terminal

CTRL + C

- Close browser
