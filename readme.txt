
Development Tools:

Frontend: Visual Studio Code 1.95.3
Backend: IntelliJ IDEA Community Edition 2024.2.1
XAMPP: v3.3.0
After installing the XAMPP program, you need to start the Apache and MySQL servers.
Next, navigate to the https://localhost/phpmyadmin page on localhost and create a new database named fakenews. Then, click on the "Import" tab and import the fakenews.sql file.
After completing these steps, you can start the server, followed by the frontend, ensuring the correct order is maintained.

For security reasons, I had to rename certain files in the backend project with .0sh and .0com extensions, such as:

FolderForMySql/database_entrypoint.0sh
server_entrypoint.0sh
mvnv.com.0com
Therefore, before use, you need to rename these files back to their original extensions. Alternatively, you can download the project from the repository:
https://github.com/hodiszilard89/szakdolgozat.git.