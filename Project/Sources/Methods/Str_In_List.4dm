//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_In_List
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
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_In_List")
READ ONLY:C145([SCRIPTS:80])
If (Count parameters:C259>=2)
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$2)
	If (Records in selection:C76([SCRIPTS:80])>0)
		$0:=([SCRIPTS:80]Recording_Text:4=("@"+$1+"@"))
	Else 
		$0:=False:C215
	End if 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Str_In_List"; $_t_oldMethodName)
