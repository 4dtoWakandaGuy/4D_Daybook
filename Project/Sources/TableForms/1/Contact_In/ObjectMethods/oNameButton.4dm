If (False:C215)
	//object Name: [CONTACTS]Contact_In.Invisible Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(WS_l_Bdetail; WS_l_Bname)
	C_TEXT:C284(<>Forename; <>Surname; $_t_oldMethodName; WS_t_Label1; WS_t_Label2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.Invisible Button1"; Form event code:C388)
OBJECT SET VISIBLE:C603([CONTACTS:1]Contact_Name:31; True:C214)
//OBJECT SET VISIBLE(WS_t_Label1;True)
//OBJECT SET VISIBLE(WS_t_Label2;False)
//OBJECT SET VISIBLE(<>Forename;False)
//OBJECT SET VISIBLE(<>Surname;False)
OBJECT SET TITLE:C194(*; "oContactNameLabel"; WS_t_Label1+" :")
OBJECT SET TITLE:C194(*; "oContactForenameLabel"; <>Forename+" :")
OBJECT SET TITLE:C194(*; "oContactSurnamLabel"; <>Surname+" :")
OBJECT SET VISIBLE:C603(*; "oContactForenameLabel"; False:C215)
OBJECT SET VISIBLE:C603(*; "oContactSurnamLabel"; False:C215)

OBJECT SET VISIBLE:C603([CONTACTS:1]Title:3; False:C215)
OBJECT SET VISIBLE:C603([CONTACTS:1]Forename:4; False:C215)
OBJECT SET VISIBLE:C603([CONTACTS:1]Surname:5; False:C215)

OBJECT SET ENABLED:C1123(*; "oNameButton"; False:C215)
OBJECT SET ENABLED:C1123(*; "odetailButton"; True:C214)
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.Invisible Button1"; $_t_oldMethodName)
