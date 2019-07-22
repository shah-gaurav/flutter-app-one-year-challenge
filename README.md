# Flutter State Management Challenge

One year challenge app using Provider state management package

## Introduction

Recently I read a Flutter State Management article on Medium: [Flutter #OneYearChallenge; Scoped Model vs BloC Pattern vs States Rebuilder](https://medium.com/flutter-community/flutter-oneyearchallenge-scoped-model-vs-bloc-pattern-vs-states-rebuilder-23ba11813a4f)

This article discussed various different state management techniques and consisted of a challenge that the author of the article solved using the States_rebuilder state management package that the author has developed.

The current recommended Flutter state management solution from the Flutter team is the [Provider package](https://pub.dev/packages/provider). This repository is my attempt to solve the challenge presented in the article with Provider package to see if it can handle the challenge put forth by the author.

## Feedback
After I commented on the original article, the author was gracious enough to review my solution and point out the following issues:

1. When I tap on an item card form the listView to display the detailed card, the colors changes. Again this shouldn’t happen.(
2. when I tap on the detailed card, its counter does not increment. And YES the tapped item card from the listView increments.
3. I increased the number of items to 20 rather than 5, and after I tap on the first item from the listView and tap on the detailed card to increase the counter of the first item, I sweep the list view to the left so to dispose the first item. I then go back to the first item and click the detailed card I get an error:
I/flutter (10978): The following assertion was thrown building NotificationListener<KeepAliveNotification>:
I/flutter (10978): A Item was used after being disposed.
I/flutter (10978): Once you have called dispose() on a Item, it can no longer be used.

I think you can fix them.

Since this article, states_rebuilder has been updated many times. Now it has its own dependency injection, a dedicated streaming class, and viewModel class can listen to changes in other class.

## Conclusion
I attempted to fix the 3 issues mentioned without making the solution overly complicated. I was only able to address #2 issue above (updated code is pushed to github). This goes back to the point of the article that states_rebuilder provides fine grained control over state management that the other solutions don't without the developer having to jump through multiple hoops.