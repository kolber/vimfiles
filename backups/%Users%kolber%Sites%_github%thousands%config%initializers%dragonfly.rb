Vim�UnDo� ��_`�n�Z~9���V&ڰ����j�����G   �   +  c.job(:newsletter_outs_article) do |tint|   7                          P�lo    _�                     6       ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�kk     �   6   :   ~    5�_�                    7   	    ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�ko    �   6   8   �        c.job(:newsletter_article) do5�_�                    7   $    ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�k�     �   6   8   �      $  c.job(:newsletter_outs_article) do5�_�                    8        ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�k�    �   7   9              process(:thumb, "300x250#")5�_�                    8       ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�k�     �   7   9   �    5�_�                    8   H    ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�k�     �   7   9   �      t    process(:convert, "-colorspace gray -fill #{tint} -tint 100 -resize 640x400^ -gravity center -crop 640x400+0+0")5�_�                    8   H    ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�k�     �   7   9   �      s    process(:convert, "-colorspace gray -fill #{tint} -tint 100 -resize 40x400^ -gravity center -crop 640x400+0+0")5�_�      	              8   N    ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�k�     �   7   9   �      t    process(:convert, "-colorspace gray -fill #{tint} -tint 100 -resize 300x400^ -gravity center -crop 640x400+0+0")5�_�      
           	   8   N    ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�k�     �   7   9   �      t    process(:convert, "-colorspace gray -fill #{tint} -tint 100 -resize 300x400^ -gravity center -crop 640x400+0+0")5�_�   	              
   8   m    ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�k�     �   7   9   �      t    process(:convert, "-colorspace gray -fill #{tint} -tint 100 -resize 300x250^ -gravity center -crop 640x400+0+0")5�_�   
                 8   i    ����                                                                                                                                                                                                                                                                                                                            6          4          V       P�k�    �   7   9   �      t    process(:convert, "-colorspace gray -fill #{tint} -tint 100 -resize 300x250^ -gravity center -crop 640x250+0+0")5�_�                     7       ����                                                                                                                                                                                                                                                                                                                            :          <           v   9    P�ln    �   6   8   �      +  c.job(:newsletter_outs_article) do |tint|5��