module.exports = {
  apps: [
    {
      name: 'rails_server',
      script: 'bundle exec puma -C config/puma.rb',
      exec_mode: 'fork',
      instances: 1,
      autorestart: true,
      watch: false,
      env: {
        PORT: "3000",
        RAILS_ENV: "development"
      }
    },
    {
      name: 'tailwind_watch',
      script: 'bundle exec rails tailwindcss:watch',
      exec_mode: 'fork',
      instances: 1,
      autorestart: true,
      watch: false,
      env: {
        RAILS_ENV: "development"
      }
    }
  ]
};
