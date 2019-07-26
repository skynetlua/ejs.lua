# ejs.lua

Embedded lua templates.

## Features
  * Unbuffered code for conditionals etc `<% code %>`
  * Escapes html by default with `<%= code %>`
  * Unescaped buffering with `<%- code %>`
  * Includes
  * Client-side support

## Example

---
	<div class='navbar'>
    	<h3><%= helloworld() %></h3>
	</div>
---

```
	<% if topic then %>
    	<title><%= topic.title %> - <%- config.name %></title>
    <% elseif pageTitle then %>
    	<title><%= pageTitle %> - <%- config.name %></title>
    <% else %>
    	<title><%- config.description %></title>
    <% end %>
```

```
	<% if topics and #topics > 0 then %>
        <div>
            <%- partial('item', {collection = topics, as = 'topic'}) %>
        </div>
    <% else %>
        <div>
            <p>无话题</p>
        </div>
    <% end %>

    --item.html content
    <p><%= config.name .. topic.title %></p>
```
