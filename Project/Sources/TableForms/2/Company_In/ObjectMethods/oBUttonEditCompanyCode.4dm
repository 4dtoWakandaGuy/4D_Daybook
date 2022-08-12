If (False:C215)
	//object Name: [COMPANIES]Company_In.Variable26
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>PER_l_AccessLevel)
	C_TEXT:C284($_t_AdditionalComment; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Variable26"; Form event code:C388)
If (<>PER_l_AccessLevel<2)
	$_t_AdditionalComment:="This may result in losing data related to this record"
	CONFIRM:C162("Are you sure you wish to modify the company code?"+Char:C90(13)+$_t_AdditionalComment)
	If (ok=1)
		OBJECT SET ENTERABLE:C238([COMPANIES:2]Company_Code:1; True:C214)
		GOTO OBJECT:C206([COMPANIES:2]Company_Code:1)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Variable26"; $_t_oldMethodName)
