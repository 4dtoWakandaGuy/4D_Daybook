//%attributes = {}
If (False:C215)
	//Project Method Name:      EMAILupdateattachmentlocation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PER_t_CurrentUserName; $_t_oldMethodName; $_t_Owner)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EMAILupdateattachmentlocation")
If (([EMAIL_ATTACHMENTS:103]Location:6="") | ([EMAIL_ATTACHMENTS:103]Location:6="Unknown"))  //THIS IS SET BY A TRIGGER ON SAVING A NEW RECORD
	$_t_Owner:=Current system user:C484
	If ($_t_Owner="")
		$_t_Owner:=<>PER_t_CurrentUserName
	End if 
	[EMAIL_ATTACHMENTS:103]Location:6:=$_t_Owner
End if 
ERR_MethodTrackerReturn("EMAILupdateattachmentlocation"; $_t_oldMethodName)