//%attributes = {}
If (False:C215)
	//Project Method Name:      InvStages_Mod
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
	C_BOOLEAN:C305($_bo_AutoFind)
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_oldMethodName; $_t_SetName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("InvStages_Mod")

$_t_SetName:=""
READ ONLY:C145([DOCUMENTS:7])
$_bo_AutoFind:=False:C215
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	CREATE EMPTY SET:C140([CREDIT_STAGES:54]; "CstagesFound")
	QUERY:C277([CREDIT_STAGES:54]; [CREDIT_STAGES:54]Stage_Code:1=$1)
	If (Records in selection:C76([CREDIT_STAGES:54])>0)
		CREATE SET:C116([CREDIT_STAGES:54]; "CstagesFound")
	End if 
	$_t_SetName:="CstagesFound"
End if 

Minor_ModName(->[CREDIT_STAGES:54]; "InvStages"; <>SYS_t_FormSizeName; "Credit Stages"; $_bo_AutoFind; $_t_SetName)
ERR_MethodTrackerReturn("InvStages_Mod"; $_t_oldMethodName)