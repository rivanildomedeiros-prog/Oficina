import type { Config } from 'tailwindcss';

const config: Config = {
  content: [
    './app/**/*.{js,ts,jsx,tsx}',
    './pages/**/*.{js,ts,jsx,tsx}',
    './components/**/*.{js,ts,jsx,tsx}',
    './lib/**/*.{js,ts,jsx,tsx}',
    './hooks/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['var(--font-sans)', 'sans-serif'],
        mono: ['var(--font-mono)', 'monospace'],
      },
      colors: {
        indigo: {
          50: '#F0F4FF', // Very soft tint of Cornflower
          100: '#E1E8FE',
          200: '#C7D5FD',
          300: '#A7BCFB',
          400: '#829DF7',
          500: '#6495ED', // Cornflower Blue
          600: '#6495ED', // Primary accent
          700: '#4E7CD6', // Darker text contrast element
          800: '#3962BE',
          900: '#2649A3',
          950: '#172F75',
        },
        blue: {
          50: '#F0F4FF',
          100: '#E1E8FE',
          200: '#C7D5FD',
          300: '#A7BCFB',
          400: '#829DF7',
          500: '#6495ED',
          600: '#6495ED',
          700: '#4E7CD6',
          800: '#3962BE',
          900: '#2649A3',
          950: '#172F75',
        },
      },
    },
  },
  plugins: [],
};

export default config;
