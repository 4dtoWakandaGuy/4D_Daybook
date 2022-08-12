If (False:C215)
	//object Name: [COMPANIES]dPath_Test.Variable11
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(xOK)
	C_TEXT:C284($_t_oldMethodName; vTitle3; vTitle4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.Variable11"; Form event code:C388)
If (vTitle3#"")
	Date_Test2(vTitle3)
	If (<>DB_d_CurrentDate>[USER:15]Limit Date:58)
		BEEP:C151
		vTitle4:="Not Accepted"
		vTitle3:=""
		GOTO OBJECT:C206(vTitle3)
		OBJECT SET ENABLED:C1123(xOK; False:C215)
	Else 
		vTitle4:=String:C10(([USER:15]Limit Date:58-<>DB_d_CurrentDate)+1)+" days remaining"
		vTitle3:=""
		OBJECT SET ENABLED:C1123(xOK; True:C214)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dPath_Test.Variable11"; $_t_oldMethodName)
