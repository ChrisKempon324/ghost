module.exports = (app) ->
  app.get '/', (req, res) ->
    res.end 'hello world'
