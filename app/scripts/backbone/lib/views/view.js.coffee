@XRG.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  _remove = Marionette.View::remove

  _.extend Marionette.View::,

    addOpacityWrapper: (init = true, options = {}) ->
      _.defaults options,
        className: "opacity"

      @$el.toggleWrapper options, @cid, init

    remove: (args...) ->
      console.log "removing", @
      fadeOutTime = 400

      if @model?.isDestroyed?()

        wrapper = @addOpacityWrapper true,
          backgroundColor: "red"

        wrapper.fadeOut fadeOutTime, ->
          $(@).remove()

        @$el.fadeOut fadeOutTime, =>
          _remove.apply @, args
      else
        _remove.apply @, args

    templateHelpers: ->

      linkTo: (name, url, options = {}) ->
        _.defaults options,
          external: false

        url = "#" + url unless options.external

        "<a href='#{url}'>#{@escape(name)}</a>"