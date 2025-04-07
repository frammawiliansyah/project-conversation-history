# Project Conversation History

A simple Rails app to record and display project conversation history.

## Prerequisites

Make sure you have the following installed on your system:

- **Ruby**: Refer to the `.ruby-version` file in this project.
- **Bundler**: To manage Ruby gem dependencies.
- **PostgreSQL**: As the database used for this project.

## Setup Instructions

Follow these steps to run the project locally:

1. **Clone this repository**:

   ```bash
   git clone https://github.com/frammawiliansyah/project-conversation-history.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd project-conversation-history
   ```

3. **Install Ruby dependencies**:

   ```bash
   bundle install
   ```

4. **Set up the database**:

   Ensure PostgreSQL is installed and running, then run:

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Start the development server**:

   ```bash
   rails server
   ```

   The app will be accessible at `http://localhost:3000`.

## Usage

Once the server is running, visit `http://localhost:3000` in your browser. You can create and manage projects, add comments, and view status change history.

## Demo

You can view the deployed version of this project here:

[Live Demo](https://conversation-history-project.framma.id)

## Contributing

Contributions are welcome! Feel free to fork the repository and submit a pull request with your improvements.

## License

This project is licensed under the [MIT License](LICENSE).
