//%attributes = {}
If (False:C215)
	//Project Method Name:      INT_SelectSkins
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_LocalProcess)
	C_LONGINT:C283($_l_Process; $_l_WindowReference; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_Process)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INT_SelectSkins")
//NG July 2004
//This method will call up the skin selector
$_bo_LocalProcess:=False:C215
$_t_Process:=Process_Name(Current process:C322)
If ($_t_Process#"")
	If ($_t_Process[[1]]="$")
		$_bo_LocalProcess:=True:C214
	End if 
End if 
If ($_bo_LocalProcess)
	If (Count parameters:C259=0)
		$_l_Process:=New process:C317("INT_SelectSkins"; 32000; "Set Interface"; *)
		
	Else 
		$_l_Process:=New process:C317("INT_SelectSkins"; 32000; "Set Interface"; $1; $2; *)
	End if 
	
Else 
	
	If (Count parameters:C259=0)
		$_l_WindowReference:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; -1984)
	Else 
		$_l_WindowReference:=Open window:C153($1; $2; $1; $2; -1984)
	End if 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=$_l_WindowReference
	DIALOG:C40([USER:15]; "INT_SkinSelector")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
End if 
ERR_MethodTrackerReturn("INT_SelectSkins"; $_t_oldMethodName)