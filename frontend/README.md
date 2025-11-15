# Frontend Project with Tailwind CSS

A modern frontend project built with Tailwind CSS for rapid UI development.

## Features

- ✨ Tailwind CSS for utility-first styling
- 🎨 Custom components and utilities
- 📱 Responsive design
- 🚀 Fast development workflow
- 🛠️ PostCSS for CSS processing

## Prerequisites

- Node.js (v14 or higher)
- npm or yarn

## Installation

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

## Usage

### Development

To build the CSS once:
```bash
npm run build
```

To watch for changes and rebuild automatically:
```bash
npm run dev
```

### Viewing the Site

After building the CSS, open `src/index.html` in your browser to view the site.

For a better development experience, you can use a local server:
```bash
# Using Python 3
python3 -m http.server 8000

# Using Node.js (install http-server globally first: npm install -g http-server)
http-server ./src -p 8000
```

Then navigate to `http://localhost:8000` in your browser.

## Project Structure

```
frontend/
├── src/
│   ├── index.html      # Main HTML file
│   ├── input.css       # Tailwind CSS input file with directives
│   ├── output.css      # Generated CSS (copied from public/)
│   └── app.js          # JavaScript functionality
├── public/
│   └── output.css      # Generated CSS (created by build)
├── node_modules/       # Dependencies
├── postcss.config.js   # PostCSS configuration
├── package.json        # Project dependencies and scripts
└── README.md          # This file
```

## Customization

### Tailwind CSS

This project uses Tailwind CSS v4. To customize your styles, edit `src/input.css` and add your custom classes using the `@apply` directive.

### Custom CSS

Add your custom styles in `src/input.css`. You can use Tailwind's `@apply` directive to create reusable component classes.

## Available Scripts

- `npm run build` - Build CSS once
- `npm run dev` - Watch and rebuild CSS on changes
- `npm run build:css` - Alias for build

## Tailwind CSS Resources

- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Tailwind CSS Components](https://tailwindui.com/components)
- [Tailwind CSS Playground](https://play.tailwindcss.com/)

## License

ISC
