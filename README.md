ELIXIR PAGINATE
===============
This is the plugin for paginating in rails 2.x and 3.x.

INSTALLATION IN RAILS (2.x)
==========================
The plugin can now be installed from github, which is the easiest way to keep it up to date.

```ruby
script/plugin install git://github.com/TXANT/elixir_paginate.git
```

Alternatively you can install it in vendors/plugin. At first, you need too download file from github. And then, place that file under the 'vendors/plugin' of your project.

And then, you must add below codes to controller's functions which you want to use :

```ruby
#　ﾊﾟジネーションの為に
@page = params[:page]
#　最初（さいしょ）パージを検証（けんしょう）？
@next = (@page == nil ? 2 : (@page.to_i+1))
# rows par page
@par_page = 5
@count = @books.length
@var = ElixirPaginate.paginate(@page, @count, @par_page)
```
At the view page, you need to add below codes. Put your controller at the place of 'your_controller' :

```.erb
<!--  link the stylesheet -->
<%= stylesheet_link_tag 'pagination' %>


<!-- to show the page numbers -->
<div class="pagination">
    <!-- パージ番号を表示 -->
    <ul>
        <% if @next > 2 %>
        <li>
            <%= link_to '<<', :controller => 'book', :page => @next-2, :author => params[:author] %>
        </li>
        <% end %>
        <% for i in 1..@var[0] %>
        <li>
            <%= link_to i, :controller => 'book', :page => i, :author => params[:author] %><% end %>
        </li>
        <% end %>
        <% if @next < @var[0]+1 %>
        <li>
            <%= link_to '>>', :controller => 'book', :page => @next, :author => params[:author] %>
        </li>
        <% end %>
    </ul>
</div>


<!-- To show the list -->

<% @your_identifier[@var[1],@par_page].each do |f| %>
<!--
        your codes here
-->
<% end %>
```

Copyright (c) 2013 Thant Shwe Aung, released under the MIT license
