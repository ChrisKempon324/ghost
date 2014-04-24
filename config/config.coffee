module.exports =
  MONGO_URL: 'mongodb://localhost/ghost' # mongodb 地址 for develop

  SECRET: '#Ac49&2K' # session加密信息

  JS_VER: '1.0.0' # js版本号
  JS_ENVI: 'source' # js环境

  COOKIE_SETTING: {maxAge: 3 * 24 * 3600000, httpOnly: true} # cookie设置

  # redis本地配置
  REDIS_HOST: '127.0.0.1'
  REDIS_PORT: '6379'

  # 开发环境
  ENV: 'development' # 开发环境
  # ENV: 'product' # 身材环境


  # Socket调试开关
  SOCKET_DEBUG: false
