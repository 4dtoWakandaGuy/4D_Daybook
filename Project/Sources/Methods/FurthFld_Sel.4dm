//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_Sel
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
	C_LONGINT:C283(xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_Sel")
//FurthFld_Sel
$_t_Search:=Gen_Search("Unique Code or Field Name to Find:"; ""; "Find")
If (OK=1)
	If (xNext=0)
		If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
			ALL RECORDS:C47([CUSTOM_FIELDS:98])
		Else 
			$_t_SearchAt:=Sel_AtSign($_t_Search)
			Sel_NoAtAt(->[CUSTOM_FIELDS:98]; ->[CUSTOM_FIELDS:98]Unique_Code:2; $_t_Search; $_t_SearchAt)
			If (Records in selection:C76([CUSTOM_FIELDS:98])=0)
				QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=$_t_SearchAt)
			End if 
		End if 
	Else 
		QUERY:C277([CUSTOM_FIELDS:98])
	End if 
End if 
ERR_MethodTrackerReturn("FurthFld_Sel"; $_t_oldMethodName)