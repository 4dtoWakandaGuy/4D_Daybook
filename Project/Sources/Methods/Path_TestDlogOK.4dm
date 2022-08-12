//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_TestDlogOK
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/09/2012 00:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(DB_d_ExpiryDateNEW)
	C_LONGINT:C283(xOK)
	C_TEXT:C284($_t_oldMethodName; DB_t_PathName; vTitle3; vTitle4; vTitle5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_TestDlogOK")
//Path_TestDlogOK
If (DB_t_PathName#"")
	DB_t_PathName:=DB_LICENCECODETEST(DB_t_PathName)
	
	If (DB_t_PathName="")
		GOTO OBJECT:C206(DB_t_PathName)
		vTitle5:="Not Accepted"
		OBJECT SET ENABLED:C1123(xOK; False:C215)
	Else 
		vTitle5:="Accepted"
		
		If (vTitle3#"")
			DB_ValidateDateCode(Vtitle3; DB_t_PathName)
			
			If (Current date:C33(*)>DB_d_ExpiryDateNEW)
				
				vTitle4:="Not Accepted"
				vTitle3:=""
				GOTO OBJECT:C206(vTitle3)
				OBJECT SET ENABLED:C1123(xOK; False:C215)
			Else 
				vTitle4:=String:C10((DB_d_ExpiryDateNEW-Current date:C33(*))+1)+" days remaining"
				vTitle3:=""
				OBJECT SET ENABLED:C1123(xOK; True:C214)
			End if 
		End if 
		If ((vTitle4#"Required") & (vTitle4#"Expired") & (vTitle4#"") & (vTitle4#"Not Accepted") & (vTitle5#"Not Accepted"))
			ACCEPT:C269
		Else 
			GOTO OBJECT:C206(vTitle3)
			OBJECT SET ENABLED:C1123(xOK; False:C215)
		End if 
	End if 
Else 
	vTitle5:="Required"
	GOTO OBJECT:C206(DB_t_PathName)
End if 
ERR_MethodTrackerReturn("Path_TestDlogOK"; $_t_oldMethodName)
