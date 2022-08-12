//%attributes = {}
If (False:C215)
	//Project Method Name:      Menus
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
	C_BOOLEAN:C305(<>MenuFront)
	C_LONGINT:C283(<>MenuProc; $_l_BarProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menus")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
Menu_Record("Menus"; "Menus")
//If (◊SinProc=False)
BRING TO FRONT:C326(<>MenuProc)
<>MenuFront:=True:C214
$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
If ($_l_BarProcess>0)
	POST OUTSIDE CALL:C329($_l_BarProcess)
End if 
//End if
ERR_MethodTrackerReturn("Menus"; $_t_oldMethodName)
