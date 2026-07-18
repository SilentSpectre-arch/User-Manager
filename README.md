# User Manager

A Bash script that simplifies user administration through an interactive command-line interface. It allows system administrator to manage user accounts by performing common administrative tasks such as creating, deleting, locking, unlocking, and managing user passwords.

## Features

- Add a new user
- Delete an existing user
- Lock a user account
- Unlock a user account
- Change a user's password
- Display user information
- List all system users
- Interactive menu-driven interface
- User existence validation
- Root privilege verification for administrative tasks

## Usage

```bash
chmod +x user-manager.sh
sudo ./user-manager.sh
```

> **Note:** Running the script with `sudo` is recommended because most user management operations require root privileges.

## Tech Stack

- Bash Shell Scripting
- Linux User Management Utilities
- GNU Core Utilities

## Linux Commands Used

- `useradd` / `adduser`
- `userdel`
- `usermod`
- `passwd`
- `id`
- `getent`
- `less`

## Project Structure

```text
User-Manager/
|------ user-manager.sh
|------ README.md
|------ LICENSE
```

## Notes

- Designed for Linux systems.
- Most operations require root privileges.
- Uses `getent` to retrieve user account info.
- Uses standard Linux user managemet commands.
- No external dependencies are required.

## Author

Made with ❤️ for linux system administration and Bash scripting.