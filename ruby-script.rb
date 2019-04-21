require 'watir'
require 'json'


json = File.read('login.json')
login = JSON.parse(json)
data.keys

browser = Watir::Browser.new
browser.goto 'https://www.linkedin.com/uas/login?trk=guest_homepage-basic_nav-header-signin'


browser.text_field(id: 'username').set data["email"]
browser.text_field(id: 'password').set data["password"]
browser.button(value: 'Sign in').click
browser.link(href: '/messaging/').click
browser.link(href: '/messaging/compose/').click
browser.text_field(class: ["msg-connections-typeahead__search-field", "msg-connections-typeahead__search-field--no-recipients", "ml1"]).set 'Michael "Fritz" Fritzius'
browser.div(class: "msg-connections-typeahead__search-result-background-img EntityPhoto-circle-2 flex-shrink-zero ember-view"){:enter}.click
browser.div(class: ["msg-form__contenteditable t-14 t-black--light t-normal flex-grow-1"]){:p}.send_keys 'Hey Michael its Kevin from SavvyCoders'
browser.button(value: 'Send').click
