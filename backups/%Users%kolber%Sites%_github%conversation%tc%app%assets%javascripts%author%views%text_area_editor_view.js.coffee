Vim�UnDo� r?�D	��r8�2��fN�#�1�~�cw�].B�   V   +      $('body').removeClass('small-layout')      *      M       M   M   M    Q��G    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Q��     �                <<<<<<< HEAD5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Q���     �                =======   <    # @textAreaEl.css(height: @textAreaEl.parent().height())5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Q���    �                =>>>>>>> 62f9b0b... First draft of a responsive article editor5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Q��m     �               N   1class TC.TextAreaEditorView extends Backbone.View     initialize: (options) ->       @_initTextArea()   ,    @editorBodyEl = $("section.editor-body")       super options         _initTextArea: ->   A    @textAreaEl = $("<textarea class='md-editor'/>").appendTo @el       @textAreaEl.keydown =>   .      @trigger "change:text", this, @getText()   9    @textAreaEl.on "input change keyup paste cut", (e) ->   u      @style.height = "#{@scrollHeight + parseInt($(@).css('padding-top')) + parseInt($(@).css('padding-bottom'))}px"       @focus()         resize: ->       @textAreaEl.keyup()       if $(window).width() < 890   (      $('body').addClass('small-layout')       else   +      $('body').removeClass('small-layout')         getText: ->       @textAreaEl.val()         setText: (text) ->       @textAreaEl.val(text)         insertText: (text) ->       @wrapText(text, "")         wrapText: (before, after) ->   ,    @textAreaEl.wrapSelection(before, after)         focus: ->       @textAreaEl.focus().keyup()         # Toolbar Buttons     heading: ->       if @_isTextSelected()         @wrapText("\n## ", "\n")       else   /      @wrapText("\n## Your heading here", "\n")          bold: => @wrapText('**', '**')      italic: -> @wrapText('_', '_')   
  link: ->   6    link = prompt "Which link?", "http://example.com/"       return if _(link).isEmpty()           link.replace(/\(/g, "\(")       link.replace(/\)/g, "\)")       link.replace(/\[/g, "\[")       link.replace(/\]/g, "\]")           if @_isTextSelected()   "      @wrapText("[", "](#{link})")       else   ,      @wrapText("[link text](#{link})", " ")         video: ->   Q    link = prompt "Link to youtube", "http://www.youtube.com/watch?v=okqEVeNqBhc"       return if _(link).isEmpty()           if @_isTextSelected()   >      @wrapText("\n\n<movie src=\"#{link}\">", "</movie>\n\n")       else   P      @wrapText("\n\n<movie src=\"#{link}\">video caption here</movie>\n\n", "")       %  selectLineContainingText: (text) ->       # unimplemented         readOnly: (value) ->   )    @textAreaEl.prop("readonly", !!value)        @textAreaEl.prop("readonly")         _isTextSelected: ->   *    selection = @textAreaEl.getSelection()   $    selection.start != selection.end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Q��q     �                =>>>>>>> 7faa4ba... Kick in the hidden sidebar layout at 950px5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Q��s     �                =======   <    # @textAreaEl.css(height: @textAreaEl.parent().height())5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Q��u     �                    if $(window).width() < 8905�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                V       Q��v    �                <<<<<<< HEAD5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                             Q�|v     �         N       5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                             Q�|w     �                    return if $(�         P       5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             Q�|�     �         Q          return if $('body')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�|�     �         Q      +    return if $('body').is('.small-layout')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�|�     �         R          �         Q    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�|�     �         R          warn5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�|�    �         R          console.warn $(window)5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�|�     �         S            �         R    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�|�     �         S          @textareaEl.on "select"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Q�|�    �                      @moveMenubar(�         S           @textareaEl.on "select", (e)5�_�                       	    ����                                                                                                                                                                                                                                                                                                                                                             Q�}_    �         T      #    @textareaEl.on "select", (e) ->5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                             Q�}�    �         T      #    @textAreaEl.on "select", (e) ->5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Q�}�     �         T      #    @textAreaEl.on "select", (e) =>5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Q�}�    �         T           @textAreaEl.on "select",  =>5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Q�}�     �         T    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       Q�}�     �         U       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Q�}�     �         U        5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Q�}�     �         U          $('menu.toolbar')5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       Q�}�     �         U      "    $('menu.toolbar').animate({ })5�_�                       .    ����                                                                                                                                                                                                                                                                                                                                                v       Q�}�     �         U      1    $('menu.toolbar').animate({ top: $(window) })5�_�                       :    ����                                                                                                                                                                                                                                                                                                                                                v       Q�~     �         U      =    $('menu.toolbar').animate({ top: $(window).scrollTop() })5�_�                       A    ����                                                                                                                                                                                                                                                                                                                                                v       Q�~
    �         U      B    $('menu.toolbar').animate({ top: $(window).scrollTop() + 20 })5�_�                            ����                                                                                                                                                                                                                                                                                                                                                v       Q�   	 �         U          @textAreaEl.on "select", =>5�_�      !                  "    ����                                                                                                                                                                                                                                                                                                                                                v       Q��     �         V      G    $('menu.toolbar').animate({ top: $(window).scrollTop() + 20 }, 300)�         V          �         U    5�_�       "           !          ����                                                                                                                                                                                                                                                                                                                                                v       Q��1     �         V          top = $(window)5�_�   !   #           "      +    ����                                                                                                                                                                                                                                                                                                                                                v       Q��9     �         V      +    top = $(window).scrollTop() - $(window)5�_�   "   %           #      %    ����                                                                                                                                                                                                                                                                                                                               9          2       v   2    Q��K     �         V      G    $('menu.toolbar').animate({ top: $(window).scrollTop() + 20 }, 300)5�_�   #   &   $       %      %    ����                                                                                                                                                                                                                                                                                                                               9          2       v   2    Q��P     �         V      ,    $('menu.toolbar').animate({ top: }, 300)5�_�   %   '           &      ,    ����                                                                                                                                                                                                                                                                                                                               ,          -       v   -    Q��T   
 �         V      0    $('menu.toolbar').animate({ top: top }, 300)5�_�   &   (           '          ����                                                                                                                                                                                                                                                                                                                               ,          -       v   -    Q��X    �                &    console.warn $(window).scrollTop()5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                         3       v   3    Q��B     �         U      :    top = $(window).scrollTop() - $(window).height() + 1005�_�   (   *           )      "    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��E    �         U      %    top = $(window).scrollTop() + 1005�_�   )   +           *           ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q���     �         U      $    top = $(window).scrollTop() + 205�_�   *   ,           +      "    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q���    �         U      $    top = $(window).scrollTop() - 205�_�   +   -           ,      #    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q���    �         U      %    top = $(window).scrollTop() - 1005�_�   ,   .           -      #    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q���    �         U      %    top = $(window).scrollTop() - 1405�_�   -   /           .      "    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��	    �         U      %    top = $(window).scrollTop() - 1805�_�   .   0           /      "    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��@     �         U      %    top = $(window).scrollTop() - 2405�_�   /   1           0      &    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��B     �         U      &    top = $(window).scrollTop() - (2405�_�   0   2           1      (    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��H     �         U      0    $('menu.toolbar').animate({ top: top }, 250)5�_�   1   3           2      &    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��K     �         V          �         U    5�_�   2   4           3          ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��_     �         V          offset = top < $(window)5�_�   3   5           4      %    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��b     �         V      %    offset = top < $(window).height()5�_�   4   6           5          ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��j    �         V      '    top = $(window).scrollTop() - (240)5�_�   5   7           6          ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��s    �         V      /    offset = top < $(window).height() ? 240 : 05�_�   6   8           7          ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q���     �         W          �         V    5�_�   7   9           8          ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q���     �         W          warn5�_�   8   <           9          ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q���    �         W          console.warn top, $(window)5�_�   9   =   :       <          ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��H     �         W      /    offset = top > $(window).height() ? 240 : 05�_�   <   >           =      )    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��L     �         W      2    offset = if top > $(window).height() ? 240 : 05�_�   =   ?           >      2    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��O    �         W      5    offset = if top > $(window).height() then 240 : 05�_�   >   A           ?          ����                                                                                                                                                                                                                                                                                                                                         '       v   '    Q���     �         W      8    offset = if top > $(window).height() then 240 else 05�_�   ?   B   @       A          ����                                                                                                                                                                                                                                                                                                                                         '       v   '    Q���     �         W      (    console.warn top, $(window).height()5�_�   A   C           B          ����                                                                                                                                                                                                                                                                                                                                         '       v   '    Q���     �         W      &    console.warn top, $('.med-editor')5�_�   B   D           C      %    ����                                                                                                                                                                                                                                                                                                                                         '       v   '    Q���    �         W      %    console.warn top, $('.md-editor')5�_�   C   E           D          ����                                                                                                                                                                                                                                                                                                                               1                 v       Q���     �         W      2    console.warn top, $('.md-editor').offset().top5�_�   D   F           E          ����                                                                                                                                                                                                                                                                                                                                                v       Q���     �         W      )    offset = if top > 300 then 240 else 05�_�   E   G           F          ����                                                                                                                                                                                                                                                                                                                                         1       v       Q���    �                    console.warn top, 5�_�   F   H           G          ����                                                                                                                                                                                                                                                                                                                                         "       v   "    Q��Z    �         V      B    offset = if top > $('.md-editor').offset().top then 240 else 05�_�   G   I           H      6    ����                                                                                                                                                                                                                                                                                                                                         (       v   "    Q���    �         V      9    $('menu.toolbar').animate({ top: top - offset }, 250)5�_�   H   J           I      ?    ����                                                                                                                                                                                                                                                                                                                                         (       v   "    Q��    �         V      H    offset = if top > $('.markdown-editor').offset().top then 240 else 05�_�   I   L           J      (    ����                                                                                                                                                                                                                                                                                                                                                             Q��    �         V      (      $('body').addClass('small-layout')5�_�   J   M   K       L      (    ����                                                                                                                                                                                                                                                                                                                               (          (       V   (    Q��A     �         V      D      $('body').addClass('small-layout').removeClass('open-sidebar')5�_�   L               M      *    ����                                                                                                                                                                                                                                                                                                                               (          (       V   (    Q��F    �         V      +      $('body').removeClass('small-layout')5�_�   J           L   K           ����                                                                                                                                                                                                                                                                                                                               (          (       V   (    Q��9     �              5�_�   ?           A   @          ����                                                                                                                                                                                                                                                                                                                                         '       v   '    Q���     �              5�_�   9   ;       <   :          ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��      �         W      0    offset = (top > $(window).height() ? 240 : 05�_�   :               ;      0    ����                                                                                                                                                                                                                                                                                                                               "          #       v   #    Q��    �         W      1    offset = (top > $(window).height() ? 240 : 0)5�_�   #           %   $      %    ����                                                                                                                                                                                                                                                                                                                               9          2       v   2    Q��L     �         V       5��