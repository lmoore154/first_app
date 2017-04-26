- Welcome message from "/"
- Personalized greeting from "/<name>"
- Retrieves preset ipsums
  - "/adev" for Arrested Developement
  - "/futurama" for Futurama
  - "/tina" for Tina from Bob's Burgers
- Specify number of times for ipsums to print with "/<ipsum_name>/num> (i.e., "/tina/4")
- Allows posting of ipsums to database
- Retrieve posted ipsums with "/lorem/<ipsum_id>" (i.e., "/lorem/2")
- All ipsums rendered in JSON


EXPLORER MODE
- A sinatra app with three endpoints (all just rendering text):
- Index: GET "/", returns a welcome message
- Show: GET "/billy", returns a specializaed welcome message for whatever name is passed to it as a param
- Lorem: GET "/lorem/standard", returns lorem ipsum of the type requested
- Complete the test suite to test the lorem endpoint.

Adventure mode
- Rather than hard-coding the lipsums, create a database table to hold them in sqlite3 and create an ActiveRecord model to represent them.
- Use a migrations file for the above.

Epic mode
- A POST request to "/lorem/new" with a request body like the below should add a new lipsum to the application (and the database table you made in Adventure Mode).

{"name" : "namegoeshere", "paragraph" : "text goes here"}

- Add a test to your test suite for this as well.

Legendary Mode
- Rather than rendering plain text, render json instead.
