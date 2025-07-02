## Client Test Project

This codebase is from a real test project for a potential client.

#### Requirement
* Show a list of plugins (each with a name, version number, and install status)  
* Include a “Sync” button that simulates updating the plugin list  
    * When clicked, it should:  
        1. Show a loading state (spinner or message)  
        2. Wait 1–2 seconds (simulate a background sync)  
        3. Then modify the list (e.g. change a version number, add/remove a plugin, update install status)  
* The app must stay responsive during sync — no freezing or UI blocking 