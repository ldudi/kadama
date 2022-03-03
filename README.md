# kadama

## Project Details

Created a Pokemon encyclopedia that allows you to search for a Pokemon and displays information about it using the JSON endpoint provided below. For each Pokemon, list its name, number, an image of it, and some abilities. A user of the app can search by name or any other attributes like the Pokemon's abilities. There is also be a way to sort the Pokemon results by name or number (a-z, 1-N).

This code handle any errors caused by the endpoint (for example network timeouts) effectively. It does not waste network bandwidth by loading too much data at once, and only when needed. we can assume all the data will never change, so once its loaded it dos not need to fetch it again. While the content is being fetched, you should display to the user a nice loading indicator. If there is an error retrieving a piece of data, have a placeholder.

Once data is fetched, it do persist on the device. Coredata used as storage, caching, and network API for storing and fetching data without using a 3rd party API.

Every time the app launches, data is loaded as reasonable amount of data from local storage and fetched 10 unique Pokemon from the endpoint *(all Pokemon name's are unique and can be used as a unique ID)*. Paging is utilized for an optimal experience. fetching is limited up to 300 Pokemon.

### Technical details (this project contains all of this)
- Networking
    - Concurrency
    - Callbacks
    - Codable protocols
    - URL requests
- Good architecture and code design
    - Separation of responsibilities
    - Proper optional and error handling
- Caching / Storage
    - Proper usage of memory and disk
    - Data persistance
- UI
    - Creating tableview from scratch
    - Proper registration of cell class
    - Reusable cells
    - Creating custom classes
    - Protocol implementation
    - Data source
    - Delegation
- Optimization
    - Pull to refresh a view with data
    - Infinite scroll
    - Search results

https://pokeapi.co/api/v2/pokemon/
