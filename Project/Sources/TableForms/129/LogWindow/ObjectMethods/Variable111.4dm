If (False:C215)
	//object Name: [WEBSETUP_4D]LogWindow.Variable111
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($_ptr_Array1; $_ptr_Array2)
	C_TEXT:C284($_t_oldMethodName; LOG_t_LogType)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].LogWindow.Variable111"; Form event code:C388)


Case of 
		
	: (LOG_t_LogType="GetMacro")
		
		//$_ptr_Array1:=->◊MAC_ai_Get_LogMS
		// $_ptr_Array2:=->◊MAC_at_Get_LogDescription
		
	: (LOG_t_LogType="MacroText")
		
		//$_ptr_Array1:=->◊MAC_ai_Text_LogMS
		//$_ptr_Array2:=->◊MAC_at_Text_LogDescription
		
	: (LOG_t_LogType="LogSQL")
		
		//$_ptr_Array1:=->◊SQL_ai_Cmd_LogMS
		//$_ptr_Array2:=->◊SQL_at_Cmd_LogDescription
		//
	: (LOG_t_LogType="LogSELECT")
		
		//$_ptr_Array1:=->◊SQL_ai_Select_LogMS
		//$_ptr_Array2:=->◊SQL_at_Select_LogDescription
		
End case 

$_ti_DocumentRef:=DB_CreateDocument(""; "TXT")

If (OK=1)
	
	For ($_l_Index; 1; Size of array:C274($_ptr_Array1->))
		
		SEND PACKET:C103($_ti_DocumentRef; String:C10($_ptr_Array1->{$_l_Index})+Char:C90(9)+$_ptr_Array2->{$_l_Index}+Char:C90(13))
		
	End for 
	
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	
End if 
ERR_MethodTrackerReturn("OBJ:LogWindow,LOG_btn_Save"; $_t_oldMethodName)
