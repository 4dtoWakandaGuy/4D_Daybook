If (False:C215)
	//object Name: [COMPANIES]Company_In.Variable80
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_objectVIsible)
	C_LONGINT:C283(B_ClipboardButton; WS_l_Bdetail; WS_l_Bname)
	C_PICTURE:C286(COM_pic_ClipBoardPICT)
	C_TEXT:C284(<>Forename; <>Surname; $_t_oldMethodName; WS_t_Label1; WS_t_Label2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.oNameDetails"; Form event code:C388)
$_bo_objectVIsible:=OBJECT Get visible:C1075(*; "oContactTitle")

OBJECT SET VISIBLE:C603(*; "oContactTitle"; (Not:C34($_bo_objectVIsible)))
OBJECT SET VISIBLE:C603(*; "oContactForename"; (Not:C34($_bo_objectVIsible)))
OBJECT SET VISIBLE:C603(*; "oContactSurname"; (Not:C34($_bo_objectVIsible)))
OBJECT SET VISIBLE:C603(*; "oContactName"; ($_bo_objectVIsible))

OBJECT SET TITLE:C194(*; "oContactTitleLabel"; WS_t_Label2+" :")
OBJECT SET TITLE:C194(*; "oContactForenameLabel"; <>Forename+" :")
OBJECT SET TITLE:C194(*; "oContactSurnameLabel"; <>Surname+" :")

OBJECT SET VISIBLE:C603(*; "oContactTitleLabel"; (Not:C34($_bo_objectVIsible)))
OBJECT SET VISIBLE:C603(*; "oContactForenameLabel"; (Not:C34($_bo_objectVIsible)))
OBJECT SET VISIBLE:C603(*; "oContactSurnameLabel"; (Not:C34($_bo_objectVIsible)))
OBJECT SET VISIBLE:C603(*; "oContactNameLabel"; ($_bo_objectVIsible))


OBJECT SET VISIBLE:C603(*; "oClipboardPict"; ($_bo_objectVIsible))

OBJECT SET VISIBLE:C603(*; "oClipboardButton"; ($_bo_objectVIsible))

OBJECT SET ENABLED:C1123(*; "oClipboardButton"; ($_bo_objectVIsible))



ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.oNameDetails"; $_t_oldMethodName)
