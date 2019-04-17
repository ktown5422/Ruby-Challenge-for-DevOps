require 'watir'
require 'json'


json = File.read('Documents\login.json')
login = JSON.parse(json)

email_user = login['email']
password_user = login['password']


browser = Watir::Browser.new
browser.goto 'https://www.linkedin.com/uas/login?trk=guest_homepage-basic_nav-header-signin'


browser.text_field(id: 'username').set 'ktown5422@gmail.com'  
browser.text_field(id: 'password').set 'password_user'
browser.button(value: 'Sign in').click
browser.link(href: '/messaging/').click
browser.link(href: '/messaging/compose/').click
browser.text_field(class: ["msg-connections-typeahead__search-field", "msg-connections-typeahead__search-field--no-recipients", "ml1"]).set 'Michael "Fritz" Fritzius'
browser.div(class: ["msg-form__contenteditable t-14 t-black--light t-normal flex-grow-1"]).set 'Hey Michael its Kevin from SavvyCoders'
browser.button(value: 'Send').click
