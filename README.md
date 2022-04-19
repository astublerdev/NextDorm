Project Description
===

# NextDorm

## Week 2 Progress gif
<img src='https://github.com/astublerdev/NextDorm/blob/main/TabbedNavigation.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Week 1 Progress gif
<img src='https://github.com/astublerdev/NextDorm/blob/main/NextDormLogin.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview

### Team member information 
Members:
Anna Stubler - astubler@csumb.edu
Daisy Rocha-Montanez - drochamontanez@csumb.edu

### Description
An application similar to NextDoor and MyRaft’s feed function, but for on campus housing. Users can post or read posts in categories of general, lost and found, or for sale. They can also complete roommate matching (which will be similar to a dating profile).

### App Evaluation
- **Category:** Social Media / Lifestyle
- **Mobile:** This app is developed for mobile first, but could be extended to a desktop version.
- **Story:** Users can connect with others living in CSUMB’s dorms in order to find lost goods, buy unused items, or find potential roommates.
- **Market:** An individual with a csumb email can sign up for this app. They also have to agree to community guidelines before signing up.
- **Habit:** This app could be used daily or as needed. Because it serves essential functions for students living on campus and new posts pop up every day they will be attracted to return to the app. In the future settings could alert them when there is a new post or someone likes their roommate profile.
- **Scope:** First we would start with an app where users can post or read posts in categories of general, lost and found, or for sale. Additionally, they can complete roommate matching. Later a chat feature could be added as well as integration with CSUMB’s housing portal or ways to report/submit work orders for campus housing.

## Product Spec
### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Login/Logout/Create Account
* General feed
* Lost and found feed (similar to Instagram with photos and commenting)
* Roommate Profiles (a feed of people who list where they are looking to live (on campus, off campus) and what they are like (messy, clean, night-owl))
	* Users can like other users profiles
	* Clicking on the likes shows a list of people who have liked the profile

**Optional Nice-to-have Stories**
* Settings
	* Change password
	* View emails of people who have liked roommate profile
* Delete roommate profile

### 2. Screen Archetypes

- [x] Login  - User logs into their account
   * Login persists when app is reopened until signout
- [x] Create Account  - User creates account
   * Must agree to community guidelines
- [x] Register - User signs up with csumb email
   * validate email has csumb
- [x] Navigation - Tabbed Navigation
- [ ] Main Feed - General chatter about housing (complaints, questions, etc.)
   * Allows for commenting and liking posts
   * No images only text
- [ ] Lost and Found
   * Allows for commenting
- [ ] Lost and Found - Add a Post
   * Allows user to upload a photo 
- [ ] For Sale
   * Similar to the Lost and Found, but for for sale items
- [ ] For Sale - Add a Post
   * Allows user to upload a photo 
- [ ] Roommate Profile
   * Allows uploading a photo and prompts user to fill out a variety of fields describing themselves
   * Users can like other users’ profiles
   * Users can view who has liked someone’s post
- [ ] Roommate Profile - Add a Post
  * Allows uploading a photo and prompts user to fill out a variety of fields describing themselves
  * Checks the user doesn’t already have a profile 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home feed
* Lost and Found
* For Sale
* Roommate profile

Optional:
* Settings

**Flow Navigation** (Screen to Screen)
* Log-in/Create Account -> Home feed
* Home feed -> Lost and Found OR For Sale OR Roommate profile
* Lost and Found -> Add a Post
* For Sale -> Add a Post
* Roommate Profile -> Add a Post
* Roommate Profile -> List of Likes

## Wireframes
<img src='https://github.com/astublerdev/NextDorm/blob/main/Wireframe.jpg' title='Wireframes' width='' alt='Wireframes' />

### [BONUS] Digital Wireframes & Mockups

Check back soon

### [BONUS] Interactive Prototype

Check back soon

### Team Contribution

* Login  - Daisy
* Main Feed - Daisy
* Lost and Found - Daisy
* Lost and Found (Add a Post) - Anna
* For Sale - Daisy
* For Sale (Add a Post) - Anna
* Roommate Profile - Anna
* Roommate Profile - Anna

### Tentative Schedule
* Design Week 1
* Design Week 2
* Create user account
* User can log into account
* User can view different feeds
* User can create posts


## Schema 
### Models
#### Post

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | author        | Pointer to User| post author |
   | image         | File     | image that user posts |
   | caption       | String   | image caption by author |
   | comments      | Array    | list of comments that has been posted to an image |
   | likesCount    | Number   | number of likes for the post |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |

#### User
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user post (default field) |
   | username      | String   | username |
   | password      | String   | passord  |
   | email         | String   | email |
   | createdAt     | DateTime | date when user is created (default field) |
   | updatedAt     | DateTime | date when user is last updated (default field) |
   
#### Comments
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | post          | Pointer to User| comment author |
   | author        | Pointer to User| image author |
   | text          | String   | text  |
   | createdAt     | DateTime | date when user is created (default field) |
   | updatedAt     | DateTime | date when user is last updated (default field) |
### Networking
#### List of network requests by screen
   - Home Feed Screen, For Sale Screen, Lost & Found Screen, Roommates
      - (Read/GET) Query all posts sorted by most recent
      - (Create/POST) Create a new like on a post
      - (Delete) Delete existing like
      - (Create/POST) Create a new comment on a post
      - (Delete) Delete existing comment
   - Create Post Screens
      - (Create/POST) Create a new post object


