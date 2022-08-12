//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_DoubleClick
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
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283($_l_Parameter1; $_l_Parameter2; $_l_Parameter3; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_DoubleClick")
$_l_Parameter1:=$1
$_l_Parameter2:=$2
$_l_Parameter3:=$3
//$p:=$_l_Parameter1
//$p2:=0
//$p:=$p+$1
//$p2:=$_l_Parameter2
//$p3:=$3
If (<>SCPT_bo_NoAutoScripts=False:C215)
	//PLAY("Double-Click";0)
End if 
// PostClick (0;$p2;$p;$p3)
POST CLICK:C466($_l_Parameter2; $_l_Parameter1)
POST CLICK:C466($_l_Parameter2; $_l_Parameter1)
//PostClick (0;$p2;$p;$p3)
ERR_MethodTrackerReturn("Macro_DoubleClick"; $_t_oldMethodName)
