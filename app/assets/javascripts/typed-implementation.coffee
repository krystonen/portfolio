ready = ->
  new Typed '.element',
    strings: [
      'I created this website to showcase some of my web development projects',
      "and to share my story how I transitioned my hobby into a career."
    ]
    typeSpeed: 50
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
