//%attributes = {}
If (False:C215)
	//Project Method Name:      Null
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Type)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Null")
//Null - tests whether a variable or field is blank or zero
$_l_Type:=Type:C295($1->)
$0:=False:C215
Case of 
	: (($_l_Type=0) | ($_l_Type=2) | ($_l_Type=24))
		If ($1->="")
			$0:=True:C214
		End if 
	: ($_l_Type=1) | (($_l_Type=8) | ($_l_Type=9) | ($_l_Type=11))
		If ($1->=0)
			$0:=True:C214
		End if 
		//test for space rubbish & reset to zero
		If (Not:C34(($1->=0) | ($1->>0) | ($1-><0)))
			//BEEP
			$1->:=0
		End if 
	: ($_l_Type=4)
		If ($1->=!00-00-00!)
			$0:=True:C214
		End if 
End case 
ERR_MethodTrackerReturn("Null"; $_t_oldMethodName)