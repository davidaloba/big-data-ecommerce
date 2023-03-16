/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./packages/**/*.{js,ts,jsx,tsx}', './pages/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
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