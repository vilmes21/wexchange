<h1>CUT OUT CODE </h1>
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
