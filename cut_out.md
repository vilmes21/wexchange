<h1>CUT OUT CODE </h1>
From application html search bar not needed
```html
<form class="navbar-form navbar-left">
  <div class="form-group">
    <input type="text" class="form-control" placeholder="Search">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
```

dropdown button:
```html  
<li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</li>
```

another dropdown button:
```html
<li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">One more separated link</a></li>
  </ul>
</li>
```

source code for `search bar`, but didn't follow entirely:
```html
<div class="row">
  <div class="col-lg-6">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Keywords...">
      <span class="input-group-btn">
        <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
```

*****************
From `_form.html.erb` autoly generated form for new post:
```html
<div class="field">
  <%= f.label :title %>
  <%= f.text_field :title %>
</div>

<div class="field">
  <%= f.label :description %>
  <%= f.text_field :description %>
</div>

<div class="field">
  <%= f.label :category %>
  <%= f.text_field :category %>
</div>

<div class="field">
  <%= f.label :value %>
  <%= f.number_field :value %>
</div>

<div class="field">
  <%= f.label :user_id %>
  <%= f.text_field :user_id %>
</div>

<div class="field">
  <%= f.label :location %>
  <%= f.text_field :location %>
</div>

<div class="field">
  <%= f.label :exchanged_post_id %>
  <%= f.text_field :exchanged_post_id %>
</div>

<div class="field">
  <%= f.label :duration %>
  <%= f.number_field :duration %>
</div>

<div class="field">
  <%= f.label :time %>
  <%= f.time_select :time %>
</div>

<div class="actions">
  <%= f.submit %>
</div>
```
=======================================
Test code for divided section show in post index:
```html
<div>
  <h2>je suis la</h2>
  <%= @posts_service.inspect %>
  <% @posts_service.each do |x| %>
    <%= x.title %>
    <%= x.location %>
  <% end %>
</div>
```
while @posts_service is defined as:
```ruby
@posts_service = Post.where(category: 'Service').order(created_at: :desc)
```
================================
Autoly generated from `index.htm.erb` of posts:
```html
<p id="notice"><%= notice %></p>

<h1>Posts</h1>

<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Description</th>
      <th>Category</th>
      <th>Value</th>
      <th>User</th>
      <th>Location</th>
      <th>Exchanged post</th>
      <th>Duration</th>
      <th>Time</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @posts.each do |post| %>
      <tr>
        <td><%= post.title %></td>
        <td><%= post.description %></td>
        <td><%= post.category %></td>
        <td><%= post.value %></td>
        <td><%= post.user.name %></td>
        <td><%= post.location %></td>
        <td><%= post.exchanged_post_id %></td>
        <td><%= post.duration %></td>
        <td><%= post.time %></td>
        <td><%= link_to 'Show', post %></td>
        <td><%= link_to 'Edit', edit_post_path(post) %></td>
        <td><%= link_to 'Destroy', post, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Post', new_post_path %>
```

==================================
Maybe will use for request creating form in post show:
```html
<h2>Make an Exchange Request!</h2>
<%= form_tag post_requests_path(@post) do %>
<div class="form-group">
  <%= label_tag 'Title' %>
  <%= text_field_tag :title, nil, class: 'form-control' %>
</div>
<div class="form-group">
  <%= label_tag 'Your item offer' %>
  <%= text_field_tag :offer, nil, class: 'form-control' %>
</div>
<div class="form-group">
  <%= label_tag 'Write a message' %>
  <%= text_area_tag :message, nil, class: 'form-control'  %>
</div>
  <button type="submit" class="btn btn-default">Send Request</button>
<% end %>
```
