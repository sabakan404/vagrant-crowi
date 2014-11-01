/**
 * default config
 */

module.exports = {
  app: {
    title: 'Crocos Wiki'
  },
  security: {
    confidential: '',
    passwordSeed: "j9a5gt", // please change here
    registrationMode: 'Restricted', // Open, Restricted, Closed
    registrationWhiteList: []
  },
  mongodb: {
    host: 'localhost',
    dbname: 'crowi',
    user: '',
    password: ''
  },
  searcher: {
    url: 'http://192.168.55.10' // crocos-wikis
  },
  google: {
    clientId: '',
    clientSecret: ''
  },
  facebook: {
    appId: '',
    secret: ''
  },
  session: {
    secret: 'please input here some string',
  }
}
