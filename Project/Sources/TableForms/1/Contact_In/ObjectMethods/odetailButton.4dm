If (False:C215)
	//object Name: [CONTACTS]Contact_In.Variable46
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
	C_LONGINT:C283(B_ClipboardButton; WS_l_Bdetail; WS_l_Bname)
	C_PICTURE:C286(COM_pic_ClipBoardPICT)
	C_TEXT:C284(<>Forename; <>Surname; $_t_oldMethodName; WS_t_Label1; WS_t_Label2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.Variable46"; Form event code:C388)
OBJECT SET VISIBLE:C603([CONTACTS:1]Contact_Name:31; False:C215)
//OBJECT SET VISIBLE(WS_t_Label1;False)
//OBJECT SET VISIBLE(WS_t_Label2;True)
OBJECT SET TITLE:C194(*; "oContactNameLabel"; WS_t_Label2+" :")
OBJECT SET VISIBLE:C603(*; "oContactForenameLabel"; True:C214)
OBJECT SET VISIBLE:C603(*; "oContactSurnamLabel"; True:C214)

//OBJECT SET VISIBLE(<>Forename;True)
//OBJECT SET VISIBLE(<>Surname;True)
OBJECT SET VISIBLE:C603([CONTACTS:1]Title:3; True:C214)
OBJECT SET VISIBLE:C603([CONTACTS:1]Forename:4; True:C214)
OBJECT SET VISIBLE:C603([CONTACTS:1]Surname:5; True:C214)

OBJECT SET ENABLED:C1123(*; "oNameButton"; True:C214)
OBJECT SET ENABLED:C1123(*; "odetailButton"; False:C215)
OBJECT SET VISIBLE:C603(COM_pic_ClipBoardPICT; False:C215)
OBJECT SET VISIBLE:C603(B_ClipboardButton; False:C215)
OBJECT SET ENABLED:C1123(B_ClipBoardButton; True:C214)
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.Variable46"; $_t_oldMethodName)
