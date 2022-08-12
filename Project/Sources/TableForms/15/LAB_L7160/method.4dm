If (False:C215)
	//Table Form Method Name: [USER]LAB L7160
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>DataSize; $_l_event; $_l_LabelIndex)
	C_TEXT:C284($_t_oldMethodName; $_t_Value)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [USER].LAB L7160"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		Forms_SetFonts
		For ($_l_LabelIndex; 1; 21)
			$_t_Value:="LabDat"+String:C10($_l_LabelIndex)
			SetFontsByPointerParameter(<>DataSize; ""; 0; ->$_t_Value)
			
		End for 
End case 
ERR_MethodTrackerReturn("FM [USER].LAB L7160"; $_t_oldMethodName)
