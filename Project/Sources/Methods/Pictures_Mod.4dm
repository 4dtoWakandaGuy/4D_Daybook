//%attributes = {}
If (False:C215)
	//Project Method Name:      Pictures_Mod
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
	C_BOOLEAN:C305($_bo_AutoFInd)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Pictures_Mod")
$_t_SetName:=""
$_bo_AutoFInd:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFInd:=($2="TRUE")
	
	CREATE EMPTY SET:C140([PICTURES:85]; "PictureFound")
	QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$1)
	If (Records in selection:C76([PICTURES:85])>0)
		CREATE SET:C116([PICTURES:85]; "PictureFound")
	End if 
	$_t_SetName:="PictureFound"
End if 
Minor_Mod(->[PICTURES:85]; "Pictures"; ""; ""; $_t_SetName; $_bo_AutoFInd)
ERR_MethodTrackerReturn("Pictures_Mod"; $_t_oldMethodName)
