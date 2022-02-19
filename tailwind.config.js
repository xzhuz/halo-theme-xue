module.exports = {
  darkMode: 'class',
  future: {
    // removeDeprecatedGapUtilities: true,
    // purgeLayersByDefault: true,
  },
  purge: ["./*.ftl", "./module/*.ftl", "./module/widget/*.ftl"],
  theme: {
    screens: {
      sm: '480px',
      md: '768px',
      lg: '976px',
      xl: '1440px',
    },
    fontFamily: {
      sans: ['Lato',"Noto Sans SC", "-apple-system", 'sans-serif'],
    },
    extend: {
      spacing: {
        '128': '32rem',
        '144': '36rem',
      },
      borderRadius: {
        '4xl': '2rem',
      }
    }
  },
  variants: {},
  plugins: [
    require('@tailwindcss/line-clamp'),
  ],
}
