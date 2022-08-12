If (False:C215)
	//object Name: [USER]SD_ColourSettings.Variable751
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 12:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Blue; $_l_event; $_l_FieldNumber; $_l_Green; $_l_Number; $_l_Red; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; SD_t_CurrentSelectedActionCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD_ColourSettings.Variable751"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD_t_CurrentSelectedActionCode#"")
			RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)  //get the name for the selected button
			$_l_Number:=Num:C11($_t_VariableName)
			If ($_l_Number>0)
				//AG 4DCOLOR TO RGB (($_l_Number-1);$_l_Red;$_l_Green;$_l_Blue)
				//CW SET RGB COLOR (SD_l_AgendaColourWell2;$_l_Red;$_l_Green;$_l_Blue)
				//C`W Get rgb color (SD_l_AgendaColourWell;$_l_Red;$_l_Green;$_l_Blue)
				If ($_l_Red=0) & ($_l_Green=0) & ($_l_Blue=0)
					If ($_l_Number<=8)
						$_l_Number:=$_l_Number+8
						
					Else 
						$_l_Number:=$_l_Number-8
					End if 
					//AG 4DCOLOR TO RGB (($_l_Number-1);$_l_Red;$_l_Green;$_l_Blue)
					//CW SET RGB COLOR (SD_l_AgendaColourWell;$_l_Red;$_l_Green;$_l_Blue)
				End if 
				
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD_ColourSettings.Variable751"; $_t_oldMethodName)
