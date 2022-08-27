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
      sans: ['Lato', "Noto Sans SC", "-apple-system", 'sans-serif'],
    },
    extend: {
      spacing: {
        '128': '32rem',
        '144': '36rem',
      },
      borderRadius: {
        '4xl': '2rem',
      },
      animation: {
        'search': 'searchShow .2s both',
      },
      zIndex: {
        '999': '999',
        '-1': '-1'
      },
      transformOrigin: {
        '50': '50% 50%',
        'full': '100%',
      },
      filter: {
        '60': 'brightness(0.6)',
      },
      boxShadow: {
        'lx': '0 1px 40px -8px rgb(0 0 0 / 50%)',
        'none': 'none',
      },
      maxWidth: {
        '16': '16rem',
      },
      margin: {
        'card': '68px auto 0',
        'avatar': '-52px 8px 4px',
      },
    },
    rotate: {
      '-45': '-45deg',
      '-90': '-90deg',
      '90': '90deg',
    },
    minHeight: {
      '100': '100px'
    },
    maxHeight: {
      '200': '200px'
    },
    transform: {
      '-half': 'translate(-50%,-50%)',
    },
  },
  variants: {
    // textColor: ['dark'],
    // textOpacity: ['dark'],
    // backgroundColor: ['dark'],
  },
  plugins: [
    require('@tailwindcss/line-clamp'),
    // require('tailwindcss-dark-mode')()
  ],
}
