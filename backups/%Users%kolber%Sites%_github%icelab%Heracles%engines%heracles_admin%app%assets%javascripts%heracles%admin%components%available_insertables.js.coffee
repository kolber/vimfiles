Vim�UnDo� E���I���F��'b��m5�4o#y��   q                 	       	   	   	    R�ja    _�                     I       ����                                                                                                                                                                                                                                                                                                                                                             R�|    �   H   J   q      !      size:  @props.size || "30%"5�_�                    /       ����                                                                                                                                                                                                                                                                                                                            /          /   "       v   "    R�8     �   .   0   q      %    @container.css { "width": @size }�   /   0   q    5�_�                    /       ����                                                                                                                                                                                                                                                                                                                            /          /   #       v   #    R�;     �   .   0   q      '    @container.css { "width": "@size" }�   /   0   q    5�_�                    /       ����                                                                                                                                                                                                                                                                                                                            /          /   '       v   #    R�<     �   .   0   q      +    @container.css { "width": "{ @size }" }5�_�                    /   !    ����                                                                                                                                                                                                                                                                                                                            /          /   '       v   #    R�=     �   .   0   q      ,    @container.css { "width": "#{ @size }" }5�_�                    /   &    ����                                                                                                                                                                                                                                                                                                                            /          /   '       v   #    R�?     �   .   0   q      +    @container.css { "width": "#{@size }" }5�_�                    /   '    ����                                                                                                                                                                                                                                                                                                                            /          /   '       v   #    R�A     �   .   0   q      *    @container.css { "width": "#{@size}" }5�_�      	              /   (    ����                                                                                                                                                                                                                                                                                                                            /          /   '       v   #    R�A    �   .   0   q      +    @container.css { "width": "#{@size}&" }5�_�                  	           ����                                                                                                                                                                                                                                                                                                                            /          /   '       v   #    R�j`     �               q   #= require jquery   #= require react       #   A# Simple class for registering insertables in a persistant store.   #   )# Get a list of the register insertables:   #    #    availableInsertables.list()   #   # Register an insertable:   #   #    availableInsertables.add   #      type:  "image"   #      label: "Image"   ##      icon: "picture-o" # Optional   T#      displayTemplate: "<div insertable="image" contenteditable="false" ...></div>"   #   #   !class window.AvailableInsertables     constructor: ->       @insertables = []   4  add: (insertable) -> @insertables.push(insertable)     get: (type) ->   "    for insertable in @insertables   7      if insertable.type is type then return insertable     list: -> @insertables           D# FIXME This is attached no matter what which is OK, but kinda lame.   ## Attach the instance to the window   8window.availableInsertables = new AvailableInsertables()       class window.InsertableEditor     constructor: ->       @$doc = $(document)   5    @classPrefix = "field-content-editor__insertable"   P    @container = $("<div class='#{@classPrefix}'>").insertAfter '.admin-wrapper'       # Events   +    @$doc.on "insertable:edit", @openEditor   9    @$doc.on "insertable:close cover:close", @closeEditor       >  # Listen for `insertable:edit` event and activate the editor   :  openEditor: (e, type, value, size, handleStateChange) =>       @size = size   2    @renderTemplate type, value, handleStateChange   +    @container.css { "width": "#{@size}%" }       setTimeout(=>   3      @container.addClass "#{@classPrefix}--active"       , 0)       4  renderTemplate: (type, value, handleStateChange)->   .    insertable = availableInsertables.get type       container = @container[0]       React.renderComponent(         insertable.edit(           container: container           value: value   ,        handleStateChange: handleStateChange         ), container       )         closeEditor: =>       # Clear the style out   !    @container.removeAttr "style"   4    @container.removeClass "#{@classPrefix}--active"           "# Mixins for Insertable components   !window.InsertableDisplayMixin = {     getInitialState: ->       return {          size:  @props.size || "30"         value: @props.value       }     componentDidMount: ->       @$doc = $(document)       %  updateContainerValue: (newValue) ->   =    $(@props.container).attr "value", JSON.stringify newValue       -  # Called by the equivalent `Edit` component   "  handleStateChange: (newValue) ->       @setState newValue   #    @updateContainerValue(newValue)       !  # Trigger event on the document     editValue: ->   ]    @$doc.trigger "insertable:edit", ["image", @state.value, @state.size, @handleStateChange]         # Remove the insertable     remove: ->   1    React.unmountComponentAtNode @props.container   }       window.InsertableEditMixin = {     getInitialState: ->   "    return { value: @props.value }   "  componentDidMount: (rootNode) ->       @$doc = $(document)   1    @$doc.on "cover:close", => @removeComponent()     removeComponent: ->       # Destroy self       setTimeout(=>   3      React.unmountComponentAtNode @props.container   
    , 300)     onSubmit: (e) ->       e.preventDefault()   %    @$doc.trigger("insertable:close")       # Send the data back   3    @props.handleStateChange({value: @state.value})       @removeComponent()   }5��