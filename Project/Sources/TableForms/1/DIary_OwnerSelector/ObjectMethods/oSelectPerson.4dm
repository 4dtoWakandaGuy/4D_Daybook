If (False:C215)
	//object Name: [CONTACTS]DIary_OwnerSelector.oSelectPerson
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 19:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_SelectPersonNames;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].DIary_OwnerSelector.oSelectPerson"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD_at_SelectPersonNames:=Self:C308->
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].DIary_OwnerSelector.oSelectPerson"; $_t_oldMethodName)
