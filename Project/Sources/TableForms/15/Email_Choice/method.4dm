If (False:C215)
	//Table Form Method Name: [USER]Email_Choice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>DOC_at_EmailChoices;0)
	//ARRAY TEXT(DOC_at_EmailChoices;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_WIndowBottom; $_l_WindowHeight; $_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop; DOC_l_CallEvent)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Email_Choice"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Email_Choice")
		ARRAY TEXT:C222(DOC_at_EmailChoices; 0)
		COPY ARRAY:C226(<>DOC_at_EmailChoices; DOC_at_EmailChoices)
		$_l_WindowHeight:=Size of array:C274(DOC_at_EmailChoices)*13
		If ($_l_WindowHeight>150)
			$_l_WindowHeight:=50
		End if 
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
		SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowTop+$_l_WindowHeight)
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (DOC_l_CallEvent=0)
				COPY ARRAY:C226(<>DOC_at_EmailChoices; DOC_at_EmailChoices)
				$_l_WindowHeight:=Size of array:C274(DOC_at_EmailChoices)*13
				If ($_l_WindowHeight>150)
					$_l_WindowHeight:=50
				End if 
				GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
				SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowTop+$_l_WindowHeight)
			: (DOC_l_CallEvent=1)
				//end process
				DOC_l_CallEvent:=0
				CANCEL:C270
		End case 
		
		
End case 
ERR_MethodTrackerReturn("FM [USER].Email_Choice"; $_t_oldMethodName)
