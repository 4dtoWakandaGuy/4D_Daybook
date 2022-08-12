//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_IO
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
	C_TEXT:C284($_t_oldMethodName; vTitle; vTitle2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_IO")
//Trans_IO
Start_Process
vTitle:="VAT Listing"
vTitle2:="VAT Listing"
Trans_List
ERR_MethodTrackerReturn("Trans_IO"; $_t_oldMethodName)