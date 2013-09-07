---
layout: post
title: "Native JavaScript Notifications"
date: 2013-09-04 23:42
comments: true
author: Adam Fortuna
tags: [JavaScript]
---

If you're on the fence about updating an older application to use Rails 4, the addition of `ActionController::Live` 
might be helpful in making your decision a little easier.

## A Basic Connection

Aaron Patterson wrote a great post about [Live Streaming in Rails][], over a year ago, but the interface is mostly 
the same today. That post is still a good starting point for `ActionController::Live`.

I first ran into the subject when working on Code School's [Rails 4: Zombie Outlaws][] course where it's mention how
to use it in cooperation with Redis. 

{% pullside 'left code' %}
If you connected to this example in a browser, you'd see 3 lines of text then disconnect.
{% endpullside %}

```ruby
class ActivitiesController < ApplicationController
  include ActionController::Live

  def index
    response.headers["Content-Type"] = "text/event-stream"

    3.times do |i|
      response.stream.write "data: Iteration #{i}\n\n"
      sleep 3
    end
  rescue IOError 
    # Client disconnected
  ensure
    response.stream.close
  end
end
```

Visiting this page isn't all that interesting, but all the components are there. The connection is established, data is
writtten back to it, then once there is nothing more to send, the `stream` is closed. This will end that server request,
ending it for the user as well.

{% blockquote %}
If you connected to this example in a browser, you'd see 3 lines of text then disconnect.
{% endblockquote %}

Visiting this page isn't all that interesting, but all the components are there. The connection is established, data is
writtten back to it, then once there is nothing more to send, the `stream` is closed. This will end that server request,
ending it for the user as well.

Visiting this page isn't all that interesting, but all the components are there. The connection is established, data is
writtten back to it, then once there is nothing more to send, the `stream` is closed. This will end that server request,
ending it for the user as well.

* Some list here
* With multiple elements
* how does it look?

Visiting this page isn't all that interesting, but all the components are there. The connection is established, data is
writtten back to it, then once there is nothing more to send, the `stream` is closed. This will end that server request,
ending it for the user as well.


[Live Streaming in Rails]: http://tenderlovemaking.com/2012/07/30/is-it-live.html
[Rails 4: Zombie Outlaws]: http://rails4.codeschool.com/