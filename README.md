# message_queue
Message Queue

## Description
When dealing with async executions and/or distributed services that communicate via messages we find it useful to put messages onto a queue.

## Features:
### Clearing Queue
We use this when we want to process jobs in a serial fashion (at most one job is performing at any given time). It is nice to maintain order of performing jobs off the queue relative to when they were pushed onto the queue.

### Dead Letter Queue
More often we are consuming events off of an event stream of some sort (webhook subscriptions, kafka, redis pub/sub). Sometimes these jobs fail (or fail repeatedly) and require manual inspection of some sort. To facilitate this inspection the information has to be kept track of in some manner that allows retrieval.

### Retries
Keep track of the number of times it has been tried to be consumed and failed. We’ll also need a way to create an arbitrary delay

### Scoping/Namespacing
Allow for queues to scope or namespace dynamically, for example by an account unique identifier.


## TODO
- [ ] Design a starting point for our “envelope” to store messages on the queue (probably JSON?).
- [ ] Design and implement an interface to our message queue in ruby. This would also mean being able to store the queue some place (redis).
- [ ] Extend the interface from Task 2 to support retries.

