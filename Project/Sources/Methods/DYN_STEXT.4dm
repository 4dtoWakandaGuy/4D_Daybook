//%attributes = {}
If (False:C215)
	//Project Method Name:      DYN_STEXT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DYN_STEXT")
//This method gets the events into a string array
If (Count parameters:C259>=1)
	If (Count parameters:C259>=2)
		
		ARRAY TEXT:C222($2->; 0)
	End if 
	//it would be nicer if i got the events constants from the resource--but this will do for now
	If ($1 ?? ((On Activate:K2:9)-32))
		
		APPEND TO ARRAY:C911($2->; "On Activate")
	End if 
	If ($1 ?? ((On After Edit:K2:43)-32))
		APPEND TO ARRAY:C911($2->; "On after Edit")
	End if 
	If ($1 ?? ((On After Keystroke:K2:26)-32))
		APPEND TO ARRAY:C911($2->; "On after keystroke")
	End if 
	If ($1 ?? ((On After Sort:K2:28)-32))
		APPEND TO ARRAY:C911($2->; "On afterSort")
	End if 
	If ($1 ?? ((On Alternative Click:K2:36)-32))
		APPEND TO ARRAY:C911($2->; "On Arrow Click")
	End if 
	If ($1 ?? ((On Before Data Entry:K2:39)-32))
		APPEND TO ARRAY:C911($2->; "On Before Data Entry")
	End if 
	If ($1 ?? ((On Before Keystroke:K2:6)-32))
		APPEND TO ARRAY:C911($2->; "On Before Keystroke")
	End if 
	If ($1 ?? ((On Clicked:K2:4)-32))
		APPEND TO ARRAY:C911($2->; "On Clicked")
	End if 
	If ($1 ?? ((On Close Box:K2:21)-32))
		APPEND TO ARRAY:C911($2->; "On Close Box")
	End if 
	If ($1 ?? ((On Collapse:K2:42)-32))
		APPEND TO ARRAY:C911($2->; "On Collapse")
	End if 
	If ($1 ?? ((On Column Moved:K2:30)-32))
		APPEND TO ARRAY:C911($2->; "On Column moved")
	End if 
	If ($1 ?? ((On Column Resize:K2:31)-32))
		
		APPEND TO ARRAY:C911($2->; "On Column Resize")
	End if 
	If ($1 ?? ((On Data Change:K2:15)-32))
		APPEND TO ARRAY:C911($2->; "On data change")
	End if 
	If ($1 ?? ((On Deactivate:K2:10)-32))
		APPEND TO ARRAY:C911($2->; "On Deactivate")
	End if 
	If ($1 ?? ((On Display Detail:K2:22)-32))
		APPEND TO ARRAY:C911($2->; "On Display Detail")
	End if 
	If ($1 ?? ((On Double Clicked:K2:5)-32))
		APPEND TO ARRAY:C911($2->; "On Double Clicked")
	End if 
	If ($1 ?? ((On Drag Over:K2:13)-32))
		APPEND TO ARRAY:C911($2->; "On Drag Over")
	End if 
	If ($1 ?? ((On Drop:K2:12)-32))
		APPEND TO ARRAY:C911($2->; "On Drop")
	End if 
	If ($1 ?? ((On Expand:K2:41)-32))
		APPEND TO ARRAY:C911($2->; "On Expand")
	End if 
	If ($1 ?? ((On Getting Focus:K2:7)-32))
		APPEND TO ARRAY:C911($2->; "On Getting Focus")
	End if 
	If ($1 ?? ((On Header:K2:17)-32))
		APPEND TO ARRAY:C911($2->; "On Header")
	End if 
	If ($1 ?? ((On Header Click:K2:40)-32))
		APPEND TO ARRAY:C911($2->; "On Header Click")
	End if 
	If ($1 ?? ((On Load:K2:1)-32))
		
		APPEND TO ARRAY:C911($2->; "On Load")
	End if 
	If ($1 ?? ((On Load Record:K2:38)-32))
		APPEND TO ARRAY:C911($2->; "On Load Record")
	End if 
	If ($1 ?? ((On Long Click:K2:37)-32))
		APPEND TO ARRAY:C911($2->; "On Long Click")
	End if 
	If ($1 ?? ((On Losing Focus:K2:8)-32))
		APPEND TO ARRAY:C911($2->; "On Losing Focus")
	End if 
	If ($1 ?? ((On Menu Selected:K2:14)-32))
		APPEND TO ARRAY:C911($2->; "On Menu Selected")
	End if 
	If ($1 ?? ((On Mouse Enter:K2:33)-32))
		APPEND TO ARRAY:C911($2->; "On Mouse Enter")
		
	End if 
	If ($1 ?? ((On Mouse Leave:K2:34)-32))
		APPEND TO ARRAY:C911($2->; "On Mouse Leave")
	End if 
	If ($1 ?? ((On Mouse Move:K2:35)-32))
		APPEND TO ARRAY:C911($2->; "On Mouse Move")
	End if 
	If ($1 ?? ((On Open Detail:K2:23)-32))
		APPEND TO ARRAY:C911($2->; "On Open Detail")
	End if 
	If ($1 ?? ((On Outside Call:K2:11)-32))
		APPEND TO ARRAY:C911($2->; "On Outside Call")
	End if 
	If ($1 ?? ((On Plug in Area:K2:16)-32))
		APPEND TO ARRAY:C911($2->; "On Plug in Area")
		
	End if 
	If ($1 ?? ((On Printing Break:K2:19)-32))
		APPEND TO ARRAY:C911($2->; "On Printing Break")
	End if 
	If ($1 ?? ((On Printing Detail:K2:18)-32))
		APPEND TO ARRAY:C911($2->; "On printing Detail")
	End if 
	
	If ($1 ?? ((On Printing Footer:K2:20)-32))
		APPEND TO ARRAY:C911($2->; "On printing Footer")
	End if 
	If ($1 ?? ((On Resize:K2:27)-32))
		APPEND TO ARRAY:C911($2->; "On Resize")
	End if 
	If ($1 ?? ((On Selection Change:K2:29)-32))
		APPEND TO ARRAY:C911($2->; "On Selection Change")
	End if 
	If ($1 ?? ((On Timer:K2:25)-32))
		APPEND TO ARRAY:C911($2->; "On Timer")
	End if 
	If ($1 ?? ((On Unload:K2:2)-32))
		APPEND TO ARRAY:C911($2->; "On Unload")
	End if 
	If ($1 ?? ((On Validate:K2:3)-32))
		APPEND TO ARRAY:C911($2->; "On Validate")
	End if 
End if 
// And that completes the scoring for Belgium!
ERR_MethodTrackerReturn("DYN_STEXT"; $_t_oldMethodName)