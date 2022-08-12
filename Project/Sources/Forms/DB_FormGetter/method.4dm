If (False:C215)
	//Project Form Method Name:      DB_FormGetter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/10/2013 09:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_FormNames; 0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; $_l_FormHeight; $_l_FormWidth; $_l_LastTableNumber; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; DB_l_CurrentForm; DB_l_CurrentTable; icancel)
	C_LONGINT:C283(iok)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; DB_t_CurrentformName; DB_T_FormName; DB_T_TableName)
	C_TIME:C306(DOC_ti_Output)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM DB_FormGetter"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1)  //& (Not(DB_bo_NoLoad))
		DB_bo_NoLoad:=True:C214
		iok:=0
		icancel:=0
		
		
		
		
		
		
		
		
		DOC_ti_Output:=Create document:C266(""; "TEXT")
		
		DB_l_CurrentTable:=0
		
		DB_T_TableName:=""
		DB_T_FormName:=""
		
		
		
		DB_l_CurrentForm:=1
		SET TIMER:C645(4*60)
	: ($_l_Event=On Timer:K2:25)
		SET TIMER:C645(0)
		
		$_l_LastTableNumber:=Get last table number:C254
		
		DB_bo_NoLoad:=True:C214
		If (Is table number valid:C999(DB_l_CurrentTable))
			ARRAY TEXT:C222($_at_FormNames; 0)
			$_Ptr_Table:=Table:C252(DB_l_CurrentTable)
			DB_T_TableName:=Table name:C256($_Ptr_Table)
			DB_T_FormName:=DB_t_CurrentformName
			
			FORM GET NAMES:C1167($_Ptr_Table->; $_at_FormNames; *)
			If (DB_l_CurrentForm<=Size of array:C274($_at_FormNames))
				ALL RECORDS:C47($_Ptr_Table->)
				REDUCE SELECTION:C351($_Ptr_Table->; 1)
				
				DB_t_CurrentformName:=$_at_FormNames{DB_l_CurrentForm}
				DB_T_FormName:=DB_t_CurrentformName
				
				If (Position:C15("COM_MiniView"; $_at_FormNames{DB_l_CurrentForm})>0)
					
					//TRACE
					
					
				End if 
				
				FORM GET PROPERTIES:C674($_Ptr_Table->; $_at_FormNames{DB_l_CurrentForm}; $_l_FormWidth; $_l_FormHeight)
				
				If ($_l_FormWidth<665)
					SET WINDOW RECT:C444(60; 60; 60+665; 60+$_l_FormHeight+40)
				Else 
					
					SET WINDOW RECT:C444(60; 60; 60+$_l_FormWidth; 60+$_l_FormHeight+40)
				End if 
				
				
				OBJECT GET COORDINATES:C663(*; "oSubform"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				
				OBJECT MOVE:C664(*; "oSubform"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_FormWidth; $_l_ObjectTop+$_l_FormHeight; *)
				
				
				
				
				
				OBJECT SET SUBFORM:C1138(*; "oSubform"; $_Ptr_Table->; $_at_FormNames{DB_l_CurrentForm}; $_at_FormNames{DB_l_CurrentForm})
				$_t_TableName:=Table name:C256($_Ptr_Table)
				
				SEND PACKET:C103(DOC_ti_Output; Char:C90(13)+"TABLE "+$_t_TableName+" FORM NAME "+$_at_FormNames{DB_l_CurrentForm}+Char:C90(13))
				DB_T_FormName:=$_at_FormNames{DB_l_CurrentForm}
				
				EXECUTE METHOD IN SUBFORM:C1085("oSubform"; "DB_GetFormObjectProperties"; *; True:C214)
				
				//end if
				DB_l_CurrentForm:=DB_l_CurrentForm+1
			Else 
				DB_l_CurrentForm:=1
				DB_l_CurrentTable:=DB_l_CurrentTable+1
			End if 
		Else 
			If (DB_l_CurrentTable=0)
				//we are dealing with project forms
				
				FORM GET NAMES:C1167($_at_FormNames; *)
				DB_T_TableName:="Project Forms"
				
				
				If (DB_l_CurrentForm<=Size of array:C274($_at_FormNames))
					DB_t_CurrentformName:=$_at_FormNames{DB_l_CurrentForm}
					If (DB_t_CurrentformName#"DB_FormGetter")
						DB_T_FormName:=DB_t_CurrentformName
						
						OBJECT SET SUBFORM:C1138(*; "oSubform"; $_at_FormNames{DB_l_CurrentForm}; $_at_FormNames{DB_l_CurrentForm})
						
						SEND PACKET:C103(DOC_ti_Output; Char:C90(13)+"Project Form"+" FORM NAME "+$_at_FormNames{DB_l_CurrentForm}+Char:C90(13))
						EXECUTE METHOD IN SUBFORM:C1085("oSubform"; "DB_GetFormObjectProperties"; *; True:C214)
					End if 
					
					//end if
					DB_l_CurrentForm:=DB_l_CurrentForm+1
					
				Else 
					DB_l_CurrentTable:=DB_l_CurrentTable+1
					DB_l_CurrentForm:=1
					
				End if 
				
				
			Else 
				
				DB_l_CurrentTable:=DB_l_CurrentTable+1
				
			End if 
		End if 
		If (DB_l_CurrentTable>$_l_LastTableNumber)
			//CANCEL
			
		End if 
		SET TIMER:C645(1*60)
		
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("FM DB_FormGetter"; $_t_oldMethodName)
