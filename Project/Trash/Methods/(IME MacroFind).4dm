//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME MacroFind
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
	C_BOOLEAN:C305($_bo_Allow; $0)
	C_TEXT:C284($_t_oldMethodName; $1; $2; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME MacroFind")
//IME MacroEdit - checks the Personnel_Id & goes to MacroEdit2 if allowed

$_bo_Allow:=False:C215

If (($1="Designer") & ($2="Haryana"))  //my way in - but should not be used if can go in normally
	$_bo_Allow:=True:C214
Else 
	//QUERY([USER];[USER]Name=$1)
	
	
	
End if 

If ($_bo_Allow)
	vText:="ROLLO"
	Macro2("ITO MacroFind")
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("IME MacroFind"; $_t_oldMethodName)