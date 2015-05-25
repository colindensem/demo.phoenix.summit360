exports.config = {
  // See http://brunch.io/#documentation for docs.
  //
  files: {
    javascripts: {
      joinTo: 'js/app.js',
      order: {
        before: [
          /^bower_components/,
          /^web\/static\/vendor/
        ]
      }
    },
    stylesheets: {
      joinTo: 'css/app.css'
    },
    templates: {
      joinTo: 'js/app.js'
    }
  },

  // Phoenix paths configuration
  paths: {
    // Which directories to watch
    watched: ["web/static", "test/static"],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/^(web\/static\/vendor)/]
    }
  }
};
