'use strict'

angular.module('BlockUI', [])
  .provider "$blockUI", ->

    defaults =
      # messageClass: 'blockui-message' # from user (optional) - styling purposes
      # backdropClass: 'blockui-backdrop' # from user (optional) - styling purposes
      innerHTML: 'Loading ...' # Overwrite this with your content i.e. <img src="/some/path"/>
      blockUIClass: "blockui-blocked" # this class will be appended to the body 

    # Returns the `$blockUI` service that is injected in controllers
    @$get = ["$document", ($document) ->

      body = $document.find('body')

      createElement = (className) ->
        return angular.element("<div>").addClass(className)

      BlockUI = (opts) ->
        options = @options = angular.extend({}, defaults, opts)

        console.log "blockuiservice::constructor() - options:", options

        if options.backdropClass?
          @backdropEl = createElement(options.backdropClass)
        else
          backdropCss =
            'z-index': 10001
            border: 'none'
            margin: 0
            padding: 0
            width: '100%'
            height: '100%'
            top: 0
            leff: 0
            'background-color': '#000'
            opacity: 0.6
            cursor: 'wait'
            position: 'fixed'
          @backdropEl = angular.element('<div>').css(backdropCss)

        if options.messageClass?
          @messageEl = createElement(options.messageClass)
        else
          messageBoxCss =
            'z-index': 10002
            position: 'fixed'
            'text-align': 'center'
            width: '30%'
            top: '40%'
            left: '30%'
            border: 'none'
            padding: '15px'
            backgroundColor: '#000'
            '-webkit-border-radius': '10px'
            '-moz-border-radius': '10px'
            'border-radius': '10px'
            opacity: 0.5
            color: '#fff'
          @messageEl = angular.element('<div>').css(messageBoxCss).html(options.innerHTML)
        return

      BlockUI::isBlocked = ->
        return @_blocked

      BlockUI::blockUI = () ->
        return unless not @_blocked
        self = this
        self._addElementsToDom()
        body.addClass self.options.blockUIClass
        return

      BlockUI::unblockUI = () ->
        self = this
        body.removeClass self.options.blockUIClass
        @_removeElementsFromDom()
        return

      BlockUI::_addElementsToDom = ->
        body.append @messageEl
        body.append @backdropEl
        @_blocked = true
        return

      BlockUI::_removeElementsFromDom = ->
        @messageEl.remove()
        @backdropEl.remove()
        @_blocked = false
        return

      return {
        createBlockUI: (opts) ->
          return new BlockUI(opts)
      }
    ]
    return
