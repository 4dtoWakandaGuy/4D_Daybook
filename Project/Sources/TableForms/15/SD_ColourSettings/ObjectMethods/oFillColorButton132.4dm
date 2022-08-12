If (False:C215)
	//object Name: [USER]SD_ColourSettings.Variable388
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Number)
	C_LONGINT:C283($_l_Blue; $_l_Green; $_l_Red)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD_ColourSettings.Variable388"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)  //get the name for the selected button
		$_l_Number:=Num:C11($_t_VariableName)
		If ($_l_Number>0)
			//AG 4DCOLOR TO RGB (($_l_Number-1);$_l_Red;$_l_Green;$_l_Blue)
			//CW SET RGB COLOR (SD_l_AgendaColourWell;$_l_Red;$_l_Green;$_l_Blue)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD_ColourSettings.Variable388"; $_t_oldMethodName)
