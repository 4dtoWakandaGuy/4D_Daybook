//%attributes = {}
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 22/06/2009 10:45
	//Method Name: ERR_DocHandler
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("ERR_DocHandler")
//This is a special error handler. it is used when trying to open a document for the system. it will not display the error to the user
Case of 
	: (Error=-33)
		//NEED MORE SPACE
		If (Current user:C182="DESIGNER")
			Gen_Alert("THE DIRECTORY IS FULL, THE DOCUMENT CANNOT BE CREATED")
		End if 
		
	: (Error=-34)
		If (Current user:C182="DESIGNER")
			Gen_Alert("THE HARD DRIVE IS FULL, THE DOCUMENT CANNOT BE CREATED")
		End if 
	: (Error=-35)
		If (Current user:C182="DESIGNER")
			Gen_Alert("THE VOLUME DOES NOT EXIST, THE DOCUMENT CANNOT BE CREATED")
		End if 
	: (Error=-36)
		If (Current user:C182="DESIGNER")
			Gen_Alert("THERE IS A BAD BLOCK ON THE DISK")
		End if 
	: (Error=-37)
		If (Current user:C182="DESIGNER")
			Gen_Alert("THE VOLUME OR FILENAME IS BAD, THE DOCUMENT CANNOT BE CREATED")
		End if 
	: (Error=-38)
		If (Current user:C182="DESIGNER")
			Gen_Alert("TRYING TO READ OR RIGHT TO A FILE THAT IS OPEN")
		End if 
	: (Error=-39)
		If (Current user:C182="DESIGNER")
			Gen_Alert("LOGICAL END OF FILE REACHED")
		End if 
	: (Error=-40)
		If (Current user:C182="DESIGNER")
			Gen_Alert("ATTEMPT TO POSITION BEFORE THE START OF THE FILE")
		End if 
	: (Error=-41)
		If (Current user:C182="DESIGNER")
			Gen_Alert("INSUFFUCIENT MEMORT TO OPEN A NEW FILE")
		End if 
		
	: (Error=-42)
		If (Current user:C182="DESIGNER")
			Gen_Alert("TO MANY FILES OPEN AT THE SAME TIME")
		End if 
	: (Error=-43)
		If (Current user:C182="DESIGNER")
			Gen_Alert("FILE NOT FOUND")
		End if 
	: (Error=-44)
		If (Current user:C182="DESIGNER")
			Gen_Alert("VOLUME IS LOCKED")
		End if 
	: (Error=-45)
		If (Current user:C182="DESIGNER")
			Gen_Alert("FILE IS LOCKED")
		End if 
	: (Error=-46)
		If (Current user:C182="DESIGNER")
			Gen_Alert("VOLUME IS LOCKED BY AN APPLICATION")
		End if 
	: (Error=-47)
		If (Current user:C182="DESIGNER")
			Gen_Alert("TRYING TO ACCESS A FILE THAT IS DELETED")
		End if 
	: (Error=-48)
		If (Current user:C182="DESIGNER")
			Gen_Alert("TRYING TO RENAME  A FILE THAT IS DELETED")
		End if 
	: (Error=-49)
		If (Current user:C182="DESIGNER")
			Gen_Alert("TRYING TO OPEN A FILE THAT IS OPEN")
		End if 
	: (Error=-51)
		If (Current user:C182="DESIGNER")
			Gen_Alert("TRYING TO OPEN A FILE THAT IS OPEN")
			
		End if 
		
		
		
		
		
		
		
End case 

ERR_MethodTrackerReturn("ERR_DocHandler"; $_t_oldMethodName)