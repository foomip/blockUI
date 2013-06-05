---
blockUI AngularJS Service
---

**blockUI** service/provider for AngularJS inspired by blockUI jQuery plugin.

<h2>How to use it</h2>

<h4>Include the service in your application</h4>
```coffeescript
'use strict'

app = angular.module('BlockUI'])
```
<h4>Default options</h4>

```coffeescript
# Overwrite what you need
defaults =
  # messageClass: 'blockui-message' # from user (optional) - styling purposes
  # backdropClass: 'blockui-backdrop' # from user (optional) - styling purposes
  innerHTML: 'Loading ...' # Overwrite this with your content i.e. <img src="/some/path"/>
  blockUIClass: "blockui-blocked" # this class will be appended to the body
```

<h4>Inject the service into your controller</h4>
```coffeescript
'use strict'

angular.module('Controllers')
  .controller 'demoCtrl', ['$blockUI', ($blockUI) ->
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