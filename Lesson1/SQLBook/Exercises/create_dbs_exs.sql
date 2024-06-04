From the Terminal, create a database called database_one.
  createdb database_one

From the Terminal, connect via the psql console to the database that you created in the previous question.
  psql -d database_one

From the psql console, create a database called database_two.
  CREATE DATABASE database_two;

From the psql console, connect to database_two.
  \c database_two

Display all of the databases that currently exist.
  \list

From the psql console, delete database_two.
  \c database_one
  DROP DATABASE database_two;

From the Terminal, delete the database_one and ls_burger databases.
  DROP DATABASE database_one;
  DROP DATABASE database_two;

