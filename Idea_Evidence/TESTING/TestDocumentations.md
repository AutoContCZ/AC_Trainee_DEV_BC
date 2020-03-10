# Test Documentations

### Teardown
**[SCENARIO #0001]** Idea Evidence Table deletion  
**[GIVEN]** Idea Evidence Header Table  
**[GIVEN]** Evidence Category Table  
**[GIVEN]** Evidence Voting Table  
**[GIVEN]** Category Idea Connec. Table EV  
**[WHEN]**  *Idea Evidence Header Table, Evidence Category Table, Evidence Voting Table, Category Idea Connec. Table* Records deleted  
**[THEN]**  *Idea Evidence Header Table* & *Evidence Category Table* empty  

### Connection Table Relation Deletion Test
**[SCENARIO #0002]** *Idea Evidence Header Table* record deletion  
**[GIVEN]** Empty *Idea Evidence Header Table*  
**[WHEN]**  Create Idea, then delete it  
**[THEN]**  *Category Idea Connec. Table* empty  

### State Value Check
**[SCENARIO #0003]** Check proper State field values for Number of votes for Threshold and marginal values   
**[GIVEN]** Empty *Idea Evidence Header Table*  
**[GIVEN]** *Idea Evidence Setup Table* with Threshold value  
**[WHEN]**  Create Idea   
**[THEN]**  Idea State is New  
**[WHEN]**  Check voting threshold for idea with 0 votes  
**[THEN]**  Idea State is Needs more votes  
**[WHEN]**  Check voting threshold for idea with Threshold number of votes  
**[THEN]**  Idea State is Under review  
**[WHEN]**  Check voting threshold for idea with Threshold+1 number of votes  
**[THEN]**  Idea State is Under review  
**[WHEN]**  Check voting threshold for idea with Threshold-1 number of votes  
**[THEN]**  Idea State is Needs more votes  

### Notifications Test
**[SCENARIO #0004]** Check proper record visibility on Notifications page; and Notifications page actions  
**[GIVEN]** *Idea Evidence Header Table* with 4 Ideas, with States: Under review, Under review, Needs more votes, Under review   
**[WHEN]**  Approve Idea  
**[THEN]**  Action completes without error  
**[WHEN]**  Disapprove  
**[THEN]**  Action completes without error  
**[WHEN]**  Mark Idea as completed  
**[THEN]**  Action completes without error  
**[WHEN]**  Go to Idea with State Needs more votes on Notifications page  
**[THEN]**  Record not found  

### Invalid Vote Actions Test
**[SCENARIO #0005]** Check impossibility of multiple voting/vote removal  
**[GIVEN]** *Idea Evidence Header Table* with one Idea  
**[WHEN]**  Vote for Idea multiple times  
**[THEN]**  Actions throws error message  
**[WHEN]**  Remove vote from Idea multiple times  
**[THEN]**  Actions throws error message  

### Expired Idea Vote Addition
**[SCENARIO #0006]** Check impossibility of voting for Ideas with invalid States  
**[GIVEN]** *Idea Evidence Header Table* with Idea records with States: Completed, Planned, Rejected   
**[WHEN]**  Vote for each Idea  
**[THEN]**  Actions throws error message  
**[THEN]**  Number of votes stays the same  
 
### Expired Idea Vote Deletion
**[SCENARIO #0007]** Check impossibility of removing votes from Ideas with invalid States  
**[GIVEN]** *Idea Evidence Header Table* with Idea records with States: Completed, Planned, Rejected   
**[WHEN]**  Vote for 3 new Ideas, change their States to wanted values, remove vote from each Idea  
**[THEN]**  Actions throws error message  
**[THEN]**  Number of votes stays the same  

### Expired Idea Vote Addition
**[SCENARIO #0008]** Check proper Votes Needed to Review field values for Threshold and marginal values    
**[GIVEN]** *Idea Evidence Header Table* with Idea with 0 votes  
**[THEN]**  Votes needed to Review equal to Threshold  
**[GIVEN]** *Idea Evidence Header Table* with Idea with Threshold votes  
**[THEN]**  Votes needed to Review equal to 0  
**[GIVEN]** *Idea Evidence Header Table* with Idea with Threshold+1 votes  
**[THEN]**  Votes needed to Review equal to 0  
**[GIVEN]** *Idea Evidence Header Table* with Idea with Threshold-1 votes  
**[THEN]**  Votes needed to Review equal to 1  



