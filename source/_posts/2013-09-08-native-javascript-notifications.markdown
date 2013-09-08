---
layout: post
title: "Native Notifications with JavaScript"
description: Using HTML 5 native notifications with JavaScript in Chome, Safari, Firefox and on Windows.
date: 2013-09-08 23:42
comments: true
author: Adam Fortuna
tags: [JavaScript, OS X]
---

In browser notifications have made a lot of progress in the last few years. Hell, native notifications have made a lot of progress in that time too. Just a few years ago, everyone on the Mac was using [Growl][]. With the release of Mac OS X 10.8 (Mountain Lion) the one purpose of Growl was now built in and everyone I know made the switch to using native notifications.

{% pullside right %}
Warning: Link to the official spec.
{% endpullside %}

Notifications caught on with Mac App developers. [HTML 5 Notifications][] have had a slower growth curve as the various browsers focus in on a single standard. As of this writing, here's a recap of where the different browsers stand when it comes to supporting notifications.

OS X Mavericks has expanded support for notifications that builds heavily on this. Here's what's public on the topic so far:

{% blockquote OS X Mavericks for Developers https://developer.apple.com/osx/whats-new/ %}
Once users have signed up for notifications from your website in Safari, you can send them push notifications that appear just like app notifications, even when Safari isn’t running. Users can then click on your push notification to launch your website.
{% endblockquote %}

In other words, it's time to hop on board the notification train if you want another route of reaching your sites visitors. Let's check out how this applies to the different browsers.

## Common Traits

{% pullside right raw %}
Read the source from this project to understand how browsers implement notifications
{% endpullside %}

The major browsers (setting aside IE) have a few patterns in common right now that we can use to style our behavior pattern around. If you want see how to use notifications in different browsers, check out the [HTML5 Desktop Notifications][] project on GitHub. It's worth reading over the source code.

## Request Permission

In order to send notifications in all browsers, you'll need to request permission to do so. In that very long spec, there are 3 permission levels noted:

* `default` - No permission granted or denied
* `granted` - The user has granted permission to send notifications
* `denied` - The user has denied permission

If permission is denied you won't be able to request permission again in the current session. If you try to send a notification without having been granted permission, nothing will happen.

## Send A Message

Once you have permission, you'll be able send down a notification with the following attributes:

* `title` - Should be short and to the point
* `body` - You'll have a bit more room to work with here. Unfortunately, in Safari this will be truncated
* `icon` - In Chrome and Firefox, you can send over whatever icon you want. This isn't being served by Notification Center, so there is more flexibility here.

When the message is shown, there are also a few events that we can tie into for added flexibility:

* `onshow` - When the notification is first shown.
* `onclick` -  When the user clicks on the notification. By default this will bring the window into focus.
* `onclose` - When the notification is closed, either by the user or programatically.
* `onerror` - Trigger if the notification cannot be presented to the user

Here's a few examples of how these notifications look in different browsers.

{% pullside left %}
![Safari](/images/icons/safari.png){: .icon}
{% endpullside %}

### Safari

For Safari notifications, you won't be able to provide an icon unfortunately. Instead it'll always use the Safari icon. It will also show the hostname where the notification came from though, which is unique to Safari.

![Safari Notification](/images/posts/native-javascript-notifications/safari-notification-small.png)

One of the nice parts of this notification is that it will sync up with your other notifications. For instance, if you have one notification from Xcode and another from a website, they'll show up stacked rather than on top of each other.

### Mavericks

Not exactly a JavaScript implementation, but worth noting that notifications in Mavericks behave much differently than HTML 5 notifications. They more closely resemble iOS notifications, where you're pushing to Apple's servers, and they're pushing to the end user.

![Mavericks Notification](/images/posts/native-javascript-notifications/mavericks-notification-small.png)

The addition of a custom icon here is definitely a plus. This alert is from a [Safari Push Notification Demo][] which should only work if you're running Safari in Mavericks. If you clicked on that alert, you'd get taken to a page that describes how it works:

{% blockquote Safari Push Notification Demo http://kandutech.net/clicked %}
When you allowed this website to send you push notifications, we generated a 4 digit code and put it in a database along with your Mac's push token. When a push notification is triggered through our servers, we resolve the 4 digit code to your Mac's token. Once we have your token, we tell Apple's servers what the notification should look like, and where it should go. Apple's push notification service then delivers the notification we generated to your Mac.
{% endblockquote %}


{% pullside left %}
![Chrome](/images/icons/chrome.png){: .icon}
{% endpullside %}

### Chrome

Chrome notifications show up square, which stands out from the rounded look of OS X and Firefox notifications. It also shows up larger in all dimensions 

{% pullside right %}
Chromes notifications are significantly larger than Notification Center.
{% endpullside %}

![Chrome Notification](/images/posts/native-javascript-notifications/chrome-notification-small.png)

Unlike Safari notifications, this will stay up until it is dismissed.

{% pullside left %}
![Firefox](/images/icons/firefox.png){: .icon}
{% endpullside %}

### Firefox

The Firefox notification would be prettiest out of the box, but the entire body is shown as a link! For all notifications, clicking on it takes you to the page, but Firefox attempts to make it more apparent. The appearance ends up suffering due to this choice.

{% pullside right %}
Why is the body a link Firefox? WHY?
{% endpullside %}

![Firefox Notification](/images/posts/native-javascript-notifications/firefox-notification-small.png)

{% pullside left %}
![Chrome](/images/icons/ie.png){: .icon}
{% endpullside %}
### Windows

While there are no system level notifications in Windows (I don't think?), but Internet Explorer 9 and up allow you to add an icon overlay on the browsers icon. This allows for some feedback in this browser. You can see an example of this in the Readme for the [HTML5 Desktop Notifications][] project on GitHub.

Chrome and Firefox on Windows support notifications that behave similar to their Mac counterparts.

## Demo

Want to see how notifications look in your browser? Try out the [HTML5 Notifications Demo][] to find out.

{% credits %}
1. Icons for Safari, Chrome and Firefox by [Stefano Tirloni](http://dribbble.com/shots/1032875-Flat-Icons).
2. Internet Explorer Icon by [1 Little Designer](http://onelittledesigner.com/rapidweaver/web-icons/free-flat-browser-icons/).
{% endcredits %}




[Growl]:http://growl.info/
[HTML 5 Notifications]: http://notifications.spec.whatwg.org/
[Safari Push Notification Demo]: http://kandutech.net/
[HTML5 Desktop Notifications]: https://github.com/ttsvetko/HTML5-Desktop-Notifications/
[HTML5 Notifications Demo]: http://ttsvetko.github.io/HTML5-Desktop-Notifications/