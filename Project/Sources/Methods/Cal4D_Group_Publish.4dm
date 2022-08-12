//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Group_Publish
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2010 16:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordID; $_l_windowReference; $0; $1)
	C_POINTER:C301(<>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_Publish")

$_l_RecordID:=$1
Cal4D_Init
Cal4D_Group_LoadRecord($_l_RecordID; "*")

$_l_windowReference:=Open form window:C675("Cal4D_Publish_d"; Sheet form window:K39:12; Horizontally centered:K39:1; Vertically centered:K39:4)


DIALOG:C40("Cal4D_Publish_d")
If (OK=1)
	SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
	UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
End if 


$0:=$_l_RecordID
ERR_MethodTrackerReturn("Cal4D_Group_Publish"; $_t_oldMethodName)