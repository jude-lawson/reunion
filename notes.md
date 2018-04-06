What do you think we were trying to get you to learn with this challenge?
* How to make creative design decisions when the requirements leave room for some decision making. Specifically, in this case the spec called for some nesed information (Participants as part of Activities as part of Reunions) and how best to set the code up to manage that information.

Outline
My code has two classes, an Activity class and a Reunion class. Activities hold a participants hash that holds the name and initial payment for each participant. Objects of the Activity class can then be collected in the Reunion class. This allows for  the information about costs and participants to be accessed by activity per each Reunion. 

Information about how much a participant has paid already for and activity is directly connected to the participant (in the hash) and not the overall Activity class. This allows for information like how much each participants owes overall and owes after some payment to be easily evaluated per each activity object.




What was difficult?
* Interpreting some of the more open-ended aspects of the spec, like 'evaluate Activity cost'. I had to ask questions like 'How is that evaluated'?, 'Is it added as part of the initial state of the and Activity object?', etc. The answers took some creative thinking.


What came naturally to you?
* Creating tests, and then writing code. This always helps me design my code and guides my thought process.


