If (False:C215)
	//object Name: [MAILSORT_MAIL]Line_Listing.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vPPage)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [MAILSORT_MAIL].Line_Listing.Variable7"; Form event code:C388)
vPPage:="Page "+String:C10(Printing page:C275)
ERR_MethodTrackerReturn("OBJ [MAILSORT_MAIL].Line_Listing.Variable7"; $_t_oldMethodName)