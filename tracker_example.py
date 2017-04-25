from snowplow_tracker import Emitter, Tracker

URL = 'localhost:8081'


def f(x):
    print(str(x) + " events sent successfully!")

unsent_events = []


def g(x, y):
    print(str(x) + " events sent successfully!")
    print("Events not sent. They have been stored in unsent_events:")

    for event_dict in y:
        print(event_dict)
        unsent_events.append(event_dict)


e = Emitter(URL, buffer_size=3, on_success=f, on_failure=g)

t = Tracker(e)

# This doesn't cause the emitter to send a request because the buffer_size was
# set to 3, not 1
t.track_page_view("http://www.myowndomainhere.dev")

# This does cause the emitter to try to send all 6 events
t.track_page_view("http://www.myowndomainhere.dev/signin")
t.track_page_view("http://www.myowndomainhere.dev/home")
t.track_page_view("http://www.myowndomainhere.dev/somepage")
t.track_page_view("http://www.myowndomainhere.dev/anotherpage")
t.track_page_view("http://www.myowndomainhere.dev/logout")

# Since the method is GET by default, 6 separate requests are sent
# If any of them are unsuccessful, they will be stored in the unsent_events
# variable
