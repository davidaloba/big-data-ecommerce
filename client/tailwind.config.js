/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./packages/**/*.{js,ts,jsx,tsx}', './app/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      screens: {
        '2xl': '1366px',
        // => @media (min-width: 1366px) { ... }

        '3xl': '1440px',
        // => @media (min-width: 1440px) { ... }

        '4xl': '1920px'
        // => @media (min-width: 1920px) { ... }
      },
      colors: {
        primary: {
          DEFAULT: '#e27d60',
          light: '#e48a6f',
          darker: '#cb7056',
          text: '#FFFFFF',
          lightest: '#f0beaf'
        },
        secondary: {
          DEFAULT: '#41b3a3',
          light: '#85dcb',
          darker: '#3aa192',
          text: '#FFFFFF',
          lightest: '#ecf7f5'
        },
        muted: {
          DEFAULT: '#E5E7EB',
          light: '#F3F4F6',
          darker: '#D1D5DB',
          text: '#555b66'
        }
      }
    }
  },
  plugins: []
}
