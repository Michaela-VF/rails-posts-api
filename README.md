
![Update 1st Post Terminal View](docs/images/Updated_Post_Terminal.png)

# ABOUT
* fields: title, body
* add: update endpoint
Focus on full CRUD (ALMOST!)

# STEPS

# TESTING
1. Turn on local host on a new terminal
    ``` rails s ```

2. Follow(/open on a browser) the given URL, it would look like the following
    ``` http://127.0.0.1:3000 ```

---
3. Open a new terminal and run the following to create the 1st post
    ``` curl -X POST http://127.0.0.1:3000/posts -H "Content-Type: application/json" -d '{"post":{"title":"1st Post:","body":"Lets see how the first posts looks like..."}}'  ```

    ![Create 1st Post Web View](docs/images/1st_Post.png)

---
4. Create a 2nd post
    ``` curl -X POST http://127.0.0.1:3000/posts -H "Content-Type: application/json" -d '{"post":{"title":"2nd Post:","body":"This is the second post thats valid, so we can start experimenting"}}' ```

    ![Create 2nd Post Web View](docs/images/2nd_Post.png)

---
3. Create an invalid post, with empty title
    ``` curl -X POST http://127.0.0.1:3000/posts -H "Content-Type: application/json" -d '{"post":{"title":"","body":"Lets see how the first posts looks like..."}}' ```

    ![Create Invalid Post with Empty Title Terminal View](docs/images/Invalid_Post_Blank_Title_Terminal.png)

---
5. Create an invalid post, without body
    ``` curl -X POST http://127.0.0.1:3000/posts -H "Content-Type: application/json" -d '{"post":{"title":"2nd Post:"}}' ```

    ![Create Invalid Post without Body Terminal View](docs/images/Invalid_Post_Without_Body_Terminal.png)

---
6. Update inexistend post
    ``` curl -X PATCH http://127.0.0.1:3000/posts/999 -H "Content-Type: application/json" -d '{"post":{"title":"1st Post - UPDATED Title!:"}}' ```

    ![Update Inexistent Post Terminal View](docs/images/Update_Inexistent_Post_Terminal.png)

---
7.   Update the 1st post
    ``` curl -X PATCH http://127.0.0.1:3000/posts/1 -H "Content-Type: application/json" -d '{"post":{"title":"1st Post - UPDATED Title!:"}}' ```



![Update 1st Post Web View](docs/images/Updated_Post_Web.png)

    
    NOTES: The post with empty title was created before modifying the migration file to not allow null data.

---
8. Delete an inexistent post
    ``` curl -X DELETE http://127.0.0.1:3000/posts/999 ```

    ![Delete Inexistent Post Terminal View](docs/images/Delete_Inexistent_Post_Terminal.png)

---
9. Delete the 1st post
    ``` curl -X DELETE http://127.0.0.1:3000/posts/1 ```

   ![Delete 1st Post Terminal View](docs/images/Deleted_Post_Terminal.png)

   ![Delete 1st Post Web View](docs/images/Deleted_Post_Web.png)

---
10. Pretty Print JSON Response (in the terminal)
    N.B: Requires jq installed.
    ``` curl http://localhost:3000/posts | jq ```

    ![Pretty Print JSON Response Terminal View](docs/images/Pretty_jq.png)
