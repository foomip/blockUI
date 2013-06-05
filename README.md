---
blockUI AngularJS Service
---

**blockUI** service/provider for AngularJS inspired by blockUI jQuery plugin.

<h2>Include the service in your application</h2>
```coffeescript
'use strict'

app = angular.module('BlockUI'])
```
<h2>Default options</h2>

```coffeescript
# Overwrite what you need
defaults =
  # messageClass: 'blockui-message' # from user (optional) - styling purposes
  # backdropClass: 'blockui-backdrop' # from user (optional) - styling purposes
  innerHTML: 'Loading ...' # Overwrite this with your content i.e. <img src="/some/path"/>
  blockUIClass: "blockui-blocked" # this class will be appended to the body
```
<h2>How to use it</h2>
Inject the service into your controller
```coffeescript
'use strict'

angular.module('Controllers')
  .controller 'demoCtrl',
    ['$blockUI', ($blockUI) ->
      $scope.demoMethod = ->
        blockUI = $blockUI.createBlockUI
          innerHTML: "<strong>Waiting for data ...</strong>"
        blockUI.blockUI()
        waitForSomethingFunction (success)->
          blockUI.unblockUI()
          console.log "Success callback - unblocking" 
    ]
```
<h2>Demo</h2>
WIP