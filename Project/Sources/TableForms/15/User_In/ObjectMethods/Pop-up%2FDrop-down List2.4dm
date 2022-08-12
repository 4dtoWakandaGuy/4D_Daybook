If (False:C215)
	//object Name: [USER]User_In.Pop-up%2FDrop-down List2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAT_at_ImageNameConvention;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; CAT_t_aImagenames; CAT_t_PictureNaming)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Pop-up/Drop-down List2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CAT_at_ImageNameConvention>0)
			CAT_t_PictureNaming:=CAT_at_ImageNameConvention{CAT_at_ImageNameConvention}
			CAT_t_aImagenames:=CAT_t_PictureNaming
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Pop-up/Drop-down List2"; $_t_oldMethodName)
