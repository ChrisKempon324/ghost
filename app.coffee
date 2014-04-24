express           = require 'express'
http              = require 'http'
path              = require 'path'
favicon           = require 'static-favicon'
logger            = require 'morgan'
cookieParser      = require 'cookie-parser'
bodyParser        = require 'body-parser'
expressHandlebars = require 'express3-handlebars'
config            = require './config/config'
RedisStore        = require('connect-redis')(express)

# 启动server
app = express()

# view engine setup
app.set 'views', path.join(__dirname, 'views')
app.set 'view engine', 'handlebars'
app.engine 'handlebars', expressHandlebars({layout: false})

# server application port
app.set 'port', process.env.PORT || 6000

app.use favicon()
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded()
app.use cookieParser()
app.use express.static(path.join(__dirname, 'public'))

# 路由中间件
app.use app.router

# session 中间件
app.use(express.session(
  secret: config.SECRET
  store: new RedisStore(
    host: config.REDIS_HOST
    port: config.REDIS_PORT
    ttl: 3 * 24 * 60 * 60
    db: 2
  )
))

# 路由解析
require('./routes')(app)

# catch 404 and forwarding to error handler
app.use(() ->
  res.render '404'
)

# error handlers
# development error handler
# will print stacktrace
if app.get('env') is 'development'
  app.use((err, req, res, next) ->
    res.render '404'
  )

# production error handler
# no stacktraces leaked to user
app.use((err, req, res, next) ->
  res.render '404'
)

# listen the port
app.listen(app.get('port'))
console.log "Epxress start on port #{app.get('port')}"

module.exports = app
