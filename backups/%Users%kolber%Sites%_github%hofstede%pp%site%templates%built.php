Vim�UnDo� '>ݶm
�64�J��:CD�Gs�Eb�`�+�                                        S;T�    _�                            ����                                                                                                                                                                                                                                                                                                                                                             S;O�    �                   5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             S;O�     �                    <? snippet('header') ?>       0  <? $projects = $page->children()->visible() ?>   =  <section class="top-spacer houses span-12 js-content last">        <div class="breadcrumb row">   0      <nav class="secondary push-1 span-6 last">   /        <? foreach($page->siblings() as $p): ?>           <li>   �          <a<?= ($p->isOpen()) ? ' class="active js-load-project"' : ' class="inactive js-load-project"' ?> href="<?= $p->url() ?>"><?= html($p->title()) ?></a>           </li>           <? endforeach ?>         </nav>   
    </div>       *    <div class="work-wrapper content row">   )    <? foreach($projects as $project): ?>   ,    <figure class="<?= $project->size() ?>">   )      <div class="img_wrapper container">   )        <a href="<?= $project->url() ?>">   �          <img class="project-fade-in" src="<?= $project->images()->find('01-thumb.jpg')->url() ?>" alt="<?= html($project->title()) ?>" />           </a>         </div>   =      <figcaption><?= html($project->title()) ?></figcaption>       </figure>       <? endforeach ?>   
    </div>     </section>       <? snippet('footer') ?>5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             S;T�    �                   5��