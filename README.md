![Let's Build: With Ruby on Rails - Discussion Forum](https://i.imgur.com/GA9Azed.jpg)

# Let's Build: With Ruby on Rails - Discussion Forum

Continuing my long stent of Ruby on Rails builds is yet another build which focuses more on relationships in a real-world discussion forum application.

The application on the outside looks a little bleak but I promise there is a lot going on under the hood of which you could extend to be something very feature rich. 

Follow along with more videos on [YouTube](https://www.youtube.com/playlist?list=PL01nNIgQ4uxNkDZNMON-TrzDVNIk3cOz4) or my [original blog post](https://web-crunch.com/lets-build-with-ruby-on-rails-discussion-forum) and be sure to download the source code on this repo to both explore the application and refer to it as you build alongside me.

If you enjoy these Let's Builds I can't thank you enough for tuning in. I hate asking for anything in return so only if you insist you can [buy my a coffee](https://buymeacoff.ee/webcrunch) to keep these going. Also, be sure to subscribe to my [YouTube channel](https://youtube.com/c/webcrunch) and [newsletter](https://web-crunch.com/subscribe) for automatic updates. 

# Discussion Forum

A modern discussion forum built with Ruby on Rails, featuring real-time updates, Markdown support, and administrative controls.

## Features

- User authentication with Devise
- Channel-based discussions
- Real-time replies with AJAX
- Markdown support with syntax highlighting
- Admin dashboard for content management
- Mobile-responsive design with Tailwind CSS
- SEO-friendly URLs with FriendlyId

## Requirements

- Ruby 3.0.0 or higher
- Rails 7.0.0 or higher
- PostgreSQL
- Node.js 14+ and Yarn

## Installation

1. Clone the repository:
```bash
git clone [repository-url]
cd discussion-forum
```

2. Install dependencies:
```bash
bundle install
yarn install
```

3. Setup database:
```bash
rails db:create
rails db:migrate
rails db:seed
```

4. Start the server:
```bash
bin/dev
```

The application will be available at http://localhost:3000

## Testing

Run the test suite with:
```bash
bundle exec rspec
```

## Deployment

This application is configured for deployment on Render.

1. Create a new Web Service on Render
2. Connect your GitHub repository
3. Set the following environment variables:
   - `RAILS_MASTER_KEY`
   - `DATABASE_URL`
   - `RAILS_ENV=production`

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE.md file for details 
