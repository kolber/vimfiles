Vim�UnDo� D�j� �W9��c�AG�_��4�d��A�8P�M�                                      R��F     _�                              ����                                                                                                                                                                                                                                                                                                                                                             R��E     �                  #= require jquery       "use strict"       class FieldAddon     constructor: (@$el) ->   +    input = @$el.find('.field-addon-input')   ,    @$el.on "click", '.field-addon-text', ->         input.trigger('focus')       4admin.views.fieldAddon = ($el) -> new FieldAddon $el5��